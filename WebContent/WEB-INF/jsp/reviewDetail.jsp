<%@page import="model.ReviewDataBeans"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.UserDataBeans"%>
<%@ page import="model.ReviewDataBeans"%>
<%@ page import="model.Helper"%>
<%
UserDataBeans udb = (UserDataBeans)session.getAttribute("loginUser");
ReviewDataBeans rdb = (ReviewDataBeans)request.getAttribute("rdb");
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
                            <a href="/MyWebSite/Mypage?userId=<%= rdb.getUserId() %>"><img class="Review__writerImg" src="upload/<%= rdb.getReviewerFileName() %>" alt=""></a>
                            <p><a href="/MyWebSite/Mypage?userId=<%= rdb.getUserId() %>"><%= rdb.getReviewerName() %></a></p>
                        </div>
                        <div class="Review__main">
                            <div class="Review__head">
                                <p class="Review__title">
									<%= rdb.getTitle() %>
                                </p>
                                <p class="Review__productName"><%= rdb.getItemName() %>のレビュー</p>
                                <p class="Review__date">投稿日: <%= Helper.displayDate(rdb.getCreateDate()) %></p>
                            </div>
                        </div>
                    </div>
                    <div class="review-desc">
                        <p><%= rdb.getReviewDesc() %></p>
                    </div>
                </section>
                <% if(rdb.getPhotoFileName() != null) { %>
                <section class="Section">
                    <h2 class="sectionLabel">Use image</h2>
                    <ul class="photoList">
                        <li class="photoItem">
                            <div class="photoImage"><img src="upload/review/<%= rdb.getPhotoFileName() %>" alt=""></div>
                            <% if(rdb.getPhotoDesc() != null) { %>
                            <p class="photoDesc"><%= rdb.getPhotoDesc() %></p>
                            <% } %>
                        </li>
                    </ul>
                </section>
                <% } %>
                <div class="b-one-center u-mb100px">
                    <a class="button secondary" href="/MyWebSite/ProductDetail?itemId=<%= rdb.getItemId() %>">この商品の詳細へ</a>
                </div>
                <% if(udb != null && udb.getId() == rdb.getUserId()) { %>
                <div class="b-two-center u-mb100px">
                    <a class="button secondary btnLeft" href="/MyWebSite/ReviewEdit?reviewId=<%= rdb.getId() %>">このレビューを編集する</a>
                    <a class="button primary" href="/MyWebSite/ReviewDelete?reviewId=<%= rdb.getId() %>">このレビューを削除する</a>
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
