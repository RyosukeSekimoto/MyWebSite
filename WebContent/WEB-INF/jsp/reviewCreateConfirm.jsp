<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.ReviewDataBeans"%>
<%@ page import="model.ItemDataBeans"%>
<%
ReviewDataBeans rdb = (ReviewDataBeans)session.getAttribute("rdb");
String imageFileName = (String)session.getAttribute("imageFileName");
ItemDataBeans idb = (ItemDataBeans)session.getAttribute("idb");
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
                    <h2 class="pageLabel">レビューの確認</h2>
                    <div class="InputFormsArea">
                        <form class="" action="/MyWebSite/ReviewCreateResult" method="post">
                            <ul class="InputFormsArea__formList">
                                <h3 class="InputFormsArea__title reviewProductName"><span><%= idb.getName() %></span>
                                    <br>についてのレビュー
                                </h3>
                                <li class="InputFormsArea__formItem">
                                    <p>タイトル</p>
                                    <input type="text" name="title" value="<%= rdb.getTitle() %>" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>本文</p>
                                    <textarea name="reviewDesc" readonly="readonly"><%= rdb.getReviewDesc() %></textarea>
                                </li>
                                <li class="InputFormsArea__formItem">
                                	<p>写真</p>
                                    <input type="hidden" name="photoFileName" <% if(imageFileName != null) { %>
                                    value="<%= imageFileName %>"
                                    <% } else { %>
                                    value=""
                                    <% } %>
                                    readonly="readonly">
                                    <%if(imageFileName != null) { %>
                                    <div class="reviewImage"><img src="upload/<%= imageFileName %>"></div>
                                    <% } %>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>写真へのコメント</p>
                                    <% if(rdb.getPhotoDesc() != null) { %>
                                    <textarea name="photoDesc" readonly="readonly"><%= rdb.getPhotoDesc() %></textarea>
                                    <% } %>
                                </li>
                            </ul>
                            <input type="hidden" name="userId" value="<%= rdb.getUserId() %>">
                            <input type="hidden" name="itemId" value="<%= rdb.getItemId() %>">
                            <input type="hidden" name="createDate" value="<%= System.currentTimeMillis()%>" />
                        	<input type="hidden" name="updateDate" value="<%= System.currentTimeMillis()%>" />
                            <div class="b-one-center u-mb15px"><button type="submit" class="button primary">上記の内容で投稿する</button></div>
                            <div class="b-one-center u-mb15px"><a href="/MyWebSite/ReviewCreate" class="button secondary">修正する</a></div>
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
