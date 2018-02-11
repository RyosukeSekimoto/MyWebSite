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
                    <h2 class="pageLabel">新規商品登録</h2>
                    <c:forEach var="msg" items="${errorMsgList}">
					<p class="validation"><c:out value="${msg}" /></p>
					</c:forEach>
                    <div class="InputFormsArea">
                        <form class="" action="/MyWebSite/ItemsRegisterConfirm" enctype="multipart/form-data" method="post">
                            <ul class="InputFormsArea__formList">
                                <li class="InputFormsArea__formItem">
                                    <p>商品名</p>
                                    <input type="text" name="itemName" value="<c:out value="${idb.getName()}" />">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>カテゴリ</p>
                                    <select name="categoryName">
                                        <option value="" <c:if test="${idb.getCategory().isEmpty()}">selected</c:if>>選択してください</option>
                                        <option value="フード・おやつ" <c:if test="${idb.getCategory().equals('フード・おやつ')}">selected</c:if>>フード・おやつ</option>
                                        <option value="キャットタワー" <c:if test="${idb.getCategory().equals('キャットタワー')}">selected</c:if>>キャットタワー</option>
                                        <option value="おもちゃ" <c:if test="${idb.getCategory().equals('おもちゃ')}">selected</c:if>>おもちゃ</option>
                                        <option value="爪とぎ" <c:if test="${idb.getCategory().equals('爪とぎ')}">selected</c:if>>爪とぎ</option>
                                        <option value="首輪" <c:if test="${idb.getCategory().equals('首輪')}">selected</c:if>>首輪</option>
                                        <option value="トイレ・猫砂" <c:if test="${idb.getCategory().equals('トイレ・猫砂')}">selected</c:if>>トイレ・猫砂</option>
                                        <option value="猫雑貨" <c:if test="${idb.getCategory().equals('猫雑貨')}">selected</c:if>>猫雑貨</option>
                                    </select>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>価格</p>
                                    <input type="number" name="price" min="0" value="<c:out value="${idb.getPrice()}" />" >
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>紹介文</p>
                                    <textarea name="detail"><c:out value="${idb.getDetail()}" /></textarea>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>メイン画像</p>
                                    <input type="file" id="file" name="itemFirstFile"/>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>サブ画像1</p>
                                    <input type="file" id="file" name="itemSecondFile"/>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>サブ画像2</p>
                                    <input type="file" id="file" name="itemThirdFile"/>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>サブ画像3</p>
                                    <input type="file" id="file" name="itemForthFile"/>
                                </li>
                            </ul>
                            <div class="b-one-center"><button type="submit" class="button secondary">登録確認へ</button></div>
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
