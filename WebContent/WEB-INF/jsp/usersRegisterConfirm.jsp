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
                    <h2 class="pageLabel">登録内容の確認</h2>
                    <div class="InputFormsArea">
                        <form class="" action="/MyWebSite/UsersRegisterResult" enctype="multipart/form-data" method="post">
                            <ul class="InputFormsArea__formList">
                                <h3 class="InputFormsArea__title">ユーザー情報</h3>
                                <li class="InputFormsArea__formItem">
                                    <p>ログインID</p>
                                    <input type="text" name="loginId" value="<c:out value="${udb.getLoginId()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>ニックネーム</p>
                                    <input type="text" name="nickname" value="<c:out value="${udb.getNickname()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>氏名</p>
                                    <input type="text" name="name" value="<c:out value="${udb.getName()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>住所</p>
                                    <input type="text" name="address" value="<c:out value="${udb.getAddress()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>パスワード</p>
                                    <input type="password" name="pass" value="<c:out value="${udb.getPass()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>確認用パスワード</p>
                                    <input type="password" name="pass" value="<c:out value="${udb.getPass()}" />" readonly="readonly">
                                </li>
                            </ul>
                            <ul class="InputFormsArea__formList .view_box">
                                <h3 class="InputFormsArea__title">ペットプロフィール</h3>
                                <li class="InputFormsArea__formItem">
                                    <p>名前</p>
                                    <input type="text" name="petName" value="<c:out value="${udb.getPetName()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>種類</p>
                                    <input type="text" name="petType" value="<c:out value="${udb.getPetType()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>性別</p>
                                    <input type="text" name="petSex" value="<c:out value="${udb.getPetSex()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>生年月日</p>
                                    <input type="date" name="petBirthDate" value="<c:out value="${udb.getPetBirthDate()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>紹介文</p>
                                    <textarea name="petDesc" readonly="readonly"><c:out value="${udb.getPetDesc()}" /></textarea>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>アイコン用画像</p>
                                    <input type="hidden" name="petIconFile" value=
                                    <c:choose>
                                    <c:when test="${imageFileName != null}">
                                    "<c:out value="${imageFileName}" />"
                                    </c:when>
                                    <c:otherwise>
                                    ""
                                    </c:otherwise>
                                    </c:choose>
                                    readonly="readonly">
                                    <c:if test="${imageFileName != null}">
                                    <div class="profileImage"><img src="upload/profile/<c:out value="${imageFileName}" />"></div>
                                    </c:if>
                                </li>
                            </ul>
                            <input type="hidden" name="createDate" value="<%= System.currentTimeMillis()%>" />
                        	<input type="hidden" name="updateDate" value="<%= System.currentTimeMillis()%>" />
                            <div class="b-one-center u-mb15px"><button type="submit" class="button primary">登録する</button></div>
                            <div class="b-one-center"><a href="/MyWebSite/UsersRegister" class="button secondary">修正する</a></div>
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
