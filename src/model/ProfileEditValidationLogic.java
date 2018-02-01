package model;

public class ProfileEditValidationLogic {

	public static String execute (UserDataBeans udb, String confirmPass) {

		//エラーメッセージの変数を用意
		String errorMsg = "";

		// 入力されているパスワードが確認用と等しいか
		if (!udb.getPass().equals(confirmPass)) {
			errorMsg += "入力されているパスワードと確認用パスワードが違います<br>";
		}

		//必須項目に記入漏れがないか
		if((udb.getName().isEmpty()) || (udb.getNickname().isEmpty()) || (udb.getAddress().isEmpty())
		|| (udb.getLoginId().isEmpty()) || (udb.getPetName().isEmpty()) || (udb.getPetType().isEmpty())
		|| (udb.getPetSex().isEmpty())|| (udb.getPetBirthDate() == null)) {
		errorMsg += "必須項目の中に入力されていないものがあります。<br>";
		}

		return errorMsg;
	}
}
