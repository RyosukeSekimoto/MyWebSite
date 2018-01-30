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
import dao.BuyDetailDAO;
import model.BuyDataBeans;
import model.BuyDetailDataBeans;
import model.CartItemBeans;

/**
 * Servlet implementation class PurchaseResult
 */
@WebServlet("/PurchaseResult")
public class PurchaseResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PurchaseResult() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		//購入情報を取得してセッションから破棄
		BuyDataBeans bdb = (BuyDataBeans)session.getAttribute("bdb");
		session.removeAttribute("bdb");

		//セッションからカートを取得してセッションから破棄
		ArrayList<CartItemBeans> cart = (ArrayList<CartItemBeans>)session.getAttribute("cart");
		session.removeAttribute("cart");

		//購入情報をデータベースに登録
		BuyDAO buyDao = new BuyDAO();
		int buyId = buyDao.insertBuy(bdb);

		BuyDetailDAO buyDetailDao = new BuyDetailDAO();

		//購入詳細情報を取得してデータベースに登録
		for(CartItemBeans cib: cart) {
			BuyDetailDataBeans bddb = new BuyDetailDataBeans();
			bddb.setBuyId(buyId);
			bddb.setItemId(cib.getIdb().getId());
			bddb.setItemName(cib.getIdb().getName());
			bddb.setItemPrice(cib.getIdb().getPrice());
			bddb.setQuantity(cib.getQuantity());
			buyDetailDao.insertBuyDetail(bddb);
		}

		//購入完了ページ用の情報をリクエストスコープに保存
		request.setAttribute("bdb", bdb);
		ArrayList<BuyDetailDataBeans> bddbList = buyDetailDao.getBuyDataBeansListByBuyId(buyId);
		request.setAttribute("bddbList", bddbList);

		//購入完了画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/purchaseResult.jsp");
		dispatcher.forward(request, response);

	}

}
