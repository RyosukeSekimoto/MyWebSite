package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.LoginLogic;
import model.UserDataBeans;


/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションスコープからログインユーザを取得
		HttpSession session = request.getSession();
		UserDataBeans loginUser = (UserDataBeans)session.getAttribute("loginUser");

		if(loginUser != null) {//ユーザーがログインしていたら

			//トップへリダイレクト
			response.sendRedirect("/MyWebSite/Index");

		} else {//ログインしていなければ

			//ログイン画面にフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		String loginId = request.getParameter("loginId");
		String pass = request.getParameter("pass");

		//ログインIDをもとにしてユーザー情報を取得
		UserDAO userDao = new UserDAO();
		UserDataBeans loginUser = userDao.findByLoginId(loginId);

		//ログイン認証
		LoginLogic loginLogic = new LoginLogic();
		boolean isLogin = loginLogic.execute(loginUser, pass);

		if(isLogin) {//登録ユーザーかつパスワードに不備がなければ

			//セッションスコープにログインユーザを保存
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);

			//指定の戻り先があればそこにリダイレクト
			String returnPageName = (String)session.getAttribute("returnPageName");

			//リターンページ情報を破棄
			session.removeAttribute("returnPageName");

			if(returnPageName != null) {
				response.sendRedirect(returnPageName);
			} else {
				//トップにリダイレクト
				response.sendRedirect("/MyWebSite/Index");
			}

		} else { //ログインできなかったら

			//リクエストスコープにエラーメッセージを保存
			String errorMsg = "ログインIDまたはパスワードに誤りがあります。";
			request.setAttribute("errorMsg", errorMsg);

			//ログイン画面にフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
