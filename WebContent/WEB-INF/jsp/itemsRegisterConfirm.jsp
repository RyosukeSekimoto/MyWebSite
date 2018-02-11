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
                    <h2 class="pageLabel">商品登録の確認</h2>
                    <div class="InputFormsArea">
                        <form class="" action="/MyWebSite/ItemsRegisterResult" enctype="multipart/form-data" method="post">
                            <ul class="InputFormsArea__formList">
                                <li class="InputFormsArea__formItem">
                                    <p>商品名</p>
                                    <input type="text" name="itemName" value="<c:out value="${idb.getName()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>カテゴリ</p>
                                    <input type="text" name="CategoryName" value="<c:out value="${idb.getCategory()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>価格</p>
                                    <input type="text" name="price" value="<c:out value="${idb.getPrice()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>紹介文</p>
                                    <textarea name="detail" readonly="readonly"><c:out value="${idb.getDetail()}" /></textarea>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>メイン画像</p>
                                    <input type="hidden" name="itemFirstFileName" value="<c:out value="${ifdbList.get(0).getFileName()}" />" >
                                    <input type="text" name="" value="<c:out value="${ifdbList.get(0).getFileName()}" />" readonly="readonly">
                                </li>
                                <c:if test="${2 <= ifdbList.size()}">
                                <li class="InputFormsArea__formItem">
                                    <p>サブ画像1</p>
                                    <input type="hidden" name="itemSecondFileName" value="<c:out value="${ifdbList.get(1).getFileName()}" />" >
                                    <input type="text" name="" value="<c:out value="${ifdbList.get(1).getFileName()}" />" readonly="readonly">
                                </li>
                                </c:if>
                                <c:if test="${3 <= ifdbList.size()}">
                                <li class="InputFormsArea__formItem">
                                    <p>サブ画像2</p>
                                    <input type="hidden" name="itemThirdFileName" value="<c:out value="${ifdbList.get(2).getFileName()}" />" >
                                    <input type="text" name="" value="<c:out value="${ifdbList.get(2).getFileName()}" />" readonly="readonly">
                                </li>
                                </c:if>
                                <c:if test="${4 <= ifdbList.size()}">
                                <li class="InputFormsArea__formItem">
                                    <p>サブ画像3</p>
                                    <input type="hidden" name="itemForthFileName" value="<c:out value="${ifdbList.get(3).getFileName()}" />" >
                                    <input type="text" name="" value="<c:out value="${ifdbList.get(3).getFileName()}" />" readonly="readonly">
                                </li>
                                </c:if>
                            </ul>
                            <input type="hidden" name="createDate" value="<%= System.currentTimeMillis()%>" />
                        	<input type="hidden" name="updateDate" value="<%= System.currentTimeMillis()%>" />
                            <div class="b-one-center u-mb15px"><button type="submit" class="button primary">登録する</button></div>
                            <div class="b-one-center"><a href="/MyWebSite/ItemsRegister" class="button secondary">修正する</a></div>
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
