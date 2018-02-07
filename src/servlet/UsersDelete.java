package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.UserDataBeans;

/**
 * Servlet implementation class UsersDelete
 */
@WebServlet("/UsersDelete")
public class UsersDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UsersDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメータを取得
		int userId = Integer.parseInt(request.getParameter("userId"));

		//ユーザー情報を取得
		UserDAO userDao = new UserDAO();
		UserDataBeans udb = userDao.findById(userId);

		//リクエストスコープに保存
		request.setAttribute("udb", udb);

		//削除画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usersDelete.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメータを取得
		int userId = Integer.parseInt(request.getParameter("userId"));

		//該当ユーザーを削除
		UserDAO userDao = new UserDAO();
		userDao.deleteUser(userId);

		//削除完了画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usersDeleteResult.jsp");
		dispatcher.forward(request, response);

	}

}
