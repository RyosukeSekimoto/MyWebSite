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
                    <h2 class="pageLabel">商品更新の確認</h2>
                    <div class="InputFormsArea">
                        <form class="" action="/MyWebSite/ItemsEditResult" enctype="multipart/form-data" method="post">
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
                                    <c:choose>
                                    <c:when test="${firstIfdb.getFileName() != null}">
                                    <input type="hidden" name="itemFirstFileName" value="<c:out value="${firstIfdb.getFileName()}" />" >
                                    <input type="text" name="" value="<c:out value="${firstIfdb.getFileName()}" />" readonly="readonly">
                                    </c:when>
                                    <c:otherwise>
                                    <input type="hidden" name="itemFirstFileName" value="<c:out value="${idb.getFirstFileName()}" />" readonly="readonly">
                                    <input type="text" name="" value="<c:out value="${idb.getFirstFileName()}" />" readonly="readonly">
                                    </c:otherwise>
                                    </c:choose>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>サブ画像1</p>
                                    <c:choose>
                               		<c:when test="${secondIfdb.getFileName() != null}">
                                    <input type="hidden" name="itemSecondFileName" value="<c:out value="${secondIfdb.getFileName()}" />" >
                                    <input type="text" name="" value="<c:out value="${secondIfdb.getFileName()}" />" readonly="readonly">
                                    </c:when>
                               		<c:when test="${idb.getSecondFileName() != null}">
                                    <input type="hidden" name="itemSecondFileName" value="<c:out value="${idb.getSecondFileName()}" />" >
                                    <input type="text" name="" value="<c:out value="${idb.getSecondFileName()}" />" readonly="readonly">
                                    </c:when>
                                	</c:choose>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>サブ画像2</p>
                                    <c:choose>
                               		<c:when test="${thirdIfdb.getFileName() != null}">
                                    <input type="hidden" name="itemThirdFileName" value="<c:out value="${thirdIfdb.getFileName()}" />" >
                                    <input type="text" name="" value="<c:out value="${thirdIfdb.getFileName()}" />" readonly="readonly">
                                    </c:when>
                              		<c:when test="${idb.getThirdFileName() != null}">
                              		<input type="hidden" name="itemThirdFileName" value="<c:out value="${idb.getThirdFileName()}" />" >
                                    <input type="text" name="" value="<c:out value="${idb.getThirdFileName()}" />" readonly="readonly">
                                    </c:when>
                               		</c:choose>
                                </li>
                                <li class="InputFormsArea__formItem">
                               		<p>サブ画像3</p>
                              		<c:choose>
                              		<c:when test="${forthIfdb.getFileName() != null}">
                                    <input type="hidden" name="itemForthFileName" value="<c:out value="${forthIfdb.getFileName()}" />" >
                                    <input type="text" name="" value="<c:out value="${forthIfdb.getFileName()}" />" readonly="readonly">
                                    </c:when>
                                	<c:when test="${idb.getForthFileName() != null}">
                                	<input type="hidden" name="itemForthFileName" value="<c:out value="${idb.getForthFileName()}" />" >
                                    <input type="text" name="" value="<c:out value="${idb.getForthFileName()}" />" readonly="readonly">
                                    </c:when>
                              	    </c:choose>
                                </li>
                            </ul>
                        	<input type="hidden" name="updateDate" value="<%= System.currentTimeMillis()%>" />
                            <input type="hidden" name="itemId" value="<c:out value="${idb.getId()}" />">
                            <div class="b-one-center u-mb15px"><button type="submit" class="button primary">更新する</button></div>
                            <div class="b-one-center"><a href="/MyWebSite/ItemsEdit" class="button secondary">修正する</a></div>
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
