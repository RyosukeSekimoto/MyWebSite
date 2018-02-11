package servlet;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ItemDAO;
import model.ItemDataBeans;

/**
 * Servlet implementation class ItemsEditResult
 */
@WebServlet("/ItemsEditResult")
@MultipartConfig(location="", maxFileSize=1024 * 1024 * 2)
public class ItemsEditResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ItemsEditResult() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		String itemName = request.getParameter("itemName");
		String categoryName = request.getParameter("CategoryName");
		String detail = request.getParameter("detail");
		int price = Integer.parseInt(request.getParameter("price"));
		String itemFirstFileName = request.getParameter("itemFirstFileName");
		String itemSecondFileName = request.getParameter("itemSecondFileName");
		String itemThirdFileName = request.getParameter("itemThirdFileName");
		String itemForthFileName = request.getParameter("itemForthFileName");
		Timestamp updateDate = new Timestamp(Long.parseLong(request.getParameter("updateDate")));
		int itemId = Integer.parseInt(request.getParameter("itemId"));

		//商品情報をBeansに格納
		ItemDataBeans idb = new ItemDataBeans();
		idb.setId(itemId);
		idb.setName(itemName);
		idb.setCategory(categoryName);
		idb.setDetail(detail);
		idb.setPrice(price);
		idb.setFirstFileName(itemFirstFileName);
		idb.setSecondFileName(itemSecondFileName);
		idb.setThirdFileName(itemThirdFileName);
		idb.setForthFileName(itemForthFileName);
		idb.setUpdateDate(updateDate);

		//データベースの商品情報を更新
		ItemDAO itemDao = new ItemDAO();
		itemDao.updateItem(idb);

		//セッションを破棄
		session.removeAttribute("idb");
		session.removeAttribute("ifdbList");

		//登録完了ページにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/itemsEditResult.jsp");
		dispatcher.forward(request, response);
	}

}
