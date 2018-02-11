package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReviewDAO;
import model.ImageFileUtil;
import model.ReviewDataBeans;

/**
 * Servlet implementation class ReviewEdit
 */
@WebServlet("/ReviewEdit")
public class ReviewEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReviewEdit() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		int reviewId = request.getParameter("reviewId") != null?Integer.parseInt(request.getParameter("reviewId")): -1;

		if(reviewId != -1) {

			//レビューデータを取得
			ReviewDAO reviewDao = new ReviewDAO();
			ReviewDataBeans rdb = reviewDao.getReviewsById(reviewId);

			//セッションスコープにreviewIDを保存
			session.setAttribute("editReviewId", reviewId);

			//リクエストスコープに保存
			request.setAttribute("rdb", rdb);

		} else {

			//セッションの情報を取得
			ReviewDataBeans rdb = (ReviewDataBeans)session.getAttribute("rdb");
			String imagePath = (String)session.getAttribute("imagePath");
			String errorMsg = (String)session.getAttribute("errorMsg");

			//レビュー情報がなければ現状のものを取得
			if(rdb == null) {
				int editReviewId = (int)session.getAttribute("editReviewId");
				ReviewDAO reviewDao = new ReviewDAO();
				rdb = reviewDao.getReviewsById(editReviewId);
			}

			//保存した画像を消去
			if(imagePath != null) {
				ImageFileUtil.fileDelete(imagePath);
			}

			//リクエストスコープに保存
			request.setAttribute("rdb", rdb);
			request.setAttribute("errorMsg", errorMsg);

			//セッションから消去
			session.removeAttribute("rdb");
			session.removeAttribute("imagePath");
			session.removeAttribute("imageFileName");
			session.removeAttribute("errorMsg");

		}
		//レビュー作成画面へフォワード
		RequestDispatcher dispacher = request.getRequestDispatcher("/WEB-INF/jsp/reviewEdit.jsp");
		dispacher.forward(request, response);
	}
}
