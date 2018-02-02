<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="model.UserDataBeans"%>
<%@ page import="model.BuyDataBeans"%>
<%@ page import="model.ReviewDataBeans"%>
<%@ page import="model.Helper"%>
<%@ page import="java.util.ArrayList"%>

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
                <section class="Section u-mb100px">
                    <h2 class="pageLabel">My Page</h2>
                    <div class="Profile">
                        <div class="Profile__sub">
                            <img src="upload/profile/<c:out value="${udb.getFileName()}" />" alt="" class="Profile__image">
                        </div>
                        <div class="Profile__main">
                            <div class="Profile__head">
                                <h2 class="Profile__name"><c:out value="${udb.getPetName()}" /></h2>
                                <div class="Profile__detail">
                                    <p><c:out value="${udb.getPetType()}" />（性別：<span class="Profile__sex"><c:out value="${udb.getPetSex()}" /></span>）
                                        <br>生年月日：<span class="Profile__birthDate"><c:out value="${Helper.displayDate(udb.getPetBirthDate())}" /></span>
                                        <br>オーナー：<span class="Profile__ownerName"><c:out value="${udb.getNickname()}" />
                                    </p>
                                </div>
                            </div>
                            <div class="Profile__body">
                            <c:if test="${udb.getPetDesc() != null}">
                                <p class="Profile__desc"><c:out value="${udb.getPetDesc()}" /></p>
                            </c:if>
                            </div>
                        </div>
                    </div>
                    <c:if test="${loginUser != null && loginUser.getId() == udb.getId()}">
                    <div class="OwnerDetail">
                        <h3 class="OwnerDetail__title">Owner detail</h3>
                        <div class="l-row">
                            <div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">ログインID</p>
                                <p class="OwnerDetail__param"><c:out value="${udb.getLoginId()}" /></p>
                            </div>
                            <div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">ニックネーム</p>
                                <p class="OwnerDetail__param"><c:out value="${udb.getNickname()}" /></p>
                            </div>
                        </div>
                        <div class="l-row">
                       		<div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">名前</p>
                                <p class="OwnerDetail__param"><c:out value="${udb.getName()}" /></p>
                            </div>
                            <div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">住所</p>
                                <p class="OwnerDetail__param"><c:out value="${udb.getAddress()}" /></p>
                            </div>
                        </div>
                        <div class="l-row u-mb30px">
                            <div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">登録日時</p>
                                <p class="OwnerDetail__param"><c:out value="${Helper.displayDateTime(udb.getCreateDate())}" /></p>
                            </div>
                            <div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">更新日時</p>
                                <p class="OwnerDetail__param"><c:out value="${Helper.displayDateTime(udb.getUpdateDate())}" /></p>
                            </div>
                        </div>
                        <div class="b-one-center"><a class="button secondary" href="/MyWebSite/ProfileEdit">プロフィールを編集する</a></div>
                    </div>
                    </c:if>
                </section>
                <c:if test="${loginUser != null && loginUser.getId() == udb.getId()}">
                <section class="Section u-mb100px">
                    <h2 class="sectionLabel japanese">購入履歴</h2>
                    <c:choose>
                    <c:when test="${bdbList.size() == 0}"><p class="message">購入履歴はまだありません。</p>
                    <div><img src="./dist/images/top/none1.png" style="width: 100%; height: auto;"></div>
                    </c:when>
                    <c:when test="${bdbList.size() != 0}">
                    <div class="overflowY">
                        <table class="TableList TableList--purchaseHistory u-mb30px">
                            <thead>
                                <tr>
                                    <th>購入日時</th>
                                    <th>配送方法</th>
                                    <th>購入金額</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="bdb" items="${bdbList}">
                                <tr>
                                    <td><c:out value="${Helper.displayDate(bdb.getCreateDate())}" /></td>
                                    <td><c:out value="${bdb.getDeliveryMethodName()}" /></td>
                                    <td class="price"><c:out value="${Helper.displayPrice(bdb.getTotalPrice())}" /></td>
                                    <td><a href="/MyWebSite/PurchaseDetail?buyId=<c:out value="${bdb.getId()}" />">詳細</a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    </c:when>
                    </c:choose>
                </section>
                </c:if>
       			<section class="Section">
                    <h2 class="sectionLabel">Review</h2>
                    <c:if test="${reviewList.size() == 0}">
                    <p class="message">レビューはまだありません。</p>
                    </c:if>
                    <ul id="entry_list_more" class="">
                   		<c:forEach var="rdb" items="${reviewList}">
							<li class="Review">
                            <div class="Review__sub">
                                <img class="Review__writerImg" src="upload/profile/<c:out value="${rdb.getReviewerFileName()}" />" alt="">
                                <p><c:out value="${rdb.getReviewerName()}" /></p>
                            </div>
                            <div class="Review__main">
                                <div class="Review__head">
                                    <p class="Review__title">
                                        <a href="/MyWebSite/ReviewDetail?reviewId=<c:out value="${rdb.getId()}" />"><c:out value="${rdb.getTitle()}" /></a>
                                    </p>
                                    <p class="Review__productName"><c:out value="${rdb.getItemName()}" />のレビュー</p>
                                    <p class="Review__date">投稿日: <c:out value="${Helper.displayDate(rdb.getCreateDate())}" /></p>
                                </div>
                                <div class="Review__body l-row-left"></div>
                            </div>
                        </li>
						</c:forEach>
						<div><img src="./dist/images/top/none1.png" style="width: 100%; height: auto;"></div>
                        <div id="more_btn" class="b-one-center button-noFlame">レビューをもっと見る</div>
                    </ul>
                </section>
                <div class="b-one-center u-mb100px">
                    <a class="button primary" href="/MyWebSite/Logout">ログアウトする</a>
                </div>
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
