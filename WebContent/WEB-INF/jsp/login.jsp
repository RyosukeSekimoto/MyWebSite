<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//リクエストスコープからエラーメッセージを取得
String errorMsg = (String)request.getAttribute("errorMsg");
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
            <main class="l-main">
                <section class="Section">
                    <h2 class="pageLabel japanese">ログイン</h2>
                    <%if(errorMsg != null) { %>
					<p class="validation"><%= errorMsg %></p>
					<% } %>
                    <div class="InputFormsArea">
                        <form class="" action="/MyWebSite/Login" method="post">
                            <ul class="InputFormsArea__formList">
                                <li class="InputFormsArea__formItem">
                                    <p>ログインID</p>
                                    <input type="text" name="loginId" value="">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>パスワード</p>
                                    <input type="password" name="pass" value="">
                                </li>
                            </ul>
                            <div class="b-one-center u-mb15px"><button type="submit" class="button secondary">ログインする</button></div>
                        </form>
                        <div class="InputFormsArea__linkText"><a href="/MyWebSite/Register">新規会員登録はこちら</a></div>
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
