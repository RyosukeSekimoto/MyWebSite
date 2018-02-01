package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Helper;
import model.UserDataBeans;

public class UserDAO {

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
	 * @return			該当するユーザーのUser型インスタンス
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
}
