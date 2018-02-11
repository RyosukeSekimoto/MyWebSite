package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ItemDataBeans implements Serializable {

	private int id;
	private String category;
	private String name;
	private String detail;
	private int price;
	private String firstFileName;
	private String secondFileName;
	private String thirdFileName;
	private String forthFileName;
	private Timestamp createDate;
	private Timestamp updateDate;

	public ItemDataBeans() {
		this.price = -1;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getFirstFileName() {
		return firstFileName;
	}

	public void setFirstFileName(String firstFileName) {
		this.firstFileName = firstFileName;
	}

	public String getSecondFileName() {
		return secondFileName;
	}

	public void setSecondFileName(String secondFileName) {
		this.secondFileName = secondFileName;
	}

	public String getThirdFileName() {
		return thirdFileName;
	}

	public void setThirdFileName(String thirdFileName) {
		this.thirdFileName = thirdFileName;
	}

	public String getForthFileName() {
		return forthFileName;
	}

	public void setForthFileName(String forthFileName) {
		this.forthFileName = forthFileName;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Timestamp getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}


}
