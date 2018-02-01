<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.UserDataBeans"%>
<%@ page import="model.BuyDataBeans"%>
<%@ page import="model.ReviewDataBeans"%>
<%@ page import="model.Helper"%>
<%@ page import="java.util.ArrayList"%>
<%
UserDataBeans loginUser = (UserDataBeans)session.getAttribute("loginUser");
UserDataBeans udb = (UserDataBeans)request.getAttribute("udb");
ArrayList<BuyDataBeans> bdbList = (ArrayList<BuyDataBeans>)request.getAttribute("bdbList");
ArrayList<ReviewDataBeans> reviewList = (ArrayList<ReviewDataBeans>)request.getAttribute("reviewList");
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
                <section class="Section u-mb100px">
                    <h2 class="pageLabel">My Page</h2>
                    <div class="Profile">
                        <div class="Profile__sub">
                            <img src="upload/<%= udb.getFileName() %>" alt="" class="Profile__image">
                        </div>
                        <div class="Profile__main">
                            <div class="Profile__head">
                                <h2 class="Profile__name"><%= udb.getPetName() %></h2>
                                <div class="Profile__detail">
                                    <p><%= udb.getPetType() %>（性別：<span class="Profile__sex"><%= udb.getPetSex() %></span>）
                                        <br>生年月日：<span class="Profile__birthDate"><%= Helper.displayDate(udb.getPetBirthDate()) %></span>
                                        <br>オーナー：<span class="Profile__ownerName"><%= udb.getNickname() %>
                                    </p>
                                </div>
                            </div>
                            <div class="Profile__body">
                            <% if(udb.getPetDesc() != null) { %>
                                <p class="Profile__desc"><%= udb.getPetDesc() %></p>
                            <% } %>
                            </div>
                        </div>
                    </div>
                    <% if(loginUser != null) { %>
                    <% if(loginUser.getId() == udb.getId()) {%>
                    <div class="OwnerDetail">
                        <h3 class="OwnerDetail__title">Owner detail</h3>
                        <div class="l-row">
                            <div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">ログインID</p>
                                <p class="OwnerDetail__param"><%= udb.getLoginId() %></p>
                            </div>
                            <div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">ニックネーム</p>
                                <p class="OwnerDetail__param"><%= udb.getNickname() %></p>
                            </div>
                        </div>
                        <div class="l-row">
                       		<div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">名前</p>
                                <p class="OwnerDetail__param"><%= udb.getName() %></p>
                            </div>
                            <div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">住所</p>
                                <p class="OwnerDetail__param"><%= udb.getAddress() %></p>
                            </div>
                        </div>
                        <div class="l-row u-mb30px">
                            <div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">登録日時</p>
                                <p class="OwnerDetail__param"><%= Helper.displayDateTime(udb.getCreateDate()) %></p>
                            </div>
                            <div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">更新日時</p>
                                <p class="OwnerDetail__param"><%= Helper.displayDateTime(udb.getUpdateDate()) %></p>
                            </div>
                        </div>
                        <div class="b-one-center"><a class="button secondary" href="/MyWebSite/ProfileEdit">プロフィールを編集する</a></div>
                    </div>
                    <% } %>
                    <% } %>
                </section>
                <% if(loginUser != null) { %>
                <% if(loginUser.getId() == udb.getId() && bdbList != null) {%>
                <section class="Section u-mb100px">
                    <h2 class="sectionLabel japanese">購入履歴</h2>
                    <div class="overflowY">
                        <table class="TableList TableList--purchaseHistory u-mb30px">
                            <thead>
                                <tr>
                                    <th>購入日時</th>
                                    <th>配送方法</th>
                                    <th>購入金額</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <% for(BuyDataBeans bdb: bdbList) { %>
                                <tr>
                                    <td><%= Helper.displayDateTime(bdb.getCreateDate()) %></td>
                                    <td><%= bdb.getDeliveryMethodName() %></td>
                                    <td class="price"><%= Helper.displayPrice(bdb.getTotalPrice()) %></td>
                                    <td><a href="/MyWebSite/PurchaseDetail?buyId=<%= bdb.getId() %>">詳細</a></td>
                                </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </section>
                <% } %>
                <% } %>
       			<section class="Section Section--borderBottom">
                    <h2 class="sectionLabel">Review</h2>
                    <%
                    if(reviewList.size() == 0) {
                    %>
                    <p style="font-size: 14px; text-align: center; margin-bottom: 30px;">この商品のレビューはありません。あなたの声をお聞かせください。</p>
                    <% } %>
                    <ul id="entry_list_more" class="">
						<%
						for(ReviewDataBeans rdb: reviewList) {
						%>
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
                                    <p class="Review__productName"><%= rdb.getItemName() %>のレビュー</p>
                                    <p class="Review__date">投稿日: <%= Helper.displayDate(rdb.getCreateDate()) %></p>
                                </div>
                                <div class="Review__body l-row-left"></div>
                            </div>
                        </li>
						<% } %>
                        <div id="more_btn" class="b-one-center button-noFlame">レビューをもっと見る</div>
                    </ul>
                </section>
                <div class="b-one-center u-mb100px">
                    <a class="button primary" href="/MyWebSite/Logout">ログアウトする</a>
                </div>
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
