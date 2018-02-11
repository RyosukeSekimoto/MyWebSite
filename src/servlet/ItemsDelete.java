package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemDAO;
import model.ItemDataBeans;

/**
 * Servlet implementation class ItemsDelete
 */
@WebServlet("/ItemsDelete")
public class ItemsDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ItemsDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメータを取得
		int itemId = Integer.parseInt(request.getParameter("itemId"));

		//ユーザー情報を取得
		ItemDAO itemDao = new ItemDAO();
		ItemDataBeans idb = itemDao.getItemByItemId(itemId);

		//リクエストスコープに保存
		request.setAttribute("idb", idb);

		//削除画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/itemsDelete.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメータを取得
		int itemId = Integer.parseInt(request.getParameter("itemId"));

		//該当商品を削除
		ItemDAO itemDao = new ItemDAO();
		itemDao.deleteItem(itemId);

		//削除完了画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/itemsDeleteResult.jsp");
		dispatcher.forward(request, response);
	}

}
