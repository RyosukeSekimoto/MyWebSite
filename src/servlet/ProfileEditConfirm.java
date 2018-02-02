package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.Helper;
import model.ImageFileUtil;
import model.ProfileEditValidationLogic;
import model.UserDataBeans;

/**
 * Servlet implementation class ProfileConfirm
 */
@WebServlet("/ProfileEditConfirm")
@MultipartConfig(location="", maxFileSize=1024 * 1024 * 2)
public class ProfileEditConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProfileEditConfirm() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String address = request.getParameter("address");
		String loginId = request.getParameter("loginId");
		String pass = request.getParameter("pass");
		String confirmPass = request.getParameter("confirmPass");
		String existedPass = request.getParameter("existedPass");
		String petName = request.getParameter("petName");
		String petType = request.getParameter("petType");
		Date petBirthDate = request.getParameter("petBirthDate").isEmpty() ? null : Date.valueOf(request.getParameter("petBirthDate"));
		String petSex = request.getParameter("petSex");
		String petDesc = request.getParameter("petDesc");
		String IconFileName = request.getParameter("existedIconFileName") != null ? request.getParameter("existedIconFileName"): null;

		//入力された値を格納
		UserDataBeans udb = new UserDataBeans();
		udb.setName(name);
		udb.setNickname(nickname);
		udb.setAddress(address);
		udb.setLoginId(loginId);
		udb.setPass(pass);
		udb.setPetName(petName);
		udb.setPetType(petType);
		udb.setPetBirthDate(petBirthDate);
		udb.setPetSex(petSex);
		udb.setPetDesc(petDesc);
		udb.setFileName(IconFileName);

		//ファイルデータを取得
		Part part = request.getPart("petIconFile");
		//保存先フォルダの絶対パス
		String path = getServletContext().getRealPath("upload/profile");
		//保存するファイルの絶対パスを初期化
		String imagePath = null;
		//保存するファイル名を初期化
		String imageFileName = null;

		if(part.getSize() != 0.0) {//ファイルがアップロードされていれば

			//画像ファイルの名前を取得して格納
			imageFileName = ImageFileUtil.fileNameCreate(part, loginId);
			//ファイルの絶対パスを保存
			imagePath = path + "/" + imageFileName;
			//画像ファイルを保存
			part.write(imagePath);
			System.out.println("file is saved");
		}

		//入力チェックをして、エラーメッセージを取得
		String errorMsg = ProfileEditValidationLogic.execute(udb, confirmPass);

		//パスワードの変更がなければ暗号化せずにそのまま既存のパスワードを保存
		if(udb.getPass().isEmpty()) {
			udb.setPass(existedPass);
		} else {//更新する場合
			//暗号化
			udb.setPass(Helper.encryption(pass));
		}

		if (errorMsg.isEmpty()) {// バリデーションエラーメッセージが空なら確認画面へ

			//セッションに入力情報を取得
			session.setAttribute("udb", udb);

			if(part.getSize() != 0.0) {//画像がアップロードされていたら

				//セッションに画像情報を保存
				session.setAttribute("imagePath", imagePath);
				session.setAttribute("imageFileName", imageFileName);
			}

			//確認画面にフォワード
			request.getRequestDispatcher("/WEB-INF/jsp/profileEditConfirm.jsp").forward(request, response);

		} else {//エラーメッセージが含まれていたら

			//フォーム入力情報とエラーメッセージをセッションに保存
			session.setAttribute("udb", udb);
			session.setAttribute("errorMsg", errorMsg);
			response.sendRedirect("/MyWebSite/ProfileEdit");
		}
	}

}
