package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ItemDAO;
import model.ImageFileUtil;
import model.ItemDataBeans;
import model.ReviewDataBeans;
import model.UserDataBeans;

/**
 * Servlet implementation class ReviewCreate
 */
@WebServlet("/ReviewCreate")
public class ReviewCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReviewCreate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを準備
		HttpSession session = request.getSession();

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		int itemId = request.getParameter("itemId") != null?Integer.parseInt(request.getParameter("itemId")): -1;

		if(itemId != -1) {

			//商品Idから商品情報を取得
			ItemDAO itemDao = new ItemDAO();
			ItemDataBeans idb = itemDao.getItemByItemId(itemId);
			System.out.println("getting item completed");

			//セッションに商品情報保存
			session.setAttribute("idb", idb);
			System.out.println("saving item completed");
		}

		//セッションスコープからログインユーザを取得
		UserDataBeans loginUser = (UserDataBeans)session.getAttribute("loginUser");

		if(loginUser != null) {//ユーザーがログインしていたら

			//セッションの情報を取得
			ReviewDataBeans rdb = (ReviewDataBeans)session.getAttribute("rdb");
			String imagePath = (String)session.getAttribute("imagePath");
			String errorMsg = (String)session.getAttribute("errorMsg");

			//空のBeansを作成
			if(rdb == null) {
				rdb = new ReviewDataBeans();
				rdb.setTitle("");
				rdb.setReviewDesc("");
				rdb.setPhotoFileName("");
				rdb.setPhotoDesc("");
				rdb.setCreateDate(null);
				rdb.setUpdateDate(null);
			}

			//保存した画像を消去
			if(imagePath != null) {
				ImageFileUtil.fileDelete(imagePath);
			}

			//リクエストスコープに保存
			request.setAttribute("rdb", rdb);
			request.setAttribute("errorMsg", errorMsg);

			//セッションから消去
			session.removeAttribute("rdb");
			session.removeAttribute("imagePath");
			session.removeAttribute("imageFileName");
			session.removeAttribute("errorMsg");

			//レビュー作成画面へフォワード
			RequestDispatcher dispacher = request.getRequestDispatcher("/WEB-INF/jsp/reviewCreate.jsp");
			dispacher.forward(request, response);

		} else {//ログインしていなければ

			//ページ情報を保存
			String PageName = "/MyWebSite/ReviewCreate";
			session.setAttribute("returnPageName", PageName);

			//ログイン画面にフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
