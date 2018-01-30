<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.ReviewDataBeans"%>
<%
ReviewDataBeans rdb = (ReviewDataBeans)request.getAttribute("deleteRdb");
String itemName = (String)request.getAttribute("itemName");
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
                    <h2 class="pageLabel japanese u-mb60px">タイトル：<%= rdb.getTitle() %><br>このレビューを削除しますか？</h2>
                    <div class="b-two-center u-mb100px">
                        <a class="button secondary btnLeft" href="/MyWebSite/ReviewDetail?reviewId=<%= rdb.getId() %>&itemName=<%= itemName %>">レビュー詳細に戻る</a>
                        <form action="/MyWebSite/ReviewDelete" method="post">
                        	<input class="button primary" type="submit" value="削除する">
                        	<input type="hidden" name="reviewId" value="<%= rdb.getId() %>">
                        </form>
                    </div>
                </section>
            </main>
        </div>
        <jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
    </div>
    <script src="./dist/js/lib/jquery-3.2.1.min.js"></script>
    <script src="./dist/js/main.js"></script>
</body>
</html>
