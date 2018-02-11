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
import model.ItemRegisterValidationLogic;

/**
 * Servlet implementation class ItemsRegisterConfirm
 */
@WebServlet("/ItemsRegisterConfirm")
@MultipartConfig(location="", maxFileSize=1024 * 1024 * 2)
public class ItemsRegisterConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ItemsRegisterConfirm() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		String itemName = request.getParameter("itemName");
		String categoryName = request.getParameter("categoryName");
		String detail = request.getParameter("detail");
		int price = Integer.parseInt(request.getParameter("price"));

		//商品情報をBeansに格納
		ItemDataBeans idb = new ItemDataBeans();
		idb.setName(itemName);
		idb.setCategory(categoryName);
		idb.setDetail(detail);
		idb.setPrice(price);

		//メイン画像のpartをバリデーション用に用意
		Part mainImagePart = request.getPart("itemFirstFile");

		//ファイルデータを取得
		ArrayList<Part> partList = new ArrayList<Part>();
		partList.add(mainImagePart);
		partList.add(request.getPart("itemSecondFile"));
		partList.add(request.getPart("itemThirdFile"));
		partList.add(request.getPart("itemForthFile"));

		//画像の保存先フォルダの絶対パスを取得
		String path = getServletContext().getRealPath("upload/item");

		//画像ファイル情報が入ったbeansのリスト
		ArrayList<ImageFileDataBeans> ifdbList = new ArrayList<ImageFileDataBeans>();

		for(Part part: partList) {

			if(part.getSize() != 0.0) {

				//beansにパラメータを格納
				ImageFileDataBeans ifdb = new ImageFileDataBeans();
				ifdb.setFileName(ImageFileUtil.fileNameCreate(part));
				ifdb.setFilePath(path + "/" + ImageFileUtil.fileNameCreate(part));

				//リストに保存
				ifdbList.add(ifdb);

				//画像を保存
				part.write(path + "/" + ImageFileUtil.fileNameCreate(part));
				System.out.println("file is saved");

			} else {//画像が上がっていなければ上記をスキップ
				continue;
			}
		}

		//入力チェックをして、エラーメッセージを取得
		ArrayList<String> errorMsgList = new ArrayList<String>();
		//バリデーションチェックしてエラーメッセージを格納
		errorMsgList = ItemRegisterValidationLogic.execute(idb, mainImagePart);

		if (errorMsgList.size() == 0) {// バリデーションエラーメッセージが空なら確認画面へ

			//セッションに入力情報を取得
			session.setAttribute("idb", idb);
			//セッションに画像情報を保存
			session.setAttribute("ifdbList", ifdbList);
			//確認画面にフォワード
			request.getRequestDispatcher("/WEB-INF/jsp/itemsRegisterConfirm.jsp").forward(request, response);

		} else {//エラーメッセージが含まれていたら

			//フォーム入力情報とエラーメッセージをセッションに保存
			session.setAttribute("idb", idb);
			session.setAttribute("errorMsgList", errorMsgList);

			//登録画面にリダイレクト
			response.sendRedirect("/MyWebSite/ItemsRegister");
		}
	}

}
