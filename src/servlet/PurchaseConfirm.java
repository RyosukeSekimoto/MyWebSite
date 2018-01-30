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

import dao.DeliveryMethodDAO;
import model.BuyDataBeans;
import model.CartItemBeans;
import model.DeliveryMethodDataBeans;
import model.UserDataBeans;

/**
 * Servlet implementation class PurchaseConfirm
 */
@WebServlet("/PurchaseConfirm")
public class PurchaseConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PurchaseConfirm() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		//ログインユーザーを取得
		UserDataBeans udb = (UserDataBeans)session.getAttribute("loginUser");

		//リクエストパラメータを取得
		int selectDeliveryMethodId = Integer.parseInt(request.getParameter("selectDeliveryMethodId"));

		//配送方法を取得
		DeliveryMethodDAO deliveryDao = new DeliveryMethodDAO();
		DeliveryMethodDataBeans dmdb = deliveryDao.getDeliveryMethodDataBeansByID(selectDeliveryMethodId);

		//カートを取得
		ArrayList<CartItemBeans> cart = (ArrayList<CartItemBeans>)session.getAttribute("cart");

		//カート商品の合計金額を取得
		int cartItemTotalPrice = 0;
		for(CartItemBeans cib: cart) {
			cartItemTotalPrice += cib.getIdb().getPrice() * cib.getQuantity();
		}

		//配送料金と合わせた合計金額を取得
		int totalPrice = cartItemTotalPrice + dmdb.getPrice();

		//購入データに格納
		BuyDataBeans bdb = new BuyDataBeans();
		bdb.setUserId(udb.getId());
		bdb.setTotalPrice(totalPrice);
		bdb.setDeliveryMethodId(dmdb.getId());
		bdb.setDeliveryMethodName(dmdb.getName());
		bdb.setDeliveryMethodPrice(dmdb.getPrice());

		//セッションスコープに購入データを保存
		session.setAttribute("bdb", bdb);

		//購入確認画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/purchaseConfirm.jsp");
		dispatcher.forward(request, response);
	}

}
