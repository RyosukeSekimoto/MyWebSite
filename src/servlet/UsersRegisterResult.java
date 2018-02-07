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
import model.UserDataBeans;

/**
 * Servlet implementation class UserRegisterResult
 */
@WebServlet("/UsersRegisterResult")
@MultipartConfig(location="", maxFileSize=1024 * 1024 * 2)
public class UsersRegisterResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UsersRegisterResult() {
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
		Timestamp createDate = new Timestamp(Long.parseLong(request.getParameter("createDate")));
		Timestamp updateDate = new Timestamp(Long.parseLong(request.getParameter("updateDate")));
		String petName = request.getParameter("petName");
		String petType = request.getParameter("petType");
		Date petBirthDate = Date.valueOf(request.getParameter("petBirthDate"));
		String petSex = request.getParameter("petSex");
		String petDesc = request.getParameter("petDesc").isEmpty() ? null: request.getParameter("petDesc");
		String petIconFile = request.getParameter("petIconFile").isEmpty() ? "default.png": request.getParameter("petIconFile");

		//ユーザーデータをBeansに格納
		UserDataBeans udb = new UserDataBeans();
		udb.setName(name);
		udb.setNickname(nickname);
		udb.setAddress(address);
		udb.setLoginId(loginId);
		udb.setPass(pass);
		udb.setCreateDate(createDate);
		udb.setUpdateDate(updateDate);
		udb.setPetName(petName);
		udb.setPetType(petType);
		udb.setPetBirthDate(petBirthDate);
		udb.setPetSex(petSex);
		udb.setPetDesc(petDesc);
		udb.setFileName(petIconFile);

		//データベースに登録
		UserDAO userDao = new UserDAO();
		userDao.insertUser(udb);

		//セッションを破棄
		session.removeAttribute("udb");
		session.removeAttribute("imagePath");
		session.removeAttribute("imageFileName");

		//登録完了ページへフォワード
		request.getRequestDispatcher("/WEB-INF/jsp/usersRegisterResult.jsp").forward(request, response);
	}

}
