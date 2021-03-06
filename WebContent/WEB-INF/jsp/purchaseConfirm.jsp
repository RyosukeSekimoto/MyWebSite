<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="model.CartItemBeans"%>
<%@ page import="model.BuyDataBeans"%>
<%@ page import="model.Helper"%>
<%@ page import="java.util.ArrayList"%>

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
                <section class="Section u-mb90px">
                    <h2 class="pageLabel japanese">購入確認</h2>
                    <table class="TableList TableList--deliveryMethod">
                        <thead>
                            <tr>
                                <th>商品</th>
                                <th>単価</th>
                                <th>数量</th>
                                <th>小計</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="cib" items="${cart}">
                            <tr>
                                <td class="productName"><c:out value="${cib.getIdb().getName()}" /></td>
                                <td class="price">¥<c:out value="${Helper.displayPrice(cib.getIdb().getPrice())}" /></td>
                                <td class="count"><c:out value="${cib.getQuantity()}" /></td>
                                <td class="price">¥<c:out value="${Helper.displayPrice(cib.getIdb().getPrice() * cib.getQuantity())}" /></td>
                            </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="3" class="deliveryMethod"><c:out value="${bdb.getDeliveryMethodName()}" /></td>
                                <td class="price">¥<c:out value="${bdb.getDeliveryMethodPrice()}" /></td>
                            </tr>
                            <tr>
                                <td colspan="3" class="totalPrice">合計金額</td>
                                <td class="price totalPriceNum">¥<c:out value="${Helper.displayPrice(bdb.getTotalPrice())}" /></td>
                            </tr>
                        </tbody>
                    </table>
                </section>
                <div class="b-two-center u-mb90px">
                <a class="button btnLeft secondary" href="/MyWebSite/DeliveryMethod">配送選択に戻る</a>
                    <a class="button primary" href="/MyWebSite/PurchaseResult">上記の内容で購入する</a>
                </div>
            </main>
        </div>
        <jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
    </div>
    <script src="./dist/js/lib/jquery-3.2.1.min.js"></script>
    <script src="./dist/js/main.js"></script>
</body>
</html>
