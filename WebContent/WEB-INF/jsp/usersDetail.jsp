<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="model.UserDataBeans"%>
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
        <jsp:include page="/WEB-INF/jsp/adminHeader.jsp"></jsp:include>
        <div class="l-content">
            <main class="l-main">
                <section class="Section">
                    <h2 class="pageLabel">ユーザー詳細</h2>
                    <div class="InputFormsArea">
                        <form class="" action="" enctype="multipart/form-data" method="post">
                            <ul class="InputFormsArea__formList">
                                <h3 class="InputFormsArea__title">ユーザー情報</h3>
                                <li class="InputFormsArea__formItem">
                                    <p>ログインID</p>
                                    <input type="text" name="" value="<c:out value="${udb.getLoginId()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>ニックネーム</p>
                                    <input type="text" name="" value="<c:out value="${udb.getNickname()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>氏名</p>
                                    <input type="text" name="" value="<c:out value="${udb.getName()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>住所</p>
                                    <input type="text" name="" value="<c:out value="${udb.getAddress()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>登録日時</p>
                                    <input type="text" name="" value="<c:out value="${Helper.displayDateTime(udb.getCreateDate())}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>更新日時</p>
                                    <input type="text" name="" value="<c:out value="${Helper.displayDateTime(udb.getUpdateDate())}" />" readonly="readonly">
                                </li>
                            </ul>
                            <ul class="InputFormsArea__formList .view_box">
                                <h3 class="InputFormsArea__title">ペットプロフィール</h3>
                                <li class="InputFormsArea__formItem">
                                    <p>名前</p>
                                    <input type="text" name="" value="<c:out value="${udb.getPetName()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>種類</p>
                                    <input type="text" name="" value="<c:out value="${udb.getPetType()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>性別</p>
                                    <input type="text" name="" value="<c:out value="${udb.getPetSex()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>生年月日</p>
                                    <input type="date" name="" value="<c:out value="${udb.getPetBirthDate()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>紹介文</p>
                                    <textarea type="text" name="" readonly="readonly"><c:out value="${udb.getPetDesc()}" /></textarea>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>アイコン用画像</p>
                                    <div id="result" class="profileImage"><img src="upload/profile/<c:out value="${udb.getFileName()}" />"></div>
                                </li>
                            </ul>
                        </form>
                    </div>
                </section>
                <div class="b-one-center u-mb100px">
                    <a class="button secondary btnLeft" href="/MyWebSite/Users">ユーザー一覧に戻る</a>
                </div>
            </main>
        </div>
        <jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
    </div>
    <script src="./dist/js/lib/jquery-3.2.1.min.js"></script>
    <script src="./dist/js/main.js"></script>
</body>
</html>
