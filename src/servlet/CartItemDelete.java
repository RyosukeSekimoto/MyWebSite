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
@WebServlet("/CartItemDelete")
public class CartItemDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CartItemDelete() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

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
	}

}
