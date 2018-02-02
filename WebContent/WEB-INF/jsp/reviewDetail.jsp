<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="model.UserDataBeans"%>
<%@ page import="model.ReviewDataBeans"%>
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
        <jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
        <div class="l-content">
            <main class="l-main">
                <section class="Section">
                    <h2 class="pageLabel">Review Detail</h2>
                    <div class="Review Review--detail">
                        <div class="Review__sub">
                            <a href="/MyWebSite/Mypage?userId=<c:out value="${rdb.getUserId()}" />"><img class="Review__writerImg" src="upload/profile/<c:out value="${rdb.getReviewerFileName()}" />" alt=""></a>
                            <p><a href="/MyWebSite/Mypage?userId=<c:out value="${rdb.getUserId()}" />"><c:out value="${rdb.getReviewerName()}" /></a></p>
                        </div>
                        <div class="Review__main">
                            <div class="Review__head">
                                <p class="Review__title">
									<c:out value="${rdb.getTitle()}" />
                                </p>
                                <p class="Review__productName"><c:out value="${rdb.getItemName()}" />のレビュー</p>
                                <p class="Review__date">投稿日: <c:out value="${Helper.displayDate(rdb.getCreateDate())}" /></p>
                            </div>
                        </div>
                    </div>
                    <div class="review-desc">
                        <p><c:out value="${rdb.getReviewDesc()}" /></p>
                    </div>
                </section>
                <c:if test="${rdb.getPhotoFileName() != null}">
                <section class="Section">
                    <h2 class="sectionLabel">Use image</h2>
                    <ul class="photoList">
                        <li class="photoItem">
                            <div class="photoImage"><img src="upload/review/<c:out value="${rdb.getPhotoFileName()}" />" alt=""></div>
                            <c:if test="${rdb.getPhotoDesc() != null}">
                            <p class="photoDesc"><c:out value="${rdb.getPhotoDesc()}" /></p>
                            </c:if>
                        </li>
                    </ul>
                </section>
                </c:if>
                <div class="b-one-center u-mb100px">
                    <a class="button secondary" href="/MyWebSite/ProductDetail?itemId=<c:out value="${rdb.getItemId()}" />">この商品の詳細へ</a>
                </div>
                <c:if test="${loginUser != null && loginUser.getId() == rdb.getUserId()}">
                <div class="b-two-center u-mb100px">
                    <a class="button secondary btnLeft" href="/MyWebSite/ReviewEdit?reviewId=<c:out value="${rdb.getId()}" />">このレビューを編集する</a>
                    <a class="button primary" href="/MyWebSite/ReviewDelete?reviewId=<c:out value="${rdb.getId()}" />">このレビューを削除する</a>
                </div>
                </c:if>
                <div class="UnderButtons UnderButtons--rightOnly u-mb60px">
                    <div id="page-top" class="UnderButtons__Right">
                        <a href="#">
                          <img src="./dist/images/top/toebeans.png" alt="" width="20" height="20">
                          ページ上部に戻る
                        </a>
                    </div>
                </div>
            </main>
        </div>
        <jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
    </div>
    <script src="./dist/js/lib/jquery-3.2.1.min.js"></script>
    <script src="./dist/js/main.js"></script>
</body>
</html>
