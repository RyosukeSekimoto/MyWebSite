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
 * Servlet implementation class UsersDetail
 */
@WebServlet("/UsersDetail")
public class UsersDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UsersDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		int userId = Integer.parseInt(request.getParameter("userId"));
		System.out.println(userId);

		//ログインIDに紐づいたユーザー情報を取得
		UserDAO userDao = new UserDAO();

		//beansに格納
		UserDataBeans udb = new UserDataBeans();
		udb = userDao.findById(userId);

		//リクエストスコープに保存
		request.setAttribute("udb", udb);

		//ユーザー詳細ページにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usersDetail.jsp");
		dispatcher.forward(request, response);

	}


}
