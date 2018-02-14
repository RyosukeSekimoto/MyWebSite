package servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.Helper;
import model.UserDataBeans;

/**
 * Servlet implementation class ProfileEditResult
 */
@WebServlet("/ProfileEditResult")
@MultipartConfig(location="", maxFileSize=1024 * 1024 * 2)
public class ProfileEditResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProfileEditResult() {
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
		String petName = request.getParameter("petName");
		String petType = request.getParameter("petType");
		Date petBirthDate = Date.valueOf(request.getParameter("petBirthDate"));
		Timestamp updateDate = new Timestamp(Long.parseLong(request.getParameter("updateDate")));
		String petSex = request.getParameter("petSex");
		String petDesc = request.getParameter("petDesc").isEmpty() ? null: request.getParameter("petDesc");
		String petIconFile = request.getParameter("petIconFile").isEmpty() ? "default.png": request.getParameter("petIconFile");

		//ログインユーザーを取得
		UserDataBeans loginUser = (UserDataBeans)session.getAttribute("loginUser");

		//パスワードが更新される場合は暗号化
		if(!(pass.equals(loginUser.getPass()))) {
			pass = Helper.encryption(pass);
		}

		//更新する値を格納
		UserDataBeans udb = new UserDataBeans();
		udb.setId(loginUser.getId());
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
		udb.setFileName(petIconFile);
		udb.setUpdateDate(updateDate);

		//アップデート処理
		UserDAO userDao = new UserDAO();
		userDao.updateUserProfile(udb);

		//セッションを破棄
		session.removeAttribute("udb");
		session.removeAttribute("imagePath");
		session.removeAttribute("imageFileName");

		//投稿完了ページへフォワード
		request.getRequestDispatcher("/WEB-INF/jsp/profileEditResult.jsp").forward(request, response);
	}

}
