package model;

import java.util.ArrayList;

import javax.servlet.http.Part;

public class ItemRegisterValidationLogic {

	public static ArrayList<String> execute(ItemDataBeans idb, Part part) {

		//エラーメッセージの変数を用意
		ArrayList<String> errorMsgList = new ArrayList<String>();

		//必須項目に記入漏れがあればエラーメッセージを返す
		if(idb.getCategory().isEmpty() || idb.getName().isEmpty() || idb.getDetail().isEmpty() || idb.getPrice() == 0) {
			errorMsgList.add("必須項目の中に入力されていないものがあります");
		}
		//メイン画像がアップロードされていなければえラーメッセージを返す
		if(part.getSize() == 0.0) {
			errorMsgList.add("メイン画像は必須です");
		}

		return errorMsgList;
	}
}
