package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RankingDAO {

	/**
	 * 売り上げ個数順に商品を並び替え
	 * @return int[]
	 */
	public ArrayList<Integer> getItemIdBySales() {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement(
					"SELECT item_id, Sum(quantity) AS sales FROM t_buy_detail"
					+ " GROUP BY item_id"
					+ " ORDER BY sales DESC"
					+ " LIMIT 6");

			ResultSet rs = st.executeQuery();
			ArrayList<Integer> itemIdList = new ArrayList<Integer>();

			while (rs.next()) {
				itemIdList.add(rs.getInt("item_id"));
			}

			System.out.println("getting itemId by BuyQuantity has been completed");
			return itemIdList;

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
