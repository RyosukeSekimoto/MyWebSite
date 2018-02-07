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
 * Servlet implementation class ItemsDetail
 */
@WebServlet("/ItemsDetail")
public class ItemsDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ItemsDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		System.out.println(itemId);

		//ログインIDに紐づいたユーザー情報を取得
		ItemDAO itemDao = new ItemDAO();

		//beansに格納
		ItemDataBeans idb = new ItemDataBeans();
		idb = itemDao.getItemByItemId(itemId);

		//リクエストスコープに保存
		request.setAttribute("idb", idb);

		//ユーザー詳細ページにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/itemsDetail.jsp");
		dispatcher.forward(request, response);

	}

}
