package model;

import java.util.ArrayList;

public class ProfileEditValidationLogic {

	public static ArrayList<String> execute (UserDataBeans udb, String confirmPass) {

		//エラーメッセージの変数を用意
		ArrayList<String> errorMsgList = new ArrayList<String>();

		// 入力されているパスワードが確認用と等しいか
		if (!udb.getPass().equals(confirmPass)) {
			errorMsgList.add("入力されているパスワードと確認用パスワードが違います");
		}

		//必須項目に記入漏れがないか
		if((udb.getName().isEmpty()) || (udb.getNickname().isEmpty()) || (udb.getAddress().isEmpty())
		|| (udb.getLoginId().isEmpty()) || (udb.getPetName().isEmpty()) || (udb.getPetType().isEmpty())
		|| (udb.getPetSex().isEmpty())|| (udb.getPetBirthDate() == null)) {
			errorMsgList.add("必須項目の中に入力されていないものがあります");
		}

		return errorMsgList;
	}
}
