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
			st = con.prepareStatement("INSERT INTO t_user(name, nickname, address, login_id, password, create_date, update_date, pet_name, pet_type, pet_birth_date, pet_sex, pet_desc, file_name) "
										+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");

			st.setString(1, udb.getName());
			st.setString(2, udb.getNickname());
			st.setString(3, udb.getAddress());
			st.setString(4, udb.getLoginId());
			st.setString(5, Helper.encryption(udb.getPass()));
			st.setDate(6, udb.getCreateDate());
			st.setDate(7, udb.getUpdateDate());
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
				udb.setCreateDate(rs.getDate("create_date"));
				udb.setUpdateDate(rs.getDate("update_date"));
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
				udb.setCreateDate(rs.getDate("create_date"));
				udb.setUpdateDate(rs.getDate("update_date"));
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
