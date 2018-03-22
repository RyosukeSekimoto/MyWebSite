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
import model.ItemDataBeans;
import model.ReviewDataBeans;

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

		//リクエストスコープに保存
		request.setAttribute("idb", idb);
		request.setAttribute("reviewList", reviewList);

		//商品詳細ページへフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/productDetail.jsp");
		dispatcher.forward(request, response);
	}

}
