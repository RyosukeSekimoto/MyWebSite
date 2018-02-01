package servlet;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReviewDAO;
import model.ReviewDataBeans;

/**
 * Servlet implementation class ReviewEditResult
 */
@WebServlet("/ReviewEditResult")
@MultipartConfig(location="", maxFileSize=1024 * 1024 * 2)
public class ReviewEditResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReviewEditResult() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String reviewDesc = request.getParameter("reviewDesc");
		String photoDesc = request.getParameter("photoDesc").isEmpty() ? null: request.getParameter("photoDesc");
		Timestamp updateDate = new Timestamp(Long.parseLong(request.getParameter("updateDate")));
		String photoFileName = request.getParameter("photoFileName").isEmpty() ? null: request.getParameter("photoFileName");

		//レビューデータをBeansに格納
		ReviewDataBeans rdb = new ReviewDataBeans();
		rdb.setTitle(title);
		rdb.setReviewDesc(reviewDesc);
		rdb.setPhotoDesc(photoDesc);
		rdb.setUpdateDate(updateDate);
		rdb.setPhotoFileName(photoFileName);

		//編集するレビューのIDをセッションから取得
		int reviewId = (int)session.getAttribute("editReviewId");

		//データベースを更新
		ReviewDAO reviewDao = new ReviewDAO();
		reviewDao.updateReviewById(rdb, reviewId);

		//レビューIDをリクエストスコープに保存
		request.setAttribute("reviewId", reviewId);

		//セッションを破棄
		session.removeAttribute("rdb");
		session.removeAttribute("imagePath");
		session.removeAttribute("imageFileName");
		session.removeAttribute("editReviewId");

		//投稿完了ページへフォワード
		request.getRequestDispatcher("/WEB-INF/jsp/reviewEditResult.jsp").forward(request, response);
	}


}
