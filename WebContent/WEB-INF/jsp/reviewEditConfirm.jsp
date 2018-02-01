<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.ReviewDataBeans"%>
<%
ReviewDataBeans rdb = (ReviewDataBeans)session.getAttribute("rdb");
String imageFileName = (String)session.getAttribute("imageFileName");
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
                    <h2 class="pageLabel">レビュー編集の確認</h2>
                    <div class="InputFormsArea">
                        <form class="" action="/MyWebSite/ReviewEditResult" enctype="multipart/form-data" method="post">
                            <ul class="InputFormsArea__formList">
                                <h3 class="InputFormsArea__title reviewProductName"><span><%= rdb.getItemName() %></span>
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
                                    <%if(imageFileName != null) { %>
                                    <div class="reviewImage"><img src="upload/<%= imageFileName %>"></div>
                                    <input type="hidden" name="photoFileName" value="<%= imageFileName %>">
                                    <% } else if(rdb.getPhotoFileName() != null) { %>
                                    <div class="reviewImage"><img src="upload/<%= rdb.getPhotoFileName() %>"></div>
                                    <input type="hidden" name="photoFileName" value="<%= rdb.getPhotoFileName() %>">
                                    <% } else { %>
                                    <input type="hidden" name="photoFileName" value="">
                                    <% } %>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>写真へのコメント</p>
                                    <textarea name="photoDesc" readonly="readonly"><%= rdb.getPhotoDesc() %></textarea>
                                </li>
                            </ul>
                            <input type="hidden" name="updateDate" value="<%= System.currentTimeMillis()%>" />
                            <div class="b-one-center u-mb15px"><button type="submit" class="button primary">編集する</button></div>
                            <div class="b-one-center u-mb15px"><a href="/MyWebSite/ReviewEdit" class="button secondary">修正する</a></div>
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
