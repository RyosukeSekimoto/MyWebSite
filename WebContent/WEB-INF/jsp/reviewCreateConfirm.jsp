<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="model.ReviewDataBeans"%>
<%@ page import="model.ItemDataBeans"%>

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
                    <h2 class="pageLabel">レビューの確認</h2>
                    <div class="InputFormsArea">
                        <form class="" action="/MyWebSite/ReviewCreateResult" method="post">
                            <ul class="InputFormsArea__formList">
                                <h3 class="InputFormsArea__title reviewProductName"><span><c:out value="${idb.getName()}" /></span>
                                    <br>についてのレビュー
                                </h3>
                                <li class="InputFormsArea__formItem">
                                    <p>タイトル</p>
                                    <input type="text" name="title" value="<c:out value="${rdb.getTitle()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>本文</p>
                                    <textarea name="reviewDesc" readonly="readonly"><c:out value="${rdb.getReviewDesc()}" /></textarea>
                                </li>
                                <li class="InputFormsArea__formItem">
                                	<p>写真</p>
                                    <input type="hidden" name="photoFileName" value=
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
                                    <div class="reviewImage"><img src="upload/review/<c:out value="${imageFileName}" />"></div>
                                    </c:if>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>写真へのコメント</p>
                                    <c:if test="${rdb.getPhotoDesc() != null}">
                                    <textarea name="photoDesc" readonly="readonly"><c:out value="${rdb.getPhotoDesc()}" /></textarea>
                                    </c:if>
                                </li>
                            </ul>
                            <input type="hidden" name="userId" value="<c:out value="${rdb.getUserId()}" />">
                            <input type="hidden" name="itemId" value="<c:out value="${rdb.getItemId()}" />">
                            <input type="hidden" name="createDate" value="<%= System.currentTimeMillis()%>" />
                        	<input type="hidden" name="updateDate" value="<%= System.currentTimeMillis()%>" />
                            <div class="b-one-center u-mb15px"><button type="submit" class="button primary">上記の内容で投稿する</button></div>
                            <div class="b-one-center u-mb15px"><a href="/MyWebSite/ReviewCreate" class="button secondary">修正する</a></div>
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
