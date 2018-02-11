package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemDAO;
import model.ItemDataBeans;

/**
 * Servlet implementation class SearchResult
 */
@WebServlet("/SearchResult")
public class SearchResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//1ページに表示する商品数
	final static int PAGE_MAX_ITEM_COUNT = 9;

    public SearchResult() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		String searchWord = request.getParameter("searchWord");
		//押されたページ番号を取得
		String pageNum = request.getParameter("pageNum");

		//int型のページ番号を宣言
		int pageIntNum;

		//ページ番号の設置
		if(pageNum == null) {//ページ番号未指定の場合
			pageIntNum = 1;
		} else {
			pageIntNum = Integer.parseInt(pageNum);
		}

		// 商品リストを取得 ページ表示分のみ
		ItemDAO productDao = new ItemDAO();
		ArrayList<ItemDataBeans> searchWordItemList = productDao.getItemsBySearchWord(searchWord, pageIntNum, PAGE_MAX_ITEM_COUNT);

		// キーワードに対しての総ページ数を取得
		double itemCount = productDao.getItemCountByItemInfo(searchWord);
		int pageMax = (int) Math.ceil(itemCount / PAGE_MAX_ITEM_COUNT);

		//選択しているカテゴリ
		request.setAttribute("searchWord", searchWord);
		//総アイテム数
		request.setAttribute("itemCount", (int)itemCount);
		//総ページ数
		request.setAttribute("pageMax", pageMax);
		//表示ページ
		request.setAttribute("pageIntNum", pageIntNum);
		//検索結果の商品リスト
		request.setAttribute("searchWordItemList", searchWordItemList);

		request.getRequestDispatcher("/WEB-INF/jsp/searchResult.jsp").forward(request, response);
	}

}
