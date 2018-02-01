package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDAO;
import model.ReviewDataBeans;

/**
 * Servlet implementation class ReviewDetail
 */
@WebServlet("/ReviewDetail")
public class ReviewDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReviewDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメータの取得
		request.setCharacterEncoding("UTF-8");
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));

		//レビューIDからレビュー情報を取得
		ReviewDAO reviewDao = new ReviewDAO();
		ReviewDataBeans rdb = reviewDao.getReviewsById(reviewId);

		//リクエストスコープに保存
		request.setAttribute("rdb", rdb);

		//レビュー詳細画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/reviewDetail.jsp");
		dispatcher.forward(request, response);
	}
}
