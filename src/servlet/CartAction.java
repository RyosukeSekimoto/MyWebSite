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

import model.CartItemBeans;

/**
 * Servlet implementation class CartItemDelete
 */
@WebServlet("/CartAction")
public class CartAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CartAction() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		if(request.getParameter("itemDelete") != null) {

			//リクエストパラメータを取得
			String[] deleteItemIdList = request.getParameterValues("deleteItemIdList");
			//カートを取得
			ArrayList<CartItemBeans> cart = (ArrayList<CartItemBeans>) session.getAttribute("cart");

			//メッセージを用意
			String cartActionMessage = "";

			//削除を実行
			if(deleteItemIdList != null) {
				for(String deleteItemId: deleteItemIdList) {
					for(CartItemBeans cib: cart) {
						//受け取った削除したい商品のIDと一致したものについてカートから削除
						if(cib.getIdb().getId() == Integer.parseInt(deleteItemId)) {
							cart.remove(cib);
							break;
						}
					}
				}
				cartActionMessage = "チェックされた商品をカートから削除しました";
			} else {
				cartActionMessage = "削除にチェックがされていません";
			}

			//リクエストスコープにカートメッセージを保存
			request.setAttribute("cartActionMessage", cartActionMessage);

			//カート画面にフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cart.jsp");
			dispatcher.forward(request, response);

		} else if(request.getParameter("purchase") != null) {

			//リクエストパラメータを取得
			String[] quantitys = request.getParameterValues("quantity");

			//int型に変換
			ArrayList<Integer> convertIntQuantitys = new ArrayList<Integer>();
			for(String quantity: quantitys) {
				convertIntQuantitys.add(Integer.parseInt(quantity));
			}

			//カートを取得
			ArrayList<CartItemBeans> cart = (ArrayList<CartItemBeans>) session.getAttribute("cart");
			//カートアイテムの個数を更新
			for(int quantity: convertIntQuantitys) {
				int i = 0;
				cart.get(i).setQuantity(quantity);
				i++;
			}

			//セッションに更新したカートを保存
			session.setAttribute("cart", cart);

			//配送方法画面にリダイレクト
			response.sendRedirect("/MyWebSite/DeliveryMethod");
		}

	}

}
