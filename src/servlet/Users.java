package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.Helper;
import model.UserDataBeans;

/**
 * Servlet implementation class Users
 */
@WebServlet("/Users")
public class Users extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//1ページに表示する商品数
	final static int PAGE_MAX_USER_COUNT = 10;

    public Users() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//リクエストパラメータの取得
		String loginId = request.getParameter("loginId");
		String name = request.getParameter("name");
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

		//登録されているユーザーを1ページ分だけ取得
		UserDAO userDao = new UserDAO();
		ArrayList<UserDataBeans> udbList = new ArrayList<UserDataBeans>();
		udbList = userDao.searchUser(loginId, name, createDateFrom, createDateTo, pageIntNum, PAGE_MAX_USER_COUNT);

		// キーワードに対しての総ページ数を取得
		double searchUserCount = userDao.getUserCountBySearch(loginId, name, createDateFrom, createDateTo);
		int pageMax = (int) Math.ceil(searchUserCount / PAGE_MAX_USER_COUNT);

		//リクエストスコープに保存

		//総アイテム数
		request.setAttribute("searchUserCount", (int)searchUserCount);
		// 総ページ数
		request.setAttribute("pageMax", pageMax);
		// 表示ページ
		request.setAttribute("pageIntNum", pageIntNum);
		//取得したユーザーのリスト
		request.setAttribute("udbList", udbList);

		//検索条件（初回表示時には空文字を保存）
		if(Helper.isEmpty(loginId)) { loginId = ""; }
		if(Helper.isEmpty(name)) { name = ""; }
		if(Helper.isEmpty(createDateFrom)) { createDateFrom = ""; }
		if(Helper.isEmpty(createDateTo)) { createDateTo = ""; }

		request.setAttribute("loginId", loginId);
		request.setAttribute("name", name);
		request.setAttribute("createDateFrom", createDateFrom);
		request.setAttribute("createDateTo", createDateTo);

		//ユーザー一覧画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/users.jsp");
		dispatcher.forward(request, response);
	}
}
