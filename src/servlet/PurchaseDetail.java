package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BuyDAO;
import dao.BuyDetailDAO;
import model.BuyDataBeans;
import model.BuyDetailDataBeans;

/**
 * Servlet implementation class PurchaseDetail
 */
@WebServlet("/PurchaseDetail")
public class PurchaseDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PurchaseDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		int buyId = Integer.parseInt(request.getParameter("buyId"));
		System.out.println(buyId);

		//購入情報を取得
		BuyDAO buyDao = new BuyDAO();
		BuyDataBeans bdb = buyDao.getBuyDataBeansByBuyId(buyId);

		//購入詳細情報を取得
		BuyDetailDAO buyDetailDao = new BuyDetailDAO();
		ArrayList<BuyDetailDataBeans> bddbList = buyDetailDao.getBuyDataBeansListByBuyId(buyId);

		//リクエストスコープに保存
		request.setAttribute("bddbList", bddbList);
		request.setAttribute("bdb", bdb);

		//購入詳細画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/purchaseDetail.jsp");
		dispatcher.forward(request, response);
	}


}
