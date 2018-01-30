package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemDAO;
import dao.ReviewDAO;
import dao.UserDAO;
import model.ItemDataBeans;
import model.ReviewDataBeans;
import model.ReviewFullDataBeans;

/**
 * Servlet implementation class ProductDetail
 */
@WebServlet("/ProductDetail")
public class ProductDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		int itemId = Integer.parseInt(request.getParameter("itemId"));

		//商品IDから商品データを取得
		ItemDAO itemDao = new ItemDAO();
		ItemDataBeans idb = itemDao.getItemByItemId(itemId);

		//商品IDからレビュー情報を取得
		ReviewDAO reviewDao = new ReviewDAO();
		ArrayList<ReviewDataBeans> reviewList = reviewDao.getReviewsByItemId(itemId);

		//レビュワー情報込みのbeansが入るArrayListを用意
		ArrayList<ReviewFullDataBeans> rfdbList = new ArrayList<ReviewFullDataBeans>();
		UserDAO userDao = new UserDAO();

		//レビュー情報にユーザー名とアイコン画像を追加したbeansを用意する
		for(ReviewDataBeans rdb: reviewList) {

			//レビュワー情報を取得
			String reviewer = userDao.findById(rdb.getUserId()).getName();
			String reviewerIconFileName = userDao.findById(rdb.getUserId()).getFileName();
			//beansにデータを格納
			ReviewFullDataBeans rsb = new ReviewFullDataBeans();
			rsb.setRdb(rdb);
			rsb.setReviewer(reviewer);
			rsb.setReviewerIconFileName(reviewerIconFileName);
			rfdbList.add(rsb);
		}

		//リクエストスコープに保存
		request.setAttribute("idb", idb);
		request.setAttribute("rfdbList", rfdbList);

		//フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/productDetail.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
