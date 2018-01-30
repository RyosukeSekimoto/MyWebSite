package model;

import java.io.Serializable;
import java.sql.Date;

public class UserDataBeans implements Serializable {

	private int id;
	private String name;
	private String nickname;
	private String address;
	private String loginId;
	private String pass;
	private Date createDate;
	private Date updateDate;
	private String petName;
	private String petType;
	private Date petBirthDate;
	private String petSex;
	private String petDesc;
	private String fileName;

	public UserDataBeans() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getPetType() {
		return petType;
	}

	public void setPetType(String petType) {
		this.petType = petType;
	}

	public Date getPetBirthDate() {
		return petBirthDate;
	}

	public void setPetBirthDate(Date petBirthDate) {
		this.petBirthDate = petBirthDate;
	}

	public String getPetSex() {
		return petSex;
	}

	public void setPetSex(String petSex) {
		this.petSex = petSex;
	}

	public String getPetDesc() {
		return petDesc;
	}

	public void setPetDesc(String petDesc) {
		this.petDesc = petDesc;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	};


}

