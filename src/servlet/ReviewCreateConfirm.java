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
 * Servlet implementation class ReviewCreateConfirm
 */
@WebServlet("/ReviewCreateConfirm")
@MultipartConfig(location="", maxFileSize=1024 * 1024 * 2)
public class ReviewCreateConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReviewCreateConfirm() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//セッションを用意
		HttpSession session = request.getSession();

		//リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String itemId = request.getParameter("itemId");
		String title = request.getParameter("title");
		String reviewDesc = request.getParameter("reviewDesc");
		String photoDesc = request.getParameter("photoDesc");

		//レビュー情報をBeansに格納
		ReviewDataBeans rdb = new ReviewDataBeans();
		rdb.setUserId(Integer.parseInt(userId));
		rdb.setItemId(Integer.parseInt(itemId));
		rdb.setTitle(title);
		rdb.setReviewDesc(reviewDesc);
		rdb.setPhotoDesc(photoDesc);

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
			session.setAttribute("rdb", rdb);
			if(part.getSize() != 0.0) {//画像がアップロードされていたら
				session.setAttribute("imagePath", imagePath);
				session.setAttribute("imageFileName", imageFileName);
			}
			request.getRequestDispatcher("/WEB-INF/jsp/reviewCreateConfirm.jsp").forward(request, response);

		} else {//エラーメッセージが含まれていたら
			session.setAttribute("rdb", rdb);
			session.setAttribute("errorMsg", errorMsg);
			response.sendRedirect("/MyWebSite/ReviewCreate");
		}

	}

}
