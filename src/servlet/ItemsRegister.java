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

import model.ImageFileDataBeans;
import model.ImageFileUtil;
import model.ItemDataBeans;

/**
 * Servlet implementation class ItemsRegister
 */
@WebServlet("/ItemsRegister")
public class ItemsRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ItemsRegister() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		//セッションの情報を取得
		ItemDataBeans idb = (ItemDataBeans)session.getAttribute("idb");
		ArrayList<String> errorMsgList = (ArrayList<String>)session.getAttribute("errorMsgList");
		ArrayList<ImageFileDataBeans> ifdbList = (ArrayList<ImageFileDataBeans>)session.getAttribute("ifdbList");

		//空のBeansを作成
		if(idb == null) {
			idb = new ItemDataBeans();
			idb.setName("");
			idb.setCategory("");
			idb.setDetail("");
			idb.setPrice(0);
			idb.setFirstFileName("");
			idb.setSecondFileName("");
			idb.setThirdFileName("");
			idb.setForthFileName("");
		}

		//保存した画像を画像を消去
		if(ifdbList != null) {
			//メイン画像を必ず消去
			ImageFileUtil.fileDelete(ifdbList.get(0).getFilePath());
			//サブ画像が入っていたらそれぞれ消去
			if(2 <= ifdbList.size()) {ImageFileUtil.fileDelete(ifdbList.get(1).getFilePath());}
			if(3 <= ifdbList.size()) {ImageFileUtil.fileDelete(ifdbList.get(2).getFilePath());}
			if(4 <= ifdbList.size()) {ImageFileUtil.fileDelete(ifdbList.get(3).getFilePath());}
		}

		//リクエストスコープに保存
		request.setAttribute("idb", idb);
		request.setAttribute("errorMsgList", errorMsgList);

		//セッションから消去
		session.removeAttribute("idb");
		session.removeAttribute("ifdbList");
		session.removeAttribute("errorMsgList");

		//ユーザー新規登録画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/itemsRegister.jsp");
		dispatcher.forward(request, response);

	}

}
