package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.ImageFileUtil;
import model.UserDataBeans;

/**
 * Servlet implementation class UsersEdit
 */
@WebServlet("/UsersEdit")
public class UsersEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UsersEdit() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		//リクエストパラメータを取得
		int userId = request.getParameter("userId") != null?Integer.parseInt(request.getParameter("userId")): -1;

		//初回表示時はパラメータを受け取ってユーザー情報を取得
		if(userId != -1) {
			UserDataBeans udb = (UserDataBeans)session.getAttribute("udb");
			UserDAO userDao = new UserDAO();
			udb = userDao.findById(userId);
			request.setAttribute("udb", udb);

		} else {

			//セッションの情報を取得
			UserDataBeans udb = (UserDataBeans)session.getAttribute("udb");
			String imagePath = (String)session.getAttribute("imagePath");
			ArrayList<String> errorMsgList = (ArrayList<String>)session.getAttribute("errorMsgList");

			//保存した画像を画像を消去
			if(imagePath != null) {
				ImageFileUtil.fileDelete(imagePath);
			}

			//リクエストスコープに保存
			request.setAttribute("udb", udb);
			request.setAttribute("errorMsgList", errorMsgList);

			//セッションから消去
			session.removeAttribute("udb");
			session.removeAttribute("imagePath");
			session.removeAttribute("imageFileName");
			session.removeAttribute("errorMsgList");
		}

		//プロフィール編集画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usersEdit.jsp");
		dispatcher.forward(request, response);

	}

}
