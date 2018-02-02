package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.ImageFileUtil;
import model.ReviewDataBeans;
import model.ReviewValidationLogic;

/**
 * Servlet implementation class ReviewEditConfirm
 */
@WebServlet("/ReviewEditConfirm")
@MultipartConfig(location="", maxFileSize=1024 * 1024 * 2)
public class ReviewEditConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReviewEditConfirm() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String reviewDesc = request.getParameter("reviewDesc");
		String photoDesc = request.getParameter("photoDesc");
		String photoFileName = request.getParameter("existedReviewPhotoFileName") != null ? request.getParameter("existedReviewPhotoFileName"): null;
		String itemName = request.getParameter("itemName");

		//レビュー情報をBeansに格納
		ReviewDataBeans rdb = new ReviewDataBeans();
		rdb.setTitle(title);
		rdb.setReviewDesc(reviewDesc);
		rdb.setPhotoDesc(photoDesc);
		rdb.setPhotoFileName(photoFileName);
		rdb.setItemName(itemName);

		//ファイルデータを取得
		Part part = request.getPart("reviewPhotoFile");
		//保存先フォルダの絶対パス
		String path = getServletContext().getRealPath("upload/review");
		//保存するファイルの絶対パスを初期化
		String imagePath = null;
		//保存するファイル名を初期化
		String imageFileName = null;

		if(part.getSize() != 0.0) {//ファイルがアップロードされていれば

			//画像ファイルの名前を取得して格納
			imageFileName = ImageFileUtil.fileNameCreate(part);
			//ファイルの絶対パスを保存
			imagePath = path + "/" + imageFileName;
			//画像ファイルを保存
			part.write(imagePath);
			System.out.println("file is saved");
		}

		//入力チェックをしてエラーメッセージを取得
		String errorMsg = ReviewValidationLogic.execute(rdb, part);

		if (errorMsg.isEmpty()) {// バリデーションエラーメッセージが空なら確認画面へ

			//セッションに入力情報を保存
			session.setAttribute("rdb", rdb);

			if(part.getSize() != 0.0) {//画像がアップロードされていたら

				//セッションにアップロード画像の情報を保存
				session.setAttribute("imagePath", imagePath);
				session.setAttribute("imageFileName", imageFileName);
			}

			//登録確認ページにフォワード
			request.getRequestDispatcher("/WEB-INF/jsp/reviewEditConfirm.jsp").forward(request, response);

		} else {//エラーメッセージが含まれていたら
			session.setAttribute("rdb", rdb);
			session.setAttribute("errorMsg", errorMsg);
			response.sendRedirect("/MyWebSite/ReviewEdit");
		}

	}

}
