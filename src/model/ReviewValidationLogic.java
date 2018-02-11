package model;

import java.util.ArrayList;

import javax.servlet.http.Part;

public class ReviewValidationLogic {

	public static ArrayList<String> execute(ReviewDataBeans rdb, Part part) {

		//エラーメッセージの変数を用意
		ArrayList<String> errorMsgList = new ArrayList<String>();

		//必須項目に記入漏れがないか
		if(rdb.getTitle().isEmpty() || rdb.getReviewDesc().isEmpty()) {
			errorMsgList.add("必須項目の中に入力されていないものがあります");
		}

		//写真と写真コメントがセットで入力されているか
		if(!(rdb.getPhotoDesc().isEmpty())) {
			if(part.getSize() == 0.0 && rdb.getPhotoFileName() == null) {
				errorMsgList.add("写真がアップロードされていません");
			}
		}

		return errorMsgList;
	}
}
