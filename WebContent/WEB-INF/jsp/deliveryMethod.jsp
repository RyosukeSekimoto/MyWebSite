<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="model.CartItemBeans"%>
<%@ page import="model.DeliveryMethodDataBeans"%>
<%@ page import="model.Helper"%>

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
            	<form class="" action="/MyWebSite/PurchaseConfirm" method="post">
                <section class="Section u-mb60px">
                    <h2 class="pageLabel japanese">配送方法の選択</h2>
                    <table class="TableList TableList--deliveryMethod">
                        <thead>
                            <tr>
                                <th>商品</th>
                                <th>単価</th>
                                <th>数量</th>
                                <th>合計</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="cib" items="${cart}">
                            <tr>
                                <td class="productName"><c:out value="${cib.getIdb().getName()}" /></td>
                                <td class="price"><c:out value="${Helper.displayPrice(cib.getIdb().getPrice())}" /></td>
                                <td class="count"><c:out value="${cib.getQuantity()}" /></td>
                                <td class="price"><c:out value="${cib.getIdb().getPrice() * cib.getQuantity()}" /></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="deliverySelect">
                          <label>
                              <select name="selectDeliveryMethodId">
                              <c:forEach var="dmdb" items="${dmdbList}">
                                  <option value="<c:out value="${dmdb.getId()}" />"><c:out value="${dmdb.getName()}" /></option>
                              </c:forEach>
                              </select>
                          </label>
                    </div>
                </section>
                <div class="b-one-center u-mb90px"><button class="button primary" type="submit">購入確認へ</button></div>
                </form>
            </main>
        </div>
        <jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
    </div>
    <script src="./dist/js/lib/jquery-3.2.1.min.js"></script>
    <script src="./dist/js/main.js"></script>
</body>
</html>
