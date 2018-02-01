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
 * Servlet implementation class DeliveryMethod
 */
@WebServlet("/DeliveryMethod")
public class DeliveryMethod extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeliveryMethod() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		//セッションからログインユーザーを取得
		UserDataBeans loginUser = (UserDataBeans)session.getAttribute("loginUser");
		//カートを取得
		ArrayList<CartItemBeans> cart = (ArrayList<CartItemBeans>)session.getAttribute("cart");

		//購入情報がセッションにあったら破棄
		BuyDataBeans bdb = (BuyDataBeans)session.getAttribute("bdb");
		if(bdb != null) {
			session.removeAttribute("bdb");
		}

		if(loginUser != null) {//ログインしていたら

			if(cart.size() == 0) {//カートに商品がなかった場合

				//カートメッセージをリクエストスコープに保存
				request.setAttribute("cartActionMessage", "カートに商品が入っておりません");
				//カート画面にフォワード
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cart.jsp");
				dispatcher.forward(request, response);

			} else {//カートに商品が入っていたら

				// 配送方法をDBから取得
				DeliveryMethodDAO deliveryMethodDao = new DeliveryMethodDAO();
				ArrayList<DeliveryMethodDataBeans> dmdbList = deliveryMethodDao.getAllDeliveryMethodDataBeans();

				//リクエストスコープに配送方法を保存
				request.setAttribute("dmdbList", dmdbList);

				//配送方法選択画面にフォワード
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/deliveryMethod.jsp");
				dispatcher.forward(request, response);
			}

		} else {//ログインしていなかった場合

			//ページ情報を保存
			String PageName = "/MyWebSite/DeliveryMethod";
			session.setAttribute("returnPageName", PageName);

			//ログイン画面にフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
