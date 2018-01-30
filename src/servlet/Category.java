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

@WebServlet("/Category")
public class Category extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//1ページに表示する商品数
	final static int PAGE_MAX_ITEM_COUNT = 9;

    public Category() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		String searchCategory = request.getParameter("categoryName");
		//押されたページ番号を取得
		String pageNum = request.getParameter("pageNum");

		//ページ番号を宣言
		int pageIntNum;

		//ページ番号の設置
		if(pageNum == null) {//ページ番号未指定の場合
			pageIntNum = 1;
		} else {
			pageIntNum = Integer.parseInt(pageNum);
		}

		// 商品リストを取得 ページ表示分のみ
		ItemDAO itemDao = new ItemDAO();
		ArrayList<ItemDataBeans> searchCategoryItemList = itemDao.getItemsByCategory(searchCategory, pageIntNum, PAGE_MAX_ITEM_COUNT);

		// カテゴリに対しての総ページ数を取得
		double itemCount = itemDao.getItemCountByCate(searchCategory);
		int pageMax = (int) Math.ceil(itemCount / PAGE_MAX_ITEM_COUNT);

		//選択しているカテゴリ
		request.setAttribute("categoryName", searchCategory);
		// 総ページ数
		request.setAttribute("pageMax", pageMax);
		// 表示ページ
		request.setAttribute("pageIntNum", pageIntNum);
		request.setAttribute("searchCategoryItemList", searchCategoryItemList);

		request.getRequestDispatcher("/WEB-INF/jsp/category.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
