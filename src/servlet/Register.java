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

import model.ImageFileUtil;
import model.UserDataBeans;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Register() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		//セッションの情報を取得
		UserDataBeans udb = (UserDataBeans)session.getAttribute("udb");
		String imagePath = (String)session.getAttribute("imagePath");
		ArrayList<String> errorMsgList = new ArrayList<String>();
		errorMsgList = (ArrayList<String>)session.getAttribute("errorMsgList");

		//空のBeansを作成
		if(udb == null) {
			udb = new UserDataBeans();
			udb.setName("");
			udb.setNickname("");
			udb.setAddress("");
			udb.setLoginId("");
			udb.setPass("");
			udb.setPetName("");
			udb.setPetType("");
			udb.setPetBirthDate(null);
			udb.setPetSex("");
			udb.setPetDesc("");
		}

		//保存した画像を画像を消去
		if(imagePath != null) {
			ImageFileUtil.fileDelete(imagePath);
		}

		//リクエストスコープに保存
		request.setAttribute("udb", udb);
		request.setAttribute("errorMsgList", errorMsgList);

		//セッションから消去
		session.removeAttribute("udb");
		session.removeAttribute("imagePath");
		session.removeAttribute("imageFileName");
		session.removeAttribute("errorMsgList");

		//新規登録画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/register.jsp");
		dispatcher.forward(request, response);
	}

}
