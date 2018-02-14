<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="model.UserDataBeans"%>
<%@ page import="model.Helper"%>
<%@ page import="java.util.ArrayList"%>

<%
ArrayList<UserDataBeans> udbList = (ArrayList<UserDataBeans>)request.getAttribute("udbList");
int pageMax = (int) request.getAttribute("pageMax");
int pageIntNum = (int) request.getAttribute("pageIntNum");
int searchUserCount = (int) request.getAttribute("searchUserCount");
String loginId = (String)request.getAttribute("loginId");
String name = (String)request.getAttribute("name");
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
                      <h2>ユーザー一覧</h2>
                      <a class="button primary" href="/MyWebSite/UsersRegister">ユーザー新規登録</a>
                  </div>
                    <form class="MgSearchArea u-mb30px" action="/MyWebSite/Users" method="get">
                        <div class="MgSearchArea__wrapper">
                            <div class="MgSearchArea__item">
                                <p class="MgSearchArea__formLabel">ログインID</p>
                                <input type="text" name="loginId" value="<c:out value="${loginId}" />" class="searchAreaInput">
                            </div>
                            <div class="MgSearchArea__item">
                                <p class="MgSearchArea__formLabel">氏名</p>
                                <input type="text" name="name" value="<c:out value="${name}" />" class="searchAreaInput">
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
                    if(udbList.size() == 0) {
                    %>
                    <p class="message">該当するユーザーは存在しておりません。</p>
                    <%
                    } else {
                    %>
                    <table class="TableList TableList--userManagement u-mb60px">
                        <thead>
                            <tr>
                                <th>ログインID</th>
                                <th>氏名</th>
                                <th>登録日時</th>
                                <th class=""></th>
                                <th class=""></th>
                                <th class=""></th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="udb" items="${udbList}">
                            <tr>
                                <td class=""><c:out value="${udb.getLoginId()}" /></td>
                                <td class=""><c:out value="${udb.getName()}" /></td>
                                <td class=""><c:out value="${Helper.displayDate(udb.getCreateDate())}" /></td>
                                <td><a class="" href="/MyWebSite/UsersDetail?userId=<c:out value="${udb.getId()}" />">詳細</a></td>
                                <td><a class="" href="/MyWebSite/UsersEdit?userId=<c:out value="${udb.getId()}" />">更新</a></td>
                                <td><a class="" href="/MyWebSite/UsersDelete?userId=<c:out value="${udb.getId()}" />">削除</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <ul class="Paging u-mb100px">
                	<%
                	if(pageIntNum != 1) {
                	%>
                    <li class="Paging__item"><a href="/MyWebSite/Users?pageNum=<%= pageIntNum - 1 %>&loginId=<%= loginId %>&name=<%= name %>&createDateFrom=<%= createDateFrom %>&createDateTo=<%= createDateTo %>"><</a></li>
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
                    <li class="Paging__item number"><a href="/MyWebSite/Users?pageNum=<%= j %>&loginId=<%= loginId %>&name=<%= name %>&createDateFrom=<%= createDateFrom %>&createDateTo=<%= createDateTo %>" <% if(pageIntNum == j) { %> class="active" <% } %>><%= j %></a></li>
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
                    <li class="Paging__item"><a href="/MyWebSite/Users?pageNum=<%= pageIntNum + 1 %>&loginId=<%= loginId %>&name=<%= name %>&createDateFrom=<%= createDateFrom %>&createDateTo=<%= createDateTo %>">></a></li>
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
