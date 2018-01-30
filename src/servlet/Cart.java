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

import dao.ItemDAO;
import model.CartItemBeans;
import model.ItemDataBeans;

/**
 * Servlet implementation class Cart
 */
@WebServlet("/Cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Cart() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	//セッションを用意
		HttpSession session = request.getSession();
		//セッションからカートを取得
		ArrayList<CartItemBeans> cart = (ArrayList<CartItemBeans>)session.getAttribute("cart");

		//セッションにカートがない場合カートを作成
		if (cart == null) {
			cart = new ArrayList<CartItemBeans>();
			session.setAttribute("cart", cart);
		}

		//カートメッセージを用意
		String cartActionMessage ="";

		//カートに商品が入っていないなら
		if(cart.size() == 0) {
			cartActionMessage = "カートに商品がありません";
		}

		//リクエストスコープにメッセージを保存
		request.setAttribute("cartActionMessage", cartActionMessage);

		//カート画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cart.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();
		//セッションからカートを取得
		ArrayList<CartItemBeans> cart = (ArrayList<CartItemBeans>)session.getAttribute("cart");

		//セッションにカートがない場合カートを作成
		if (cart == null) {
			cart = new ArrayList<CartItemBeans>();
			session.setAttribute("cart", cart);
		}

		//リクエストパラメータを取得
		int itemId = request.getParameter("itemId") !=null?Integer.parseInt(request.getParameter("itemId")): -1;
		int quantity = request.getParameter("quantity") !=null?Integer.parseInt(request.getParameter("quantity")): -1;

		//カートの状態を表すメッセージを準備
		String cartActionMessage ="";

		if(itemId != -1 && quantity != -1) {

			//重複エラーメッセージ
			String repetitionErrorMsg = "";

			//同じ商品が入っていたらエラーメッセージを追加
			if(cart.size() != 0) {
				for(CartItemBeans cib: cart) {
					if(cib.getIdb().getId() == itemId) {
						repetitionErrorMsg += "その商品はすでにカートに入っています";
						break;
					}
				}
			}

			if(repetitionErrorMsg.isEmpty()) {//重複エラーがなければ

				//アイテム情報を取得
				ItemDAO itemDao = new ItemDAO();
				ItemDataBeans idb = itemDao.getItemByItemId(itemId);

				//個数と一緒にカートアイテムとして保存
				CartItemBeans cib = new CartItemBeans();
				cib.setIdb(idb);
				cib.setQuantity(quantity);

				//カートに保存
				cart.add(cib);

				//メッセージを追加
				cartActionMessage = "カートに商品が追加されました";

			} else {
				//商品重複エラーメッセージをカートメッセージとして代入
				cartActionMessage = repetitionErrorMsg;
			}
		}

		//カートに商品が入っていないなら
		if(cart.size() == 0) {
			cartActionMessage = "カートに商品がありません";
		}

		//リクエストスコープにメッセージを保存
		request.setAttribute("cartActionMessage", cartActionMessage);

		//カート画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cart.jsp");
		dispatcher.forward(request, response);

	}

}
