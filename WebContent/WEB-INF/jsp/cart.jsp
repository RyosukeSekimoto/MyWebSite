<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.CartItemBeans"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.Helper"%>
<%
String cartActionMessage = (String)request.getAttribute("cartActionMessage");
ArrayList<CartItemBeans> cart = (ArrayList<CartItemBeans>)session.getAttribute("cart");
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
	            <form class="" action="/MyWebSite/CartAction" method="post">
	                <section class="Section u-mb90px">
	                    <h2 class="pageLabel japanese">カート</h2>
	                    <p><%= cartActionMessage %></p>
	                    <% if(cart.size() != 0) { %>
	                        <table class="TableList TableList--cart">
	                            <thead>
	                                <tr>
	                                    <th>商品</th>
	                                    <th>単価</th>
	                                    <th>数量</th>
	                                    <th>削除</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                <%
	                                int i = 0;
	                                for(CartItemBeans cib: cart) {
	                                i++;
	                                %>
	                                    <td class="cartProduct">
	                                        <div class="cartProductWrapper">
	                                            <div class="cartProductImage"><img src="upload/item/<%= cib.getIdb().getFirstFileName() %>" alt=""></div>
	                                            <p class="cartProductName"><a href="/MyWebSite/ProductDetail?itemId=<%= cib.getIdb().getId() %>"><%= cib.getIdb().getName() %></a></p>
	                                        </div>
	                                    </td>
	                                    <td class="price"><%= Helper.displayPrice(cib.getIdb().getPrice()) %></td>
	                                    <td class="inputCount"><input class="" type="number" name="quantity" min=1 value="<%= cib.getQuantity() %>"></td>
	                                    <td class="delete">
	                                        <div class="chkbox">
	                                            <input type="checkbox" id="chkbox<%=i%>" name="deleteItemIdList" value="<%= cib.getIdb().getId() %>" />
	                                            <label for="chkbox<%=i%>">　</label>
	                                        </div>
	                                    </td>
	                                </tr>
	                                <% } %>
	                            </tbody>
	                        </table>
	                      <div class="cartDeleteButton"><button type="submit" name="itemDelete">チェックした商品をカートから削除する</button></div>
	                    <% } %>
	                	</section>
	                	<% if(cart.size() != 0) { %>
						<div class="b-one-center u-mb90px"><button type="submit" name="purchase" class="button primary">購入手続きへ</button></div>
              			<% } %>
	                </form>
                <div class="UnderButtons u-mb60px">
                    <div class="UnderButtons__Left"><a href="/MyWebSite/Index">トップに戻る</a></div>
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
