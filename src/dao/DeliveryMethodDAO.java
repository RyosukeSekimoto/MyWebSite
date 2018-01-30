package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.DeliveryMethodDataBeans;

public class DeliveryMethodDAO {

	/**
	 * DBに登録されている配送方法を取得
	 * @return {DeliveryMethodDataBeans}
	 */
	public ArrayList<DeliveryMethodDataBeans> getAllDeliveryMethodDataBeans() {

		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement("SELECT * FROM m_delivery_method");

			ResultSet rs = st.executeQuery();

			ArrayList<DeliveryMethodDataBeans> deliveryMethodDataBeansList = new ArrayList<DeliveryMethodDataBeans>();
			while (rs.next()) {
				DeliveryMethodDataBeans dmdb = new DeliveryMethodDataBeans();
				dmdb.setId(rs.getInt("id"));
				dmdb.setName(rs.getString("name"));
				dmdb.setPrice(rs.getInt("price"));
				deliveryMethodDataBeansList.add(dmdb);
			}

			System.out.println("searching all DeliveryMethodDataBeans has been completed");

			return deliveryMethodDataBeansList;

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

	/**
	 * 配送方法をIDをもとに取得
	 * @param DeliveryMethodId
	 * @return DeliveryMethodDataBeans
	 */
	public DeliveryMethodDataBeans getDeliveryMethodDataBeansByID(int DeliveryMethodId) {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement(
					"SELECT * FROM m_delivery_method WHERE id = ?");
			st.setInt(1, DeliveryMethodId);

			ResultSet rs = st.executeQuery();

			DeliveryMethodDataBeans dmdb = new DeliveryMethodDataBeans();
			if (rs.next()) {
				dmdb.setId(rs.getInt("id"));
				dmdb.setName(rs.getString("name"));
				dmdb.setPrice(rs.getInt("price"));
			}

			System.out.println("searching DeliveryMethodDataBeans by DeliveryMethodID has been completed");

			return dmdb;
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
