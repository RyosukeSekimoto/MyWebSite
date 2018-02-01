<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.ReviewDataBeans"%>
<%
ReviewDataBeans rdb = (ReviewDataBeans)request.getAttribute("rdb");
String errorMsg = (String)request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ToeBeans</title>
    <link rel="stylesheet" href="./dist/css/main.css">
</head>

<body>
    <div id="wrapper">
        <jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
        <div class="l-content">
            <main class="l-main">
                <section class="Section">
                    <h2 class="pageLabel">レビューの編集</h2>
                    <%if(errorMsg != null) { %>
					<p class="validation"><%= errorMsg %></p>
					<% } %>
                    <div class="InputFormsArea">
                        <form class="" action="/MyWebSite/ReviewEditConfirm" enctype="multipart/form-data" method="post">
                            <ul class="InputFormsArea__formList">
                                <h3 class="InputFormsArea__title reviewProductName"><span><%= rdb.getItemName() %></span>
                                    <br>についてのレビュー
                                </h3>
                                <li class="InputFormsArea__formItem">
                                    <p>タイトル</p>
                                    <input type="text" name="title" value="<%= rdb.getTitle() %>">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>本文</p>
                                    <textarea name="reviewDesc"><%= rdb.getReviewDesc() %></textarea>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>写真</p>
                                    <input type="file" id="file" name="reviewPhotoFile"/>
                                    <div id="result" class="reviewImage"></div>
                                    <% if(rdb.getPhotoFileName() != null) { %>
                                    <div class="reviewImage"><img src="upload/<%= rdb.getPhotoFileName() %>"></div>
                                    <input type="hidden" name="existedReviewPhotoFileName" value="<%= rdb.getPhotoFileName() %>">
                                    <% } %>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>写真へのコメント</p>
                                    <textarea name="photoDesc"><%= rdb.getPhotoDesc() %></textarea>
                                </li>
                            </ul>
                            <div class="b-one-center u-mb15px"><button type="submit" class="button secondary">編集確認へ</button></div>
                        </form>
                    </div>
                </section>
            </main>
        </div>
        <jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
    </div>
    <script src="./dist/js/lib/jquery-3.2.1.min.js"></script>
    <script src="./dist/js/main.js"></script>
</body>
</html>
