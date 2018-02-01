package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.BuyDetailDataBeans;

public class BuyDetailDAO {

	/**
	 * 購入詳細登録処理
	 * @param bddb BuyDetailDataBeans
	 */
	public void insertBuyDetail(BuyDetailDataBeans bddb) {

		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement(
					"INSERT INTO t_buy_detail(buy_id, item_id, item_name, item_price, quantity) VALUES(?,?,?,?,?)");
			st.setInt(1, bddb.getBuyId());
			st.setInt(2, bddb.getItemId());
			st.setString(3, bddb.getItemName());
			st.setInt(4, bddb.getItemPrice());
			st.setInt(5, bddb.getQuantity());
			st.executeUpdate();
			System.out.println("inserting BuyDetail has been completed");

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
	}

	/**
	 * ユーザーIDによる購入情報検索
	 * @param buyId
	 * @return {BuyDataDetailBeans}
	 */
	public ArrayList<BuyDetailDataBeans> getBuyDataBeansListByBuyId(int buyId) {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement("SELECT * FROM t_buy_detail WHERE buy_id = ?");
			st.setInt(1, buyId);

			ResultSet rs = st.executeQuery();
			ArrayList<BuyDetailDataBeans> buyDetailList = new ArrayList<BuyDetailDataBeans>();

			while (rs.next()) {
				BuyDetailDataBeans bddb = new BuyDetailDataBeans();
				bddb.setId(rs.getInt("id"));
				bddb.setBuyId(rs.getInt("buy_id"));
				bddb.setItemId(rs.getInt("item_id"));
				bddb.setItemName(rs.getString("item_name"));
				bddb.setItemPrice(rs.getInt("item_price"));
				buyDetailList.add(bddb);
			}

			System.out.println("searching BuyDataBeansList by BuyID has been completed");
			return buyDetailList;

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
		return null;
	}
}
