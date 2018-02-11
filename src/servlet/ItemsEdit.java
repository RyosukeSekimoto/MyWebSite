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
import model.ImageFileDataBeans;
import model.ImageFileUtil;
import model.ItemDataBeans;

/**
 * Servlet implementation class ItemsEdit
 */
@WebServlet("/ItemsEdit")
public class ItemsEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ItemsEdit() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		//リクエストパラメータを取得
		int itemId = request.getParameter("itemId") != null?Integer.parseInt(request.getParameter("itemId")): -1;

		if(itemId != -1) {
			//一覧から飛んできた場合、商品データを取得
			ItemDAO itemDao = new ItemDAO();
			ItemDataBeans idb = itemDao.getItemByItemId(itemId);
			//リクエストスコープに保存
			request.setAttribute("idb", idb);

		} else {
			//セッションの情報を取得
			ItemDataBeans idb = (ItemDataBeans)session.getAttribute("idb");
			ImageFileDataBeans firstIfdb = (ImageFileDataBeans)session.getAttribute("firstIfdb");
			ImageFileDataBeans secondIfdb = (ImageFileDataBeans)session.getAttribute("secondIfdb");
			ImageFileDataBeans thirdIfdb = (ImageFileDataBeans)session.getAttribute("thirdIfdb");
			ImageFileDataBeans forthIfdb = (ImageFileDataBeans)session.getAttribute("forthIfdb");
			ArrayList<String> errorMsgList = (ArrayList<String>)session.getAttribute("errorMsgList");

			//保存した画像を画像を消去
			if(firstIfdb.getFileName() != null) {ImageFileUtil.fileDelete(firstIfdb.getFilePath());}
			if(secondIfdb.getFileName() != null) {ImageFileUtil.fileDelete(secondIfdb.getFilePath());}
			if(thirdIfdb.getFileName() != null) {ImageFileUtil.fileDelete(thirdIfdb.getFilePath());}
			if(forthIfdb.getFileName() != null) {ImageFileUtil.fileDelete(forthIfdb.getFilePath());}

			//リクエストスコープに保存
			request.setAttribute("idb", idb);
			request.setAttribute("errorMsgList", errorMsgList);
			request.setAttribute("firstIfdb", firstIfdb);
			request.setAttribute("secondIfdb", secondIfdb);
			request.setAttribute("thirdIfdb", thirdIfdb);
			request.setAttribute("forthIfdb", forthIfdb);

			//セッションから消去
			session.removeAttribute("idb");
			session.removeAttribute("firstIfdb");
			session.removeAttribute("secondIfdb");
			session.removeAttribute("thirdIfdb");
			session.removeAttribute("forthIfdb");
			session.removeAttribute("errorMsgList");
		}

		//プロフィール編集画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/itemsEdit.jsp");
		dispatcher.forward(request, response);
	}

}
