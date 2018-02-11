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
import dao.RankingDAO;
import dao.ReviewDAO;
import model.ItemDataBeans;
import model.ReviewDataBeans;

/**
 * Servlet implementation class Index
 */
@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Index() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//DAOを生成
		RankingDAO rankingDao = new RankingDAO();
		ItemDAO itemDao = new ItemDAO();

		//商品情報を購入回数の多い順にソートして6個取得
		ArrayList<Integer> itemIdList = new ArrayList<Integer>();
		itemIdList = rankingDao.getItemIdBySales();

		//購入数順に6つ商品を取得する
		ArrayList<ItemDataBeans> idbList = new ArrayList<ItemDataBeans>();
		for(Integer i: itemIdList) {
			ItemDataBeans idb = itemDao.getItemByItemId(i);
			idbList.add(idb);
		}

		//レビューを新しい順に3つ取得
		ReviewDAO reviewDao = new ReviewDAO();
		ArrayList<ReviewDataBeans> reviewList = reviewDao.getLatestReviews();

		//リクエストスコープに保存
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("idbList", idbList);

		//トップ画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/index.jsp");
		dispatcher.forward(request, response);
	}
}
