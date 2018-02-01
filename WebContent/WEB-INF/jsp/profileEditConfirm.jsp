<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.UserDataBeans"%>
<%
UserDataBeans udb = (UserDataBeans)session.getAttribute("udb");
String imageFileName = (String)session.getAttribute("imageFileName");
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
                    <h2 class="pageLabel">プロフィール編集の確認</h2>
                    <div class="InputFormsArea">
                        <form class="" action="/MyWebSite/ProfileEditResult" enctype="multipart/form-data" method="post">
                            <ul class="InputFormsArea__formList">
                                <h3 class="InputFormsArea__title">ユーザー情報</h3>
                                <li class="InputFormsArea__formItem">
                                    <p>ログインID</p>
                                    <input type="text" name="loginId" value="<%= udb.getLoginId() %>" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>ニックネーム</p>
                                    <input type="text" name="nickname" value="<%= udb.getNickname() %>" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>氏名</p>
                                    <input type="text" name="name" value="<%= udb.getName() %>" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>住所</p>
                                    <input type="text" name="address" value="<%= udb.getAddress() %>" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>パスワード</p>
                                    <input type="password" name="pass" value="<%= udb.getPass() %>" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>パスワード（確認）</p>
                                    <input type="password" name="confirmPass" value="<%= udb.getPass() %>" readonly="readonly">
                                </li>
                            </ul>
                            <ul class="InputFormsArea__formList .view_box">
                                <h3 class="InputFormsArea__title">ペットプロフィール</h3>
                                <li class="InputFormsArea__formItem">
                                    <p>名前</p>
                                    <input type="text" name="petName" value="<%= udb.getPetName() %>" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>種類</p>
                                    <input type="text" name="petType" value="<%= udb.getPetType() %>" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>性別</p>
                                    <input type="text" name="petSex" value="<%= udb.getPetSex() %>" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>生年月日</p>
                                    <input type="date" name="petBirthDate" value="<%= udb.getPetBirthDate() %>" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>紹介文</p>
                                    <textarea name="petDesc" readonly="readonly"><%= udb.getPetDesc() %></textarea>
                                </li>
                                <li class="InputFormsArea__formItem">
                                	<p>アイコン用画像</p>
                                    <%if(imageFileName != null) { %>
                                    <div class="profileImage"><img src="upload/<%= imageFileName %>"></div>
                                    <input type="hidden" name="petIconFile" value="<%= imageFileName %>">
                                    <% } else if(udb.getFileName() != null) { %>
                                    <div class="profileImage"><img src="upload/<%= udb.getFileName() %>"></div>
                                    <input type="hidden" name="petIconFile" value="<%= udb.getFileName() %>">
                                    <% } else { %>
                                    <input type="hidden" name="petIconFile" value="">
                                    <% } %>
                                </li>
                            </ul>
                            <input type="hidden" name="updateDate" value="<%= System.currentTimeMillis()%>" />
                            <div class="b-one-center u-mb15px"><button type="submit" class="button primary">編集する</button></div>
                            <div class="b-one-center"><a href="/MyWebSite/ProfileEdit" class="button secondary">修正する</a></div>
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
