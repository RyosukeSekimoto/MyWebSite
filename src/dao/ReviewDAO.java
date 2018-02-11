package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.ReviewDataBeans;

public class ReviewDAO {


	public void updateReviewById(ReviewDataBeans rdb, int reviewId) {

		Connection conn = null;

		try {
			//データベースへ接続
			conn = DBManager.getConnection();

			//UPDATE文を用意
			String sql = "UPDATE t_review SET title = ?, review_desc = ?, photo_desc = ?, photo_file_name = ?, update_date = ? WHERE id = ?";

			//UPDATEを実行
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, rdb.getTitle());
			pStmt.setString(2, rdb.getReviewDesc());
			pStmt.setString(3, rdb.getPhotoDesc());
			pStmt.setString(4, rdb.getPhotoFileName());
			pStmt.setTimestamp(5, rdb.getUpdateDate());
			pStmt.setInt(6, reviewId);

			int resultNum = pStmt.executeUpdate();

			//追加された行数を出力
			System.out.println(resultNum);
			System.out.println("updating review has completed");

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

	/**
	 * データの挿入処理を行う
	 * @param rdb 対応したデータを保持しているJavaBeans
	 */
	public void insertReview(ReviewDataBeans rdb) {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("INSERT INTO t_review(user_id, item_id, title, review_desc, photo_file_name, photo_desc, create_date, update_date) "
										+ "VALUES(?,?,?,?,?,?,?,?)");

			st.setInt(1, rdb.getUserId());
			st.setInt(2, rdb.getItemId());
			st.setString(3, rdb.getTitle());
			st.setString(4, rdb.getReviewDesc());
			st.setString(5, rdb.getPhotoFileName());
			st.setString(6, rdb.getPhotoDesc());
			st.setTimestamp(7, rdb.getCreateDate());
			st.setTimestamp(8, rdb.getUpdateDate());

			st.executeUpdate();
			System.out.println("inserting review has been completed");

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			// データベース切断
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
		}
	}

	/**
	 * 最新レビューを3件取得する
	 * @return ArrayList<ProductDataBeans> reviewList レビューのリスト
	 */
	public ArrayList<ReviewDataBeans> getLatestReviews() {

		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement(
					"SELECT * FROM t_review"
					+ " INNER JOIN t_user ON t_review.user_id = t_user.id"
					+ " INNER JOIN m_item ON t_review.item_id = m_item.id"
					+ " ORDER BY t_review.id DESC"
					+ " LIMIT 3");

			ResultSet rs = st.executeQuery();
			ArrayList<ReviewDataBeans> reviewList = new ArrayList<ReviewDataBeans>();

			while (rs.next()) {
				ReviewDataBeans review = new ReviewDataBeans();

				review.setId(rs.getInt("id"));
				review.setUserId(rs.getInt("user_id"));
				review.setItemId(rs.getInt("item_id"));
				review.setTitle(rs.getString("title"));
				review.setReviewDesc(rs.getString("review_desc"));
				review.setPhotoFileName(rs.getString("photo_file_name"));
				review.setPhotoDesc(rs.getString("photo_desc"));
				review.setCreateDate(rs.getTimestamp("create_date"));
				review.setUpdateDate(rs.getTimestamp("update_date"));
				review.setReviewerName(rs.getString("pet_name"));
				review.setReviewerFileName(rs.getString("file_name"));
				review.setItemName(rs.getString("item_name"));

				reviewList.add(review);
			}

			System.out.println("Getting Latest reviews has been completed");
			return reviewList;

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
	 * 商品IDによるレビュー検索
	 * @param itemId
	 * @return ArrayList<ProductDataBeans> reviewList
	 */
	public ArrayList<ReviewDataBeans> getReviewsByItemId(int itemId) {

		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement(
					"SELECT * FROM t_review"
					+ " INNER JOIN t_user ON t_review.user_id = t_user.id"
					+ " INNER JOIN m_item ON t_review.item_id = m_item.id"
					+ " WHERE t_review.item_id = ?"
					+ " ORDER BY t_review.id DESC");
			st.setInt(1, itemId);

			ResultSet rs = st.executeQuery();
			ArrayList<ReviewDataBeans> reviewList = new ArrayList<ReviewDataBeans>();

			while (rs.next()) {
				ReviewDataBeans review = new ReviewDataBeans();

				review.setId(rs.getInt("id"));
				review.setUserId(rs.getInt("user_id"));
				review.setItemId(rs.getInt("item_id"));
				review.setTitle(rs.getString("title"));
				review.setReviewDesc(rs.getString("review_desc"));
				review.setPhotoFileName(rs.getString("photo_file_name"));
				review.setPhotoDesc(rs.getString("photo_desc"));
				review.setCreateDate(rs.getTimestamp("create_date"));
				review.setUpdateDate(rs.getTimestamp("update_date"));
				review.setReviewerName(rs.getString("pet_name"));
				review.setReviewerFileName(rs.getString("file_name"));
				review.setItemName(rs.getString("item_name"));

				reviewList.add(review);
			}

			System.out.println("searching review by itemId has been completed");
			return reviewList;

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
	 * ユーザーIDによるレビュー検索
	 * @param userId
	 * @return ArrayList<ProductDataBeans> reviewList
	 */
	public ArrayList<ReviewDataBeans> getReviewsByUserId(int userId) {

		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement(
					"SELECT * FROM t_review"
					+ " INNER JOIN t_user ON t_review.user_id = t_user.id"
					+ " INNER JOIN m_item ON t_review.item_id = m_item.id"
					+ " WHERE t_review.user_id = ?"
					+ " ORDER BY t_review.id DESC");
			st.setInt(1, userId);

			ResultSet rs = st.executeQuery();
			ArrayList<ReviewDataBeans> reviewList = new ArrayList<ReviewDataBeans>();

			while (rs.next()) {
				ReviewDataBeans review = new ReviewDataBeans();

				review.setId(rs.getInt("id"));
				review.setUserId(rs.getInt("user_id"));
				review.setItemId(rs.getInt("item_id"));
				review.setTitle(rs.getString("title"));
				review.setReviewDesc(rs.getString("review_desc"));
				review.setPhotoFileName(rs.getString("photo_file_name"));
				review.setPhotoDesc(rs.getString("photo_desc"));
				review.setCreateDate(rs.getTimestamp("create_date"));
				review.setUpdateDate(rs.getTimestamp("update_date"));
				review.setReviewerName(rs.getString("pet_name"));
				review.setReviewerFileName(rs.getString("file_name"));
				review.setItemName(rs.getString("item_name"));

				reviewList.add(review);
			}

			System.out.println("searching review by userId has been completed");
			return reviewList;

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
	 * レビューIDによるレビュー検索
	 * @param reviewId
	 * @return ReviewDataBeans review
	 */
	public ReviewDataBeans getReviewsById(int reviewId) {

		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement(
					"SELECT * FROM t_review"
					+ " INNER JOIN t_user ON t_review.user_id = t_user.id"
					+ " INNER JOIN m_item ON t_review.item_id = m_item.id"
					+ " WHERE t_review.id = ?");
			st.setInt(1, reviewId);

			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				ReviewDataBeans review = new ReviewDataBeans();

				review.setId(rs.getInt("id"));
				review.setUserId(rs.getInt("user_id"));
				review.setItemId(rs.getInt("item_id"));
				review.setTitle(rs.getString("title"));
				review.setReviewDesc(rs.getString("review_desc"));
				review.setPhotoFileName(rs.getString("photo_file_name"));
				review.setPhotoDesc(rs.getString("photo_desc"));
				review.setCreateDate(rs.getTimestamp("create_date"));
				review.setUpdateDate(rs.getTimestamp("update_date"));
				review.setReviewerName(rs.getString("pet_name"));
				review.setReviewerFileName(rs.getString("file_name"));
				review.setItemName(rs.getString("item_name"));

				System.out.println("searching review by reviewId has been completed");
				return review;
			}

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
	 * レビューIDをもとに該当レビューをデータベースから削除
	 * @param reviewId	削除したいレビューのID
	 */
	public void deleteReview(int reviewId) {

		Connection conn = null;

		try {
			//データベースへ接続
			conn = DBManager.getConnection();

			//DELETE文を用意
			String sql = "DELETE FROM t_review WHERE id=?";

			//DELETEを実行
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, reviewId);

			int resultNum = pStmt.executeUpdate();

			//追加された行数を出力
			System.out.println(resultNum);
			System.out.println("review has been deleted");

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
