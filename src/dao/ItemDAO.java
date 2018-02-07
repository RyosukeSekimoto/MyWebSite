package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.ItemDataBeans;
import model.SearchConditionBeans;

public class ItemDAO extends DaoUtil {

	/**
	 * 全商品を取得する
	 * @return
	 */
	public ArrayList<ItemDataBeans> getItemAll() {

		Connection conn = null;

		try {
			//データベースへの接続
			conn = DBManager.getConnection();

			//SELECT文を準備
			String sql = "SELECT * FROM m_item";

			// SELECTを実行し、結果表を取得
			PreparedStatement pStmt = conn.prepareStatement(sql);
			ResultSet rs = pStmt.executeQuery();
			ArrayList<ItemDataBeans> idbList = new ArrayList<ItemDataBeans>();

			//結果表に格納されたレコードの内容を取り出し、Userインスタンスに追加
			while (rs.next()) {

				ItemDataBeans idb = new ItemDataBeans();

				idb.setId(rs.getInt("id"));
				idb.setCategory(rs.getString("category_name"));
				idb.setName(rs.getString("item_name"));
				idb.setDetail(rs.getString("detail"));
				idb.setPrice(rs.getInt("price"));
				idb.setFirstFileName(rs.getString("first_file_name"));
				idb.setSecondFileName(rs.getString("second_file_name"));
				idb.setThirdFileName(rs.getString("third_file_name"));
				idb.setForthFileName(rs.getString("forth_file_name"));
				idb.setCreateDate(rs.getTimestamp("create_date"));
				idb.setUpdateDate(rs.getTimestamp("update_date"));

				idbList.add(idb);
			}
			System.out.println("Getting all item completed!");
			return idbList;

		} catch(SQLException e) {

			e.printStackTrace();

		} finally {
			// データベース切断
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }
		}
		return null;
	}

	/**
	 * 商品IDによる商品検索
	 * @param itemId
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
				idb.setName(rs.getString("item_name"));
				idb.setDetail(rs.getString("detail"));
				idb.setPrice(rs.getInt("price"));
				idb.setFirstFileName(rs.getString("first_file_name"));
				idb.setSecondFileName(rs.getString("second_file_name"));
				idb.setThirdFileName(rs.getString("third_file_name"));
				idb.setForthFileName(rs.getString("forth_file_name"));
				idb.setCreateDate(rs.getTimestamp("create_date"));
				idb.setUpdateDate(rs.getTimestamp("update_date"));
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
				st = con.prepareStatement("SELECT * FROM m_item"
						+ " WHERE item_name like ?"
						+ " OR category_name like ?"
						+ " OR detail like ?"
						+ " ORDER BY id ASC LIMIT ?,?");
				st.setString(1, "%" + searchWord + "%");
				st.setString(2, "%" + searchWord + "%");
				st.setString(3, "%" + searchWord + "%");
				st.setInt(4, startiItemNum);
				st.setInt(5, pageMaxItemCount);
			}

			ResultSet rs = st.executeQuery();
			ArrayList<ItemDataBeans> itemList = new ArrayList<ItemDataBeans>();

			while (rs.next()) {

				ItemDataBeans idb = new ItemDataBeans();

				idb.setId(rs.getInt("id"));
				idb.setCategory(rs.getString("category_name"));
				idb.setName(rs.getString("item_name"));
				idb.setDetail(rs.getString("detail"));
				idb.setPrice(rs.getInt("price"));
				idb.setFirstFileName(rs.getString("first_file_name"));
				idb.setSecondFileName(rs.getString("second_file_name"));
				idb.setThirdFileName(rs.getString("third_file_name"));
				idb.setForthFileName(rs.getString("forth_file_name"));
				idb.setCreateDate(rs.getTimestamp("create_date"));
				idb.setUpdateDate(rs.getTimestamp("update_date"));
				itemList.add(idb);

			}
			System.out.println("get items by keyword has been completed");
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
	 * キーワードをもとに商品の総数を取得
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
				st = con.prepareStatement("select count(*) as cnt from m_item"
						+ " where item_name like ?"
						+ " OR category_name like ?"
						+ " OR detail like ?");
				st.setString(1, "%" + searchWord + "%");
				st.setString(2, "%" + searchWord + "%");
				st.setString(3, "%" + searchWord + "%");
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
				idb.setName(rs.getString("item_name"));
				idb.setDetail(rs.getString("detail"));
				idb.setPrice(rs.getInt("price"));
				idb.setFirstFileName(rs.getString("first_file_name"));
				idb.setSecondFileName(rs.getString("second_file_name"));
				idb.setThirdFileName(rs.getString("third_file_name"));
				idb.setForthFileName(rs.getString("forth_file_name"));
				idb.setCreateDate(rs.getTimestamp("create_date"));
				idb.setUpdateDate(rs.getTimestamp("update_date"));
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

	/**
	 * 商品を検索する(引数に渡された値が空でないもののみ検索する)
	 * @param itemName
	 * @param categoryName
	 * @param createDateFrom
	 * @param createDateTo
	 * @param pageNum
	 * @param pageMaxItemCount
	 * @return 検索結果の商品リスト
	 */
	public ArrayList<ItemDataBeans> searchItem(String itemName, String categoryName, String createDateFrom, String createDateTo, int pageNum, int pageMaxUserCount) {

		Connection conn = null;
		ArrayList<ItemDataBeans> idbList = new ArrayList<ItemDataBeans>();

		try {
			int startUserNum = (pageNum - 1) * pageMaxUserCount;
			conn = DBManager.getConnection();

			//SQL文の基本形（検索条件なし）の用意
			String sql = "SELECT * FROM m_item";

			// 各種検索要件を設定してSQLを生成
			List<SearchConditionBeans> conditions = new ArrayList<SearchConditionBeans>();
			conditions.add(new SearchConditionBeans("item_name", itemName, WHERE_TYPE_LIKE_PARTIAL_MATCH));
			conditions.add(new SearchConditionBeans("category_name", categoryName, WHERE_TYPE_EQUAL));
			conditions.add(new SearchConditionBeans("create_date", createDateFrom, WHERE_TYPE_GENDER_OR_EQUAL));
			conditions.add(new SearchConditionBeans("create_date", createDateTo, WHERE_TYPE_LESS_OR_EQUAL));
			sql = addWhereCondition(sql, conditions);

			// IDの降順に表示
			sql += " order by id desc";

			// ページング用にリミットを指定する
			sql += " LIMIT " + startUserNum + "," + pageMaxUserCount;

			// TODO デバッグ用(納品時に消す)
			System.out.println(sql);

			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery();


			while (rs.next()) {

				ItemDataBeans idb = new ItemDataBeans();

				idb.setId(rs.getInt("id"));
				idb.setCategory(rs.getString("category_name"));
				idb.setName(rs.getString("item_name"));
				idb.setDetail(rs.getString("detail"));
				idb.setPrice(rs.getInt("price"));
				idb.setFirstFileName(rs.getString("first_file_name"));
				idb.setSecondFileName(rs.getString("second_file_name"));
				idb.setThirdFileName(rs.getString("third_file_name"));
				idb.setForthFileName(rs.getString("forth_file_name"));
				idb.setCreateDate(rs.getTimestamp("create_date"));
				idb.setUpdateDate(rs.getTimestamp("update_date"));

				idbList.add(idb);
			}

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			//データベース切断
			if(conn != null) {
				try {
					conn.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return idbList;
	}

	/**
	 * 検索結果のユーザー数を取得
	 * @param itemName
	 * @param categoryName
	 * @param createDateFrom
	 * @param createDateTo
	 * @return 検索結果の商品数
	 */
	public double getItemCountBySearch (String itemName, String categoryName, String createDateFrom, String createDateTo) {

		Connection conn = null;

		try {
			conn = DBManager.getConnection();

			//SQL文の基本形（検索条件なし）の用意
			String sql = "select count(*) as cnt from m_item";

			// 各種検索要件を設定してSQLを生成
			List<SearchConditionBeans> conditions = new ArrayList<SearchConditionBeans>();
			conditions.add(new SearchConditionBeans("item_name", itemName, WHERE_TYPE_LIKE_PARTIAL_MATCH));
			conditions.add(new SearchConditionBeans("category_name", categoryName, WHERE_TYPE_EQUAL));
			conditions.add(new SearchConditionBeans("create_date", createDateFrom, WHERE_TYPE_GENDER_OR_EQUAL));
			conditions.add(new SearchConditionBeans("create_date", createDateTo, WHERE_TYPE_LESS_OR_EQUAL));
			sql = addWhereCondition(sql, conditions);


			// TODO デバッグ用(納品時に消す)
			System.out.println(sql);

			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery();

			double coung = 0.0;

			while (rs.next()) {
				coung = Double.parseDouble(rs.getString("cnt"));
			}

			return coung;

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			//データベース切断
			if(conn != null) {
				try {
					conn.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return -1;
	}

	/**
	 * IDをもとに該当商品をデータベースから削除
	 * @param itemId 削除したい商品ID
	 */
	public void deleteItem(int itemId) {

		Connection conn = null;

		try {
			//データベースへ接続
			conn = DBManager.getConnection();

			//DELETE文を用意
			String sql = "DELETE FROM m_item WHERE id=?";

			//DELETEを実行
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, itemId);

			int resultNum = pStmt.executeUpdate();

			//追加された行数を出力
			System.out.println(resultNum);
			System.out.println("item has been deleted");

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			//データベース切断
			if(conn != null) {
				try {
					conn.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}


}
