package model;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.xml.bind.DatatypeConverter;


public class Helper {

	/**
	 * 渡された文字列をMD5で暗号化して返す
	 * @param targetPass	暗号化前の文字列
	 * @return				暗号化後の文字列
	 */
	public static String encryption(String targetPass) {

		//ハッシュ生成前にバイト配列に置き換える際のCharset
        Charset charset = StandardCharsets.UTF_8;

        //ハッシュアルゴリズム
        String algorithm = "MD5";

        //ハッシュ生成処理
        try {
        	byte[] bytes = MessageDigest.getInstance(algorithm).digest(targetPass.getBytes(charset));
            String result = DatatypeConverter.printHexBinary(bytes);

            //暗号化された文章を返す
            return result;

        } catch(NoSuchAlgorithmException e) {
        	e.printStackTrace();
        }
        return null;
	}

	/**
	 * Date型の日付をString型("yyyy年MM月dd日")に変換して返す
	 * @param date	変換したいDate型の日付
	 * @return		"yyyy年MM月dd日"表示の日付
	 */
	public static String displayDate(Date date) {

            SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy年MM月dd日 kk時mm分");
    		String displayDate = sdFormat.format(date);

    		return displayDate;
	}

	/**
	 * ログインIDのバリデーション
	 *
	 * @param inputLoginId
	 * @return
	 */
	public static boolean isLoginIdValidation(String inputLoginId) {
		// 英数字アンダースコア以外が入力されていたら
		if (inputLoginId.matches("[0-9a-zA-Z-_]+")) {
			return true;
		}

		return false;

	}

	/**
	 * int型のpriceにカンマをつけてString型で
	 * @param price
	 * @return String型のカンマ付き
	 */
	public static String displayPrice(int price) {
		String viewPrice = String.format("%,d", price);
		return viewPrice;
	}

}
