<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.ItemDataBeans"%>
<%@ page import="model.Helper"%>
<%@ page import="java.util.ArrayList"%>
<%
ArrayList<ItemDataBeans> itemList = (ArrayList<ItemDataBeans>)request.getAttribute("searchCategoryItemList");
String categoryName = (String)request.getAttribute("categoryName");
int pageMax = (int) request.getAttribute("pageMax");
int pageIntNum = (int) request.getAttribute("pageIntNum");
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
                <div class="Breadcrumb u-mb30px">
                    <span class="Breadcrumb__item" itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
                        <a href="/MyWebSite/Index" itemprop="url">TOP</a>
                    </span>
                    <span class="Breadcrumb__item" itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
                        <a href="category.html" itemprop="url"><%= categoryName %></a>
                    </span>
                </div>
                <section class="Section SearchResult u-mb60px">
                    <h2 class="sectionLabel japanese"><%= categoryName %></h2>
                    <div class="Section__item l-row">
                    <%
					int i = 0;
					for (ItemDataBeans idb : itemList) {
						i++;
					%>
                        <a href="/MyWebSite/ProductDetail?itemId=<%= idb.getId() %>" class="ProductPanel l-main-tripartitionColumn">
                            <div class="ProductPanel__sub">
                                <img class="ProductPanel__thumb" src="upload/item/<%=idb.getFirstFileName() %>" alt="">
                            </div>
                            <div class="ProductPanel__main">
                                <p class="ProductPanel__head"><span class="categoryBadge"><%=idb.getCategory()%></span></p>
                                <div class="ProductPanel__body">
                                  <%= idb.getName() %><br>
                                  <span>¥<%= Helper.displayPrice(idb.getPrice()) %>(tax in)</span>
                                </div>
                            </div>
                        </a>
                    <%
					if (i % 3 == 0) {
					%>
						</div>
						<div class="Section__item l-row">
					<% } %>
                    <% } %>
                    </div>
                </section>
                <ul class="Paging u-mb100px">
                	<%
                	if(pageIntNum != 1) {
                	%>
                    <li class="Paging__item"><a href="/MyWebSite/Category?categoryName=<%= categoryName %>&pageNum=<%= pageIntNum - 1 %>"><</a></li>
                    <% } %>
                    <%
					for (int j = pageIntNum - 5; j <= pageIntNum + 5; j++) {
					%>
					<%
					if (j <= 0) {
							j = 1;
						}
					%>
                    <li class="Paging__item number"><a href="/MyWebSite/Category?categoryName=<%= categoryName %>&pageNum=<%= j %>" <% if(pageIntNum == j) { %> class="active" <% } %>><%= j %></a></li>
                    <%
					if (pageMax <= j) {
							break;
						}
					%>
                    <% } %>
                    <%
					if (pageIntNum != pageMax) {
					%>
                    <li class="Paging__item"><a href="/MyWebSite/Category?categoryName=<%= categoryName %>&pageNum=<%= pageIntNum + 1 %>">></a></li>
                    <% } %>
                </ul>
                <div class="UnderButtons u-mb60px">
                    <div class="UnderButtons__Left"><a href="/MyWebSite/Index">トップページに戻る</a></div>
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
