package model;

import dao.UserDAO;

public class RegisterValidationLogic {

	public static String execute (UserDataBeans udb, String confirmPass) {

		//エラーメッセージの変数を用意
		String errorMsg = "";

		// 入力されているパスワードが確認用と等しいか
		if (!udb.getPass().equals(confirmPass)) {
			errorMsg += "入力されているパスワードと確認用パスワードが違います<br>";
		}

		//必須項目に記入漏れがないか
		if((udb.getName().isEmpty()) || (udb.getNickname().isEmpty()) || (udb.getAddress().isEmpty())
		|| (udb.getLoginId().isEmpty()) || (udb.getPass().isEmpty()) || (confirmPass.isEmpty())
		|| (udb.getPetName().isEmpty()) || (udb.getPetType().isEmpty()) || (udb.getPetSex().isEmpty())
		|| (udb.getPetBirthDate() == null)) {
		errorMsg += "必須項目の中に入力されていないものがあります。<br>";
		}

		// ログインIDの入力規則チェック 英数字 ハイフン アンダースコアのみ入力可能
		if (!(udb.getLoginId().isEmpty()) && !Helper.isLoginIdValidation(udb.getLoginId())) {
			errorMsg += "ログインIDは、半角英数とハイフン、アンダースコアのみ入力できます。<br>";
		}

		// loginIdの重複をチェック
		UserDAO userDao = new UserDAO();
		UserDataBeans existingUdb = userDao.findByLoginId(udb.getLoginId());
		if (existingUdb != null) {
			errorMsg += "記入いただいたログインIDはすでに利用されています。<br>";
		}

		return errorMsg;
	}
}


