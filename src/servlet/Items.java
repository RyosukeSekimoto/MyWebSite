package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemDAO;
import model.Helper;
import model.ItemDataBeans;

/**
 * Servlet implementation class Items
 */
@WebServlet("/Items")
public class Items extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//1ページに表示するアイテム数
	private static final int PAGE_MAX_ITEM_COUNT = 10;

    public Items() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメータの取得
		String itemName = request.getParameter("itemName");
		String categoryName = request.getParameter("categoryName");
		String createDateFrom = request.getParameter("createDateFrom");
		String createDateTo = request.getParameter("createDateTo");

		//ページ数を宣言
		int pageIntNum;
		//リクエストパラメータを取得
		String pageNum = request.getParameter("pageNum");
		//ページ番号の設置
		if(pageNum == null) {//ページ番号未指定の場合
			pageIntNum = 1;
		} else {
			pageIntNum = Integer.parseInt(pageNum);
		}

		//登録されている商品を1ページ分だけ取得
		ItemDAO itemDao = new ItemDAO();
		ArrayList<ItemDataBeans> idbList = new ArrayList<ItemDataBeans>();
		idbList = itemDao.searchItem(itemName, categoryName, createDateFrom, createDateTo, pageIntNum, PAGE_MAX_ITEM_COUNT);

		// キーワードに対しての総ページ数を取得
		double searchItemCount = itemDao.getItemCountBySearch(itemName, categoryName, createDateFrom, createDateTo);
		int pageMax = (int) Math.ceil(searchItemCount / PAGE_MAX_ITEM_COUNT);

		//リクエストスコープに保存

		//総アイテム数
		request.setAttribute("searchItemCount", (int)searchItemCount);
		// 総ページ数
		request.setAttribute("pageMax", pageMax);
		// 表示ページ
		request.setAttribute("pageIntNum", pageIntNum);
		//取得したユーザーのリスト
		request.setAttribute("idbList", idbList);

		//検索条件（初回表示時は空文字を入れて保存）
		if(Helper.isEmpty(itemName)) { itemName = "";}
		if(Helper.isEmpty(categoryName)) { categoryName = "";}
		if(Helper.isEmpty(createDateFrom)) { createDateFrom = "";}
		if(Helper.isEmpty(createDateTo)) { createDateTo = "";}

		//リクエストスコープに保存
		request.setAttribute("itemName", itemName);
		request.setAttribute("categoryName", categoryName);
		request.setAttribute("createDateFrom", createDateFrom);
		request.setAttribute("createDateTo", createDateTo);

		//ユーザー一覧画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/items.jsp");
		dispatcher.forward(request, response);
	}

}
