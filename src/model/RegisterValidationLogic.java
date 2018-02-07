package model;

import java.util.ArrayList;

import dao.UserDAO;

public class RegisterValidationLogic {

	public static ArrayList<String> execute (UserDataBeans udb, String confirmPass) {

		//エラーメッセージを入れるArrayListを用意
		ArrayList<String> errorMsgList = new ArrayList<String>();

		// 入力されているパスワードが確認用と等しいか
		if (!udb.getPass().equals(confirmPass)) {
			errorMsgList.add("入力されているパスワードと確認用パスワードが違います");
		}

		//必須項目に記入漏れがないか
		if((udb.getName().isEmpty()) || (udb.getNickname().isEmpty()) || (udb.getAddress().isEmpty())
		|| (udb.getLoginId().isEmpty()) || (udb.getPass().isEmpty()) || (confirmPass.isEmpty())
		|| (udb.getPetName().isEmpty()) || (udb.getPetType().isEmpty()) || (udb.getPetSex().isEmpty())
		|| (udb.getPetBirthDate() == null)) {
			errorMsgList.add("記入されていない必須項目があります");
		}

		// ログインIDの入力規則チェック 英数字 ハイフン アンダースコアのみ入力可能
		if (!(udb.getLoginId().isEmpty()) && !Helper.isLoginIdValidation(udb.getLoginId())) {
			errorMsgList.add("ログインIDは、半角英数とハイフン、アンダースコアのみ入力できます");
		}

		// loginIdの重複をチェック
		UserDAO userDao = new UserDAO();
		UserDataBeans existingUdb = userDao.findByLoginId(udb.getLoginId());
		if (existingUdb != null) {
			errorMsgList.add("記入いただいたログインIDはすでに利用されています");
		}

		return errorMsgList;
	}
}


