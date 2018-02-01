<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.UserDataBeans"%>
<%@ page import="model.ReviewDataBeans"%>
<%@ page import="model.ItemDataBeans"%>
<%@ page import="model.Helper"%>
<%@ page import="java.util.ArrayList"%>
<%
UserDataBeans udb = (UserDataBeans)session.getAttribute("loginUser");
ArrayList<ReviewDataBeans> reviewList = (ArrayList<ReviewDataBeans>)request.getAttribute("reviewList");
ArrayList<ItemDataBeans> idbList = (ArrayList<ItemDataBeans>)request.getAttribute("idbList");
%>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ToeBeans</title>
    <link rel="stylesheet" href="dist/css/main.css">
</head>

<body>
    <div id="wrapper">
        <jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
        <div class="l-content">
            <jsp:include page="/WEB-INF/jsp/sidebar.jsp"></jsp:include>
            <main class="l-main">
                <div class="ImageSlide">
                    <ul id="Slide" class="ImageSlide__main">
                        <li class="ImageSlide__item js-slide-item">
                            <a href="/MyWebSite/Category?categoryName=フード・おやつ"><img class="ImageSlide__image" src="./dist/images/top/slideImage-food-snack.jpg" alt="about our tea" width="720" height="350"></a>
                        </li>
                        <li class="ImageSlide__item js-slide-item">
                            <a href="/MyWebSite/Category?categoryName=キャットタワー"><img class="ImageSlide__image" src="./dist/images/top/slideImage-cat-tower.jpg" alt="about our coffee" width="720" height="350"></a>
                        </li>
                        <li class="ImageSlide__item js-slide-item">
                            <a href="/MyWebSite/Category?categoryName=おもちゃ"><img class="ImageSlide__image" src="./dist/images/top/slideImage-toy.jpg" alt="about our foods" width="720" height="350"></a>
                        </li>
                    </ul>
                    <div class="ImageSlide__sub">
                        <span class="ImageSlide__dot js-slide-point">image1</span>
                        <span class="ImageSlide__dot js-slide-point">image2</span>
                        <span class="ImageSlide__dot js-slide-point">image3</span>
                    </div>
                </div>
                <section class="Section">
                    <h2 class="sectionLabel">By Popularity</h2>
                    <div class="Section__item l-row">
                    <%
                    int i = 0;
                    for(ItemDataBeans idb: idbList) {
                    i++;
                    %>
                        <a href="/MyWebSite/ProductDetail?itemId=<%= idb.getId() %>" class="ProductPanel l-main-tripartitionColumn">
                            <div class="ProductPanel__sub">
                                <div class="ProductPanel--badge
                                <% if(i == 1) { %> first
                                <% } else if(i == 2) { %> second
                                <% } else if(i == 3) { %> third
								<% } %>">
								<%=i%>
                                </div>
                                <img class="ProductPanel__thumb" src="upload/item/<%= idb.getFirstFileName() %>" alt="">
                            </div>
                            <div class="ProductPanel__main">
                                <p class="ProductPanel__head"><span class="categoryBadge"><%= idb.getCategory() %></span></p>
                                <div class="ProductPanel__body">
                                <%= idb.getName() %><br>
                                  <span>¥<%= Helper.displayPrice(idb.getPrice()) %>(tax in)</span>
                                </div>
                            </div>
                        </a>
                    <% if(i % 3 == 0) {%>
					</div>
					<div class="Section__item l-row">
					<% } %>
                    <% } %>
                    </div>
                </section>
                <section class="Section">
                    <h2 class="sectionLabel">Latest　Review</h2>
                    <ul class="">
                    <% for(ReviewDataBeans rdb: reviewList) { %>
                        <li class="Review">
                            <div class="Review__sub">
                                <img class="Review__writerImg" src="upload/<%= rdb.getReviewerFileName() %>" alt="">
                                <p><%= rdb.getReviewerName() %></p>
                            </div>
                            <div class="Review__main">
                                <div class="Review__head">
                                    <p class="Review__title">
                                        <a href="/MyWebSite/ReviewDetail?reviewId=<%= rdb.getId() %>"><%= rdb.getTitle() %></a>
                                    </p>
                                    <p class="Review__productName"><%= rdb.getItemName() %></p>
                                    <p class="Review__date">投稿日: <%= Helper.displayDate(rdb.getCreateDate())%></p>
                                </div>
                                <div class="Review__body l-row-left"></div>
                            </div>
                        </li>
                    <% } %>
                    </ul>
                </section>
                <div class="UnderButtons UnderButtons--rightOnly u-mb u-mb60px">
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
    <script src="./dist/js/lib/lodash.min.js"></script>
    <script src="./dist/js/lib/flipsnap.js"></script>
    <script src="./dist/js/main.js"></script>
    <script>
        imageSlide('Slide', 2);
    </script>
</body>
</html>
