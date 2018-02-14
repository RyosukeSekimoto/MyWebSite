<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="model.ItemDataBeans"%>
<%@ page import="model.Helper"%>
<%@ page import="java.util.ArrayList"%>

<%
ArrayList<ItemDataBeans> idbList = (ArrayList<ItemDataBeans>)request.getAttribute("idbList");
int pageMax = (int) request.getAttribute("pageMax");
int pageIntNum = (int) request.getAttribute("pageIntNum");
int searchItemCount = (int) request.getAttribute("searchItemCount");
String itemName = (String)request.getAttribute("itemName");
String categoryName = (String)request.getAttribute("categoryName");
String createDateFrom = (String)request.getAttribute("createDateFrom");
String createDateTo = (String)request.getAttribute("createDateTo");
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
        <jsp:include page="/WEB-INF/jsp/adminHeader.jsp"></jsp:include>
        <div class="l-content">
            <main class="l-main">
                <section class="Section">
                    <div class="adminTitleWrapper">
                        <h2>商品一覧</h2>
                        <a class="button primary" href="/MyWebSite/ItemsRegister">商品新規登録</a>
                    </div>
                    <form class="MgSearchArea u-mb30px" action="/MyWebSite/Items" method="get">
                        <div class="MgSearchArea__wrapper">
                            <div class="MgSearchArea__item">
                                <p class="MgSearchArea__formLabel">商品名</p>
                                <input type="text" name="itemName" value="<c:out value="${itemName}" />" class="searchAreaInput">
                            </div>
                            <div class="MgSearchArea__item">
                                <p class="MgSearchArea__formLabel">カテゴリ</p>
                                <select name="categoryName">
                                    <option value="">選択してください</option>
                                    <option value="フード・おやつ" <c:if test="${categoryName.equals('フード・おやつ')}">selected</c:if>>フード・おやつ</option>
                                    <option value="キャットタワー" <c:if test="${categoryName.equals('キャットタワー')}">selected</c:if>>キャットタワー</option>
                                    <option value="おもちゃ" <c:if test="${categoryName.equals('おもちゃ')}">selected</c:if>>おもちゃ</option>
                                    <option value="爪とぎ" <c:if test="${categoryName.equals('爪とぎ')}">selected</c:if>>爪とぎ</option>
                                    <option value="首輪" <c:if test="${categoryName.equals('首輪')}">selected</c:if>>首輪</option>
                                    <option value="トイレ・猫砂" <c:if test="${categoryName.equals('トイレ・猫砂')}">selected</c:if>>トイレ・猫砂</option>
                                    <option value="猫雑貨" <c:if test="${categoryName.equals('猫雑貨')}">selected</c:if>>猫雑貨</option>
                                </select>
                            </div>
                            <div class="MgSearchArea__item">
                                <p class="MgSearchArea__formLabel">登録日時</p>
                                <div class="MgSearchArea__dateInputWrapper">
                                    <input type="date" name="createDateFrom" value="<c:out value="${createDateFrom}" />" class=""><span style="margin: 0 4px">~</span><input type="date" name="createDateTo" value="<c:out value="${createDateTo}" />" class="">
                                </div>
                            </div>
                        </div>
                        <div class="MgSearchArea__searchButton"><input class="econdary" type="submit" value="検索"></div>
                    </form>
                    <%
                    if(idbList.size() == 0) {
                    %>
                    <p class="message">該当する商品は存在しておりません。</p>
                    <%
                    } else {
                    %>
                    <table class="TableList TableList--productManagement u-mb60px">
                        <thead>
                            <tr>
                                <th>商品名</th>
                                <th>カテゴリ名</th>
                                <th>登録日時</th>
                                <th class=""></th>
                                <th class=""></th>
                                <th class=""></th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="idb" items="${idbList}">
                            <tr>
                                <td class="productName"><c:out value="${idb.getName()}" /></td>
                                <td class=""><c:out value="${idb.getCategory()}" /></td>
                                <td class=""><c:out value="${Helper.displayDate(idb.getCreateDate())}" /></td>
                                <td>
                                    <a class="" href="/MyWebSite/ItemsDetail?itemId=<c:out value="${idb.getId()}" />">詳細</a>
                                </td>
                                <td>
                                    <a class="" href="/MyWebSite/ItemsEdit?itemId=<c:out value="${idb.getId()}" />">更新</a>
                                </td>
                                <td>
                                    <a class="" href="/MyWebSite/ItemsDelete?itemId=<c:out value="${idb.getId()}" />">削除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <ul class="Paging u-mb100px">
                	<%
                	if(pageIntNum != 1) {
                	%>
                    <li class="Paging__item"><a href="/MyWebSite/Items?pageNum=<%= pageIntNum - 1 %>&itemName=<%= itemName %>&categoryName=<%= categoryName %>&createDateFrom=<%= createDateFrom %>&createDateTo=<%= createDateTo %>"><</a></li>
                    <%
                    }
                    %>
                    <%
					for (int j = pageIntNum - 5; j <= pageIntNum + 5; j++) {
					%>
					<%
					if (j <= 0) {
							j = 1;
						}
					%>
                    <li class="Paging__item number"><a href="/MyWebSite/Items?pageNum=<%= j %>&itemName=<%= itemName %>&categoryName=<%= categoryName %>&createDateFrom=<%= createDateFrom %>&createDateTo=<%= createDateTo %>" <% if(pageIntNum == j) { %> class="active" <% } %>><%= j %></a></li>
                    <%
					if (pageMax <= j) {
							break;
						}
					%>
                    <%
                    }
                    %>
                    <%
					if (pageIntNum != pageMax) {
					%>
                    <li class="Paging__item"><a href="/MyWebSite/Items?pageNum=<%= pageIntNum + 1 %>&itemName=<%= itemName %>&categoryName=<%= categoryName %>&createDateFrom=<%= createDateFrom %>&createDateTo=<%= createDateTo %>">></a></li>
                    <%
                    }
                    %>
                </ul>
                    <%
                    }
                    %>
                </section>
            </main>
        </div>
        <jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
    </div>
    <script src="./dist/js/lib/jquery-3.2.1.min.js"></script>
    <script src="./dist/js/main.js"></script>
</body>
</html>
