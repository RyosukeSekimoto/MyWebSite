package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.ImageFileDataBeans;
import model.ImageFileUtil;
import model.ItemDataBeans;
import model.ItemEditValidationLogic;

/**
 * Servlet implementation class ItemsEditConfirm
 */
@WebServlet("/ItemsEditConfirm")
@MultipartConfig(location="", maxFileSize=1024 * 1024 * 2)
public class ItemsEditConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ItemsEditConfirm() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		String itemName = request.getParameter("itemName");
		String categoryName = request.getParameter("categoryName");
		String detail = request.getParameter("detail");
		int price = Integer.parseInt(request.getParameter("price"));
		String FirstFileName = request.getParameter("existedFirstFileName");
		String SecondFileName = request.getParameter("existedSecondFileName") != null? request.getParameter("existedItemSecondFile"): null;
		String thirdFileName = request.getParameter("existedThirdFileName") != null? request.getParameter("existedItemThirdFile"): null;
		String forthFileName = request.getParameter("existedForthFileName") != null? request.getParameter("existedItemForthFile"): null;

		//商品情報をBeansに格納
		ItemDataBeans idb = new ItemDataBeans();
		idb.setId(itemId);
		idb.setName(itemName);
		idb.setCategory(categoryName);
		idb.setDetail(detail);
		idb.setPrice(price);
		idb.setFirstFileName(FirstFileName);
		idb.setSecondFileName(SecondFileName);
		idb.setThirdFileName(thirdFileName);
		idb.setForthFileName(forthFileName);

		//partを取得
		Part first = request.getPart("itemFirstFile");
		Part second = request.getPart("itemSecondFile");
		Part third = request.getPart("itemThirdFile");
		Part forth = request.getPart("itemForthFile");

		//画像の保存先フォルダの絶対パスを取得
		String path = getServletContext().getRealPath("upload/item");

		//画像情報を格納するbeansを用意
		ImageFileDataBeans firstIfdb = new ImageFileDataBeans();
		ImageFileDataBeans secondIfdb = new ImageFileDataBeans();
		ImageFileDataBeans thirdIfdb = new ImageFileDataBeans();
		ImageFileDataBeans forthIfdb = new ImageFileDataBeans();

		//アップロードされた画像の処理
		if(first.getSize() != 0.0) {
			//パラメータを保存
			firstIfdb.setFileName(ImageFileUtil.fileNameCreate(first));
			firstIfdb.setFilePath(path + "/" + ImageFileUtil.fileNameCreate(first));
			//画像を保存
			first.write(path + "/" + ImageFileUtil.fileNameCreate(first));
			System.out.println("file is saved");
		}
		if(second.getSize() != 0.0) {
			//パラメータを保存
			secondIfdb.setFileName(ImageFileUtil.fileNameCreate(second));
			secondIfdb.setFilePath(path + "/" + ImageFileUtil.fileNameCreate(second));
			//画像を保存
			second.write(path + "/" + ImageFileUtil.fileNameCreate(second));
			System.out.println("file is saved");
		}
		if(third.getSize() != 0.0) {
			//パラメータを保存
			thirdIfdb.setFileName(ImageFileUtil.fileNameCreate(third));
			thirdIfdb.setFilePath(path + "/" + ImageFileUtil.fileNameCreate(third));
			//画像を保存
			third.write(path + "/" + ImageFileUtil.fileNameCreate(third));
			System.out.println("file is saved");
		}
		if(forth.getSize() != 0.0) {
			//パラメータを保存
			forthIfdb.setFileName(ImageFileUtil.fileNameCreate(forth));
			forthIfdb.setFilePath(path + "/" + ImageFileUtil.fileNameCreate(forth));
			//画像を保存
			first.write(path + "/" + ImageFileUtil.fileNameCreate(forth));
			System.out.println("file is saved");
		}

		//入力チェックをして、エラーメッセージを取得
		ArrayList<String> errorMsgList = new ArrayList<String>();
		//バリデーションチェックしてエラーメッセージを格納
		errorMsgList = ItemEditValidationLogic.execute(idb, first);

		if (errorMsgList.size() == 0) {// バリデーションエラーメッセージが空なら確認画面へ

			//セッションに入力情報を取得
			session.setAttribute("idb", idb);

			//セッションに画像情報を保存
			session.setAttribute("firstIfdb", firstIfdb);
			session.setAttribute("secondIfdb", secondIfdb);
			session.setAttribute("thirdIfdb", thirdIfdb);
			session.setAttribute("forthIfdb", forthIfdb);

			//確認画面にフォワード
			request.getRequestDispatcher("/WEB-INF/jsp/itemsEditConfirm.jsp").forward(request, response);

		} else {//エラーメッセージが含まれていたら

			//フォーム入力情報とエラーメッセージをセッションに保存
			session.setAttribute("idb", idb);
			session.setAttribute("errorMsgList", errorMsgList);
			response.sendRedirect("/MyWebSite/ItemsEdit");
		}
	}

}
