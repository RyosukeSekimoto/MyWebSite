<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="model.BuyDataBeans"%>
<%@ page import="model.BuyDetailDataBeans"%>
<%@ page import="model.Helper"%>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ToeBeans</title>
    <link rel="stylesheet" href="./dist/css/main.css">
    <link rel="stylesheet" href="./dist/css/animate.css">
</head>

<body>
    <div id="wrapper">
        <jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
        <div class="l-content">
            <main class="l-main">
                <section class="Section u-mb90px">
                    <h2 class="pageLabel purchaseResultTitle fadeIn animated u-mb60px">Thank you for shoping!</h2>
                    <div class="b-two-center u-mb100px">
                        <a class="button secondary btnLeft" href="/MyWebSite/Index">トップに戻る</a>
                        <a class="button secondary" href="/MyWebSite/Mypage">マイページへ</a>
                    </div>
                    <h2 class="sectionLabel japanese">購入詳細</h2>
                    <table class="purchaseResultSummary u-mb30px">
                        <thead>
                            <tr>
                                <th>購入日時</th>
                                <th>配送方法</th>
                                <th>合計金額</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><c:out value="${Helper.displayDate(bdb.getCreateDate())}" /></td>
                                <td><c:out value="${bdb.getDeliveryMethodName()}" /></td>
                                <td>¥<c:out value="${Helper.displayPrice(bdb.getTotalPrice())}" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="TableList TableList--purchaseResult">
                        <thead>
                            <tr>
                                <th>商品</th>
                                <th>単価</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="bddb" items="${bddbList}">
                        	<tr>
                        		<td class="productName"><c:out value="${bddb.getItemName()}" /></td>
                                <td class="price">¥<c:out value="${Helper.displayPrice(bddb.getItemPrice())}" /></td>
                            </tr>
                        	</c:forEach>
                        </tbody>
                    </table>
                </section>
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
