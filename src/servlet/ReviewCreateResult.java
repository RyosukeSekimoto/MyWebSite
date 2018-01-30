package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReviewDAO;
import model.ItemDataBeans;
import model.ReviewDataBeans;

/**
 * Servlet implementation class ReviewCreateResult
 */
@WebServlet("/ReviewCreateResult")
@MultipartConfig(location="", maxFileSize=1024 * 1024 * 2)
public class ReviewCreateResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReviewCreateResult() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String itemId = request.getParameter("itemId");
		String title = request.getParameter("title");
		String reviewDesc = request.getParameter("reviewDesc");
		String photoDesc = request.getParameter("photoDesc").isEmpty() ? null: request.getParameter("photoDesc");
		Date createDate = new Date(Long.parseLong(request.getParameter("createDate")));
		Date updateDate = new Date(Long.parseLong(request.getParameter("updateDate")));
		String photoFileName = request.getParameter("photoFileName").isEmpty() ? null: request.getParameter("photoFileName");

		//レビューデータをBeansに格納
		ReviewDataBeans rdb = new ReviewDataBeans();
		rdb.setUserId(Integer.parseInt(userId));
		rdb.setItemId(Integer.parseInt(itemId));
		rdb.setTitle(title);
		rdb.setReviewDesc(reviewDesc);
		rdb.setPhotoDesc(photoDesc);
		rdb.setCreateDate(createDate);
		rdb.setUpdateDate(updateDate);
		rdb.setPhotoFileName(photoFileName);

		//データベースに登録
		ReviewDAO reviewDao = new ReviewDAO();
		reviewDao.insertReview(rdb);

		//商品IDを取得してリクエストスコープに保存
		ItemDataBeans idb = (ItemDataBeans)session.getAttribute("idb");
		int returnItemId = idb.getId();
		request.setAttribute("returnItemId", returnItemId);

		//セッションを破棄
		session.removeAttribute("rdb");
		session.removeAttribute("imagePath");
		session.removeAttribute("imageFileName");
		session.removeAttribute("idb");

		//投稿完了ページへフォワード
		request.getRequestDispatcher("/WEB-INF/jsp/reviewCreateResult.jsp").forward(request, response);

	}

}
