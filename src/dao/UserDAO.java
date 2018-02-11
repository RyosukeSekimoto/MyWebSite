package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Helper;
import model.SearchConditionBeans;
import model.UserDataBeans;

public class UserDAO extends DaoUtil {

	/**
	 * データの挿入処理を行う
	 * @param udb 対応したデータを保持しているJavaBeans
	 */
	public void insertUser(UserDataBeans udb) {

		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("INSERT INTO t_user(name, nickname, address, login_id, password, create_date, update_date, pet_name, pet_type, pet_birth_date, pet_sex, pet_desc, file_name)"
										+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");

			st.setString(1, udb.getName());
			st.setString(2, udb.getNickname());
			st.setString(3, udb.getAddress());
			st.setString(4, udb.getLoginId());
			st.setString(5, Helper.encryption(udb.getPass()));
			st.setTimestamp(6, udb.getCreateDate());
			st.setTimestamp(7, udb.getUpdateDate());
			st.setString(8, udb.getPetName());
			st.setString(9, udb.getPetType());
			st.setDate(10, udb.getPetBirthDate());
			st.setString(11, udb.getPetSex());
			st.setString(12, udb.getPetDesc());
			st.setString(13, udb.getFileName());

			st.executeUpdate();
			System.out.println("inserting user has been completed");

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
	 * データの更新処理を行う
	 * @param udb 対応したデータを保持しているJavaBeans
	 */
	public void updateUserProfile(UserDataBeans udb) {

		Connection conn = null;

		try {
			//データベースへ接続
			conn = DBManager.getConnection();

			//UPDATE文を用意
			String sql = "UPDATE t_user SET name = ?, nickname = ?, address = ?, login_id = ?, password = ?, update_date = ?,"
						 + "pet_name = ?, pet_type = ?, pet_birth_date = ?, pet_sex = ?, pet_desc = ?, file_name = ? WHERE id = ?";

			//UPDATEを実行
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, udb.getName());
			pStmt.setString(2, udb.getNickname());
			pStmt.setString(3, udb.getAddress());
			pStmt.setString(4, udb.getLoginId());
			pStmt.setString(5, udb.getPass());
			pStmt.setTimestamp(6, udb.getUpdateDate());
			pStmt.setString(7, udb.getPetName());
			pStmt.setString(8, udb.getPetType());
			pStmt.setDate(9, udb.getPetBirthDate());
			pStmt.setString(10, udb.getPetSex());
			pStmt.setString(11, udb.getPetDesc());
			pStmt.setString(12, udb.getFileName());
			pStmt.setInt(13, udb.getId());

			int resultNum = pStmt.executeUpdate();

			//追加された行数を出力
			System.out.println(resultNum);
			System.out.println("updating user has completed");

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
	 * ログインIDをもとに該当ユーザーを検索して返す
	 * @param targetId	探したいユーザーのログインID
	 * @return UserDataBeans 該当するユーザーのbeans
	 */
	public UserDataBeans findByLoginId(String targetId) {

		Connection conn = null;

		try {
			//データベースへの接続
			conn = DBManager.getConnection();

			//SELECT文を準備
			String sql = "SELECT * FROM t_user WHERE login_id = ?";

			// SELECTを実行し、結果表を取得
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, targetId);
			ResultSet rs = pStmt.executeQuery();

			//結果表に格納されたレコードの内容を取り出し、Userインスタンスに追加
			if (rs.next()) {

				UserDataBeans udb = new UserDataBeans();

				udb.setId(rs.getInt("id"));
				udb.setName(rs.getString("name"));
				udb.setNickname(rs.getString("nickname"));
				udb.setAddress(rs.getString("address"));
				udb.setLoginId(rs.getString("login_id"));
				udb.setPass(rs.getString("password"));
				udb.setCreateDate(rs.getTimestamp("create_date"));
				udb.setUpdateDate(rs.getTimestamp("update_date"));
				udb.setPetName(rs.getString("pet_name"));
				udb.setPetType(rs.getString("pet_type"));
				udb.setPetBirthDate(rs.getDate("pet_birth_date"));
				udb.setPetSex(rs.getString("pet_sex"));
				udb.setPetDesc(rs.getString("pet_desc"));
				udb.setFileName(rs.getString("file_name"));

				return udb;
			}

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
	 * ユーザーIDをもとに該当ユーザーを検索して返す
	 * @param targetId	探したいユーザーのユーザーID
	 * @return			該当するユーザーのUser型インスタンス
	 */
	public UserDataBeans findById(int targetId) {

		Connection conn = null;

		try {
			//データベースへの接続
			conn = DBManager.getConnection();

			//SELECT文を準備
			String sql = "SELECT * FROM t_user WHERE id = ?";

			// SELECTを実行し、結果表を取得
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, targetId);
			ResultSet rs = pStmt.executeQuery();

			//結果表に格納されたレコードの内容を取り出し、Userインスタンスに追加
			if (rs.next()) {

				UserDataBeans udb = new UserDataBeans();

				udb.setId(rs.getInt("id"));
				udb.setName(rs.getString("name"));
				udb.setNickname(rs.getString("nickname"));
				udb.setAddress(rs.getString("address"));
				udb.setLoginId(rs.getString("login_id"));
				udb.setPass(rs.getString("password"));
				udb.setCreateDate(rs.getTimestamp("create_date"));
				udb.setUpdateDate(rs.getTimestamp("update_date"));
				udb.setPetName(rs.getString("pet_name"));
				udb.setPetType(rs.getString("pet_type"));
				udb.setPetBirthDate(rs.getDate("pet_birth_date"));
				udb.setPetSex(rs.getString("pet_sex"));
				udb.setPetDesc(rs.getString("pet_desc"));
				udb.setFileName(rs.getString("file_name"));

				return udb;
			}

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
	 * 全ユーザーを返す
	 * @param targetId	探したいユーザーのユーザーID
	 * @return			該当するユーザーのbeans
	 */
	public ArrayList<UserDataBeans> userAll() {

		Connection conn = null;

		try {
			//データベースへの接続
			conn = DBManager.getConnection();

			//SELECT文を準備
			String sql = "SELECT * FROM t_user ORDER BY DESC";

			// SELECTを実行し、結果表を取得
			PreparedStatement pStmt = conn.prepareStatement(sql);
			ResultSet rs = pStmt.executeQuery();
			ArrayList<UserDataBeans> udbList = new ArrayList<UserDataBeans>();

			//結果表に格納されたレコードの内容を取り出し、Userインスタンスに追加
			while (rs.next()) {

				UserDataBeans udb = new UserDataBeans();

				udb.setId(rs.getInt("id"));
				udb.setName(rs.getString("name"));
				udb.setNickname(rs.getString("nickname"));
				udb.setAddress(rs.getString("address"));
				udb.setLoginId(rs.getString("login_id"));
				udb.setPass(rs.getString("password"));
				udb.setCreateDate(rs.getTimestamp("create_date"));
				udb.setUpdateDate(rs.getTimestamp("update_date"));
				udb.setPetName(rs.getString("pet_name"));
				udb.setPetType(rs.getString("pet_type"));
				udb.setPetBirthDate(rs.getDate("pet_birth_date"));
				udb.setPetSex(rs.getString("pet_sex"));
				udb.setPetDesc(rs.getString("pet_desc"));
				udb.setFileName(rs.getString("file_name"));

				udbList.add(udb);
			}
			System.out.println("Getting all user completed!");
			return udbList;

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
	 * IDをもとに該当ユーザーをデータベースから削除
	 * @param userId 削除したいユーザーのID
	 */
	public void deleteUser(int userId) {

		Connection conn = null;

		try {
			//データベースへ接続
			conn = DBManager.getConnection();

			//DELETE文を用意
			String sql = "DELETE FROM t_user WHERE id=?";

			//DELETEを実行
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, userId);

			int resultNum = pStmt.executeUpdate();

			//追加された行数を出力
			System.out.println(resultNum);
			System.out.println("user has been deleted");

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
	 * ユーザを検索する(引数に渡された値が空でないもののみ検索する)
	 * @param loginId
	 * @param userName
	 * @param birthdayFrom
	 * @param birthdayTo
	 * @param pageNum
	 * @param pageMaxItemCount
	 * @return 検索結果のユーザーリスト
	 */
	public ArrayList<UserDataBeans> searchUser(String loginId, String name, String createDateFrom, String createDateTo, int pageNum, int pageMaxUserCount) {

		Connection conn = null;
		ArrayList<UserDataBeans> udbList = new ArrayList<UserDataBeans>();

		try {
			int startUserNum = (pageNum - 1) * pageMaxUserCount;
			conn = DBManager.getConnection();

			//SQL文の基本形（検索条件なし）の用意
			String sql = "SELECT * FROM t_user";

			// 各種検索要件を設定してSQLを生成
			List<SearchConditionBeans> conditions = new ArrayList<SearchConditionBeans>();
			conditions.add(new SearchConditionBeans("login_id", loginId, WHERE_TYPE_EQUAL));
			conditions.add(new SearchConditionBeans("name", name, WHERE_TYPE_LIKE_PARTIAL_MATCH));
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
				UserDataBeans udb = new UserDataBeans();

				udb.setId(rs.getInt("id"));
				udb.setName(rs.getString("name"));
				udb.setNickname(rs.getString("nickname"));
				udb.setAddress(rs.getString("address"));
				udb.setLoginId(rs.getString("login_id"));
				udb.setPass(rs.getString("password"));
				udb.setCreateDate(rs.getTimestamp("create_date"));
				udb.setUpdateDate(rs.getTimestamp("update_date"));
				udb.setPetName(rs.getString("pet_name"));
				udb.setPetType(rs.getString("pet_type"));
				udb.setPetBirthDate(rs.getDate("pet_birth_date"));
				udb.setPetSex(rs.getString("pet_sex"));
				udb.setPetDesc(rs.getString("pet_desc"));
				udb.setFileName(rs.getString("file_name"));

				udbList.add(udb);
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
		return udbList;
	}

	/**
	 * 検索結果のユーザー数を取得
	 * @param loginId
	 * @param userName
	 * @param birthdayFrom
	 * @param birthdayTo
	 * @return 検索結果のユーザー数
	 */
	public double getUserCountBySearch (String loginId, String name, String createDateFrom, String createDateTo) {

		Connection conn = null;

		try {
			conn = DBManager.getConnection();

			//SQL文の基本形（検索条件なし）の用意
			String sql = "select count(*) as cnt from t_user";

			// 各種検索要件を設定してSQLを生成
			List<SearchConditionBeans> conditions = new ArrayList<SearchConditionBeans>();
			conditions.add(new SearchConditionBeans("login_id", loginId, WHERE_TYPE_EQUAL));
			conditions.add(new SearchConditionBeans("name", name, WHERE_TYPE_LIKE_PARTIAL_MATCH));
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

}
