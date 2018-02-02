package model;

import java.io.File;

import javax.servlet.http.Part;

public class ImageFileUtil {

	/**
	 * アップロードされた画像データのファイル名を取得して、識別部をつけて返す
	 * @param part ファイルデータ
	 * @return long型の時刻_ファイル名
	 */
	public static String fileNameCreate(Part part) {

		//ファイル名を取り出す処理
		String contentDisposition = part.getHeader("content-disposition");
		int fileNamePosition = contentDisposition.indexOf("filename=");
		String fileName = contentDisposition.substring(fileNamePosition);
		fileName = fileName.replace("filename=", "");
		fileName = fileName.replace("\"", "");

		//現在時刻を固有名詞に使う
		String distinctionWord = String.valueOf(System.currentTimeMillis());
		return distinctionWord + "_" + fileName;
	}

	/**
	 * アップロードされた画像データのファイル名を取得して、識別部をつけて返す
	 * @param part ファイルデータ
	 * @param distinction　識別するためのワード（ログインID、レビューIDなど）
	 * @return distinction_ファイル名
	 */
	public static String fileNameCreate(Part part, String distinctionWord) {

		//ファイル名を取り出す処理
		String contentDisposition = part.getHeader("content-disposition");
		int fileNamePosition = contentDisposition.indexOf("filename=");
		String fileName = contentDisposition.substring(fileNamePosition);
		fileName = fileName.replace("filename=", "");
		fileName = fileName.replace("\"", "");

		fileName = distinctionWord + "_" + fileName;

		return fileName;
	}

	/**
	 * パスを受け取って、該当の画像ファイルを削除する
	 * @param path 削除したいファイルの絶対パス
	 */
	public static void fileDelete(String path) {

		File file = new File(path);
		if (file.exists()){
		    System.out.println("file existed");
		    file.delete();
		    System.out.println("file deleted");
		} else {
			System.out.println("file not existed");
		}
	}
}
