<%@page import="model.ReviewDataBeans"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.UserDataBeans"%>
<%@ page import="model.ReviewDataBeans"%>
<%@ page import="model.ReviewFullDataBeans"%>
<%
UserDataBeans udb = (UserDataBeans)session.getAttribute("loginUser");
ReviewFullDataBeans rfdb = (ReviewFullDataBeans)request.getAttribute("rfdb");
String itemName = (String)request.getAttribute("itemName");
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
                    <h2 class="pageLabel">Review Detail</h2>
                    <div class="Review Review--detail">
                        <div class="Review__sub">
                            <a href="/MyWebSite/MyPage"><img class="Review__writerImg" src="upload/<%= rfdb.getReviewerIconFileName() %>" alt=""></a>
                            <p><a href="/MyWebSite/MyPage"><%= rfdb.getReviewer() %></a>さん</p>
                        </div>
                        <div class="Review__main">
                            <div class="Review__head">
                                <p class="Review__title">
									<%= rfdb.getRdb().getTitle() %>
                                </p>
                                <p class="Review__productName"><%= itemName %>のレビュー</p>
                                <p class="Review__date">Posted: <%= rfdb.getRdb().getCreateDate() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="review-desc">
                        <p><%= rfdb.getRdb().getReviewDesc() %></p>
                    </div>
                </section>
                <% if(rfdb.getRdb().getPhotoFileName() != null) { %>
                <section class="Section">
                    <h2 class="sectionLabel">Use image</h2>
                    <ul class="photoList">
                        <li class="photoItem">
                            <div class="photoImage"><img src="upload/<%= rfdb.getRdb().getPhotoFileName() %>" alt=""></div>
                            <% if(rfdb.getRdb().getPhotoDesc() != null) { %>
                            <p class="photoDesc"><%= rfdb.getRdb().getPhotoDesc() %></p>
                            <% } %>
                        </li>
                    </ul>
                </section>
                <% } %>
                <div class="b-one-center u-mb100px">
                    <a class="button secondary" href="/MyWebSite/ProductDetail?itemId=<%= rfdb.getRdb().getItemId() %>">この商品の詳細へ</a>
                </div>
                <% if(udb != null && udb.getId() == rfdb.getRdb().getUserId()) { %>
                <div class="b-two-center u-mb100px">
                    <a class="button secondary btnLeft" href="/MyWebSite/ReviewEdit?reviewId=<%= rfdb.getRdb().getId() %>&itemName=<%= itemName %>">このレビューを編集する</a>
                    <a class="button primary" href="/MyWebSite/ReviewDelete?reviewId=<%= rfdb.getRdb().getId() %>&itemName=<%= itemName %>">このレビューを削除する</a>
                </div>
                <% } %>
                <div class="UnderButtons UnderButtons--rightOnly u-mb60px">
                    <div id="page-top" class="UnderButtons__Right">
                        <a href="#">
                          <img src="./dist/images/top/toebeans.png" alt="" width="20" height="20">
                          ページ上部に戻る
                        </a>
                    </div>
                </div>
            </main>
        </div>
        <jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
    </div>
    <script src="./dist/js/lib/jquery-3.2.1.min.js"></script>
    <script src="./dist/js/main.js"></script>
</body>
</html>
