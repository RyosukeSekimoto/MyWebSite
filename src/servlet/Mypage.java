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

import dao.BuyDAO;
import dao.ReviewDAO;
import dao.UserDAO;
import model.BuyDataBeans;
import model.ReviewDataBeans;
import model.UserDataBeans;

/**
 * Servlet implementation class Mypage
 */
@WebServlet("/Mypage")
public class Mypage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Mypage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		//DAOを生成
		UserDAO userDao = new UserDAO();
		ReviewDAO reviewDao = new ReviewDAO();
		BuyDAO buyDao = new BuyDAO();

		//レビュー詳細からのアクセスでリクエストパラメータにより該当ユーザーを取得
		UserDataBeans udb = request.getParameter("userId") != null?userDao.findById(Integer.parseInt(request.getParameter("userId"))):
							(UserDataBeans)session.getAttribute("loginUser");

		//ユーザーIDに紐づいたレビュー情報を取得
		ArrayList<ReviewDataBeans> reviewList = reviewDao.getReviewsByUserId(udb.getId());
		//購入情報を取得
		ArrayList<BuyDataBeans> bdbList = buyDao.getBuyDataBeansByUserId(udb.getId());

		//リクエストスコープに保存
		request.setAttribute("udb", udb);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("bdbList", bdbList);

		//マイページ画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mypage.jsp");
		dispatcher.forward(request, response);

	}
}
