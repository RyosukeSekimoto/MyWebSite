package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.ItemDataBeans;

public class ItemDAO {

	/**
	 * 商品IDによる商品検索
	 * @param productId
	 * @return ProductDataBeans
	 */
	public ItemDataBeans getItemByItemId(int itemId) {

		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement("SELECT * FROM m_item WHERE id = ?");
			st.setInt(1, itemId);

			ResultSet rs = st.executeQuery();

			ItemDataBeans idb = new ItemDataBeans();

			if (rs.next()) {
				idb.setId(rs.getInt("id"));
				idb.setCategory(rs.getString("category_name"));
				idb.setName(rs.getString("name"));
				idb.setDetail(rs.getString("detail"));
				idb.setPrice(rs.getInt("price"));
				idb.setFirstFileName(rs.getString("first_file_name"));
				idb.setSecondFileName(rs.getString("second_file_name"));
				idb.setThirdFileName(rs.getString("third_file_name"));
				idb.setForthFileName(rs.getString("forth_file_name"));
			}

			System.out.println("searching product by productId has been completed");

			return idb;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
		}
		return null;
	}


	/**
	 * キーワード検索
	 * @param searchWord
	 * @param pageNum
	 * @param pageMaxItemCount
	 * @return
	 */
	public ArrayList<ItemDataBeans> getItemsBySearchWord(String searchWord, int pageNum, int pageMaxItemCount) {

		Connection con = null;
		PreparedStatement st = null;

		try {
			int startiItemNum = (pageNum - 1) * pageMaxItemCount;
			con = DBManager.getConnection();

			if (searchWord.length() == 0) {
				// 全検索
				st = con.prepareStatement("SELECT * FROM m_item ORDER BY id ASC LIMIT ?,? ");
				st.setInt(1, startiItemNum);
				st.setInt(2, pageMaxItemCount);
			} else {
				// 検索ワードで商品情報を検索
				st = con.prepareStatement("SELECT * FROM m_item WHERE name like ? ORDER BY id ASC LIMIT ?,? ");
				st.setString(1, "%" + searchWord + "%");
				st.setInt(2, startiItemNum);
				st.setInt(3, pageMaxItemCount);
			}

			ResultSet rs = st.executeQuery();
			ArrayList<ItemDataBeans> itemList = new ArrayList<ItemDataBeans>();

			while (rs.next()) {

				ItemDataBeans idb = new ItemDataBeans();

				idb.setId(rs.getInt("id"));
				idb.setCategory(rs.getString("category_name"));
				idb.setName(rs.getString("name"));
				idb.setDetail(rs.getString("detail"));
				idb.setPrice(rs.getInt("price"));
				idb.setFirstFileName(rs.getString("first_file_name"));
				idb.setSecondFileName(rs.getString("second_file_name"));
				idb.setThirdFileName(rs.getString("third_file_name"));
				idb.setForthFileName(rs.getString("forth_file_name"));
				itemList.add(idb);

			}
			System.out.println("get products by productName has been completed");
			return itemList;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
			}
		}
		return null;
	}

	/**
	 * 商品検索をもとに商品の総数を取得
	 *
	 * @param searchWord
	 * @return
	 */
	public double getItemCountByItemInfo(String searchWord) {

		Connection con = null;
		PreparedStatement st = null;

		try {
			con = DBManager.getConnection();

			if(searchWord.length() == 0) {
				st = con.prepareStatement("select count(*) as cnt from m_item");
			} else {
				st = con.prepareStatement("select count(*) as cnt from m_item where name like ?");
				st.setString(1, "%" + searchWord + "%");
			}

			ResultSet rs = st.executeQuery();
			double coung = 0.0;

			while (rs.next()) {
				coung = Double.parseDouble(rs.getString("cnt"));
			}

			return coung;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				if (con != null) {
					try {
	                    con.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                    return -1;
	                }
				}
			}
		}
		return -1;
	}

	/**
	 * カテゴリ別検索
	 * @param searchCategory
	 * @param pageNum
	 * @param pageMaxItemCount
	 * @return
	 */
	public ArrayList<ItemDataBeans> getItemsByCategory(String searchCategory, int pageNum, int pageMaxItemCount) {

		Connection con = null;
		PreparedStatement st = null;

		try {
			int startiItemNum = (pageNum - 1) * pageMaxItemCount;
			con = DBManager.getConnection();

			// 商品名検索
			st = con.prepareStatement("SELECT * FROM m_item WHERE category_name=?  ORDER BY id ASC LIMIT ?,? ");
			st.setString(1, searchCategory);
			st.setInt(2, startiItemNum);
			st.setInt(3, pageMaxItemCount);

			ResultSet rs = st.executeQuery();
			ArrayList<ItemDataBeans> itemList = new ArrayList<ItemDataBeans>();

			while (rs.next()) {

				ItemDataBeans idb = new ItemDataBeans();

				idb.setId(rs.getInt("id"));
				idb.setCategory(rs.getString("category_name"));
				idb.setName(rs.getString("name"));
				idb.setDetail(rs.getString("detail"));
				idb.setPrice(rs.getInt("price"));
				idb.setFirstFileName(rs.getString("first_file_name"));
				idb.setSecondFileName(rs.getString("second_file_name"));
				idb.setThirdFileName(rs.getString("third_file_name"));
				idb.setForthFileName(rs.getString("forth_file_name"));
				itemList.add(idb);

			}
			System.out.println("get products by category has been completed");
			return itemList;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
			}
		}
		return null;
	}

	/**
	 * カテゴリー別に商品の総数を取得
	 *
	 * @param searchCategory
	 * @return
	 */
	public double getItemCountByCate(String searchCategory) {

		Connection con = null;
		PreparedStatement st = null;

		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("select count(*) as cnt from m_item where category_name=?");

			st.setString(1, searchCategory);
			ResultSet rs = st.executeQuery();
			double coung = 0.0;
			while (rs.next()) {
				coung = Double.parseDouble(rs.getString("cnt"));
			}
			return coung;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				if (con != null) {
					try {
	                    con.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                    return -1;
	                }
				}
			}
		}
		return -1;
	}
}
