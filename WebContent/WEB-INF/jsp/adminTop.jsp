<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                    <h2 class="pageLabel japanese">ここは管理者専用のページです。</h2>
                    <div class="b-two-center u-mb100px" style="margin-top: 50px;">
                        <a class="button secondary btnLeft" href="/MyWebSite/Users">ユーザー管理画面へ</a>
                        <a class="button secondary" href="/MyWebSite/Items">商品管理画面へ</a>
                    </div>
                    <div class="b-one-center u-mb100px">
                        <a class="button-noFlame" href="/MyWebSite/Index">本サイトTOPへ</a>
                    </div>
                </section>
            </main>
        </div>
        <jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
    </div>
    <script src="../dist/js/lib/jquery-3.2.1.min.js"></script>
    <script src="../dist/js/main.js"></script>
</body>
</html>
