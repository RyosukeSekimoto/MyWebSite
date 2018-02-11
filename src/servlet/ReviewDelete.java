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
 * Servlet implementation class ReviewDelete
 */
@WebServlet("/ReviewDelete")
public class ReviewDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReviewDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		String itemName = request.getParameter("itemName");
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));

		//レビュー情報を取得
		ReviewDAO reviewDao = new ReviewDAO();
		ReviewDataBeans rdb = reviewDao.getReviewsById(reviewId);

		//リクエストスコープに保存
		request.setAttribute("deleteRdb", rdb);
		request.setAttribute("itemName", itemName);


		//レビュー削除画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/reviewDelete.jsp");
		dispatcher.forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));

		//テーブルから該当のレビューを削除
		ReviewDAO reviewDao = new ReviewDAO();
		reviewDao.deleteReview(reviewId);

		//レビュー削除完了画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/reviewDeleteResult.jsp");
		dispatcher.forward(request, response);
	}

}
