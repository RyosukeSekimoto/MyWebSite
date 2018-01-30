package model;

import javax.servlet.http.Part;

public class ReviewValidationLogic {

	public static String execute(ReviewDataBeans rdb, Part part) {

		//エラーメッセージの変数を用意
		String errorMsg = "";

		//必須項目に記入漏れがないか
		if(rdb.getTitle().isEmpty() || rdb.getReviewDesc().isEmpty()) {
			errorMsg += "必須項目の中に入力されていないものがあります。";
			System.out.println("error-01!");
		}

		//写真と写真コメントがセットで入力されているか
		if(rdb.getPhotoDesc() != null) {
			System.out.println("error-02!");
			if(part.getSize() == 0.0 && rdb.getPhotoFileName() == null) {
				errorMsg += "写真がアップロードされていません";
				System.out.println("error-03!");
			}
		}

		return errorMsg;
	}
}