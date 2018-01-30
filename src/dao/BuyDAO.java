package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import model.BuyDataBeans;

public class BuyDAO {

	/**
	 * 購入情報登録処理
	 * @param bdb 購入情報
	 */
	public int insertBuy(BuyDataBeans bdb) {
		Connection con = null;
		PreparedStatement st = null;
		int autoIncKey = -1;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement(
					"INSERT INTO t_buy(user_id, total_price, delivery_method_id, create_date) VALUES(?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			st.setInt(1, bdb.getUserId());
			st.setInt(2, bdb.getTotalPrice());
			st.setInt(3, bdb.getDeliveryMethodId());
			st.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			st.executeUpdate();

			ResultSet rs = st.getGeneratedKeys();
			if (rs.next()) {
				autoIncKey = rs.getInt(1);
			}
			System.out.println("inserting buy-datas has been completed");

			return autoIncKey;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			//データベース切断
			if(con != null) {
				try {
					con.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return autoIncKey;
	}
}
