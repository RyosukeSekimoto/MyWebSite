package model;

public class LoginLogic {
	//ログイン認証
	/**
	 * @param user　ユーザーインスタンス
	 * @return	ログイン可能ならtrue、不可ならfalseを返す
	 */
	public boolean execute(UserDataBeans user, String pass) {

		//受け取ったpassを暗号化
		String enPass = Helper.encryption(pass);

		if(user != null && enPass.equals(user.getPass())) {
			return true;
		}
		return false;
	}
}