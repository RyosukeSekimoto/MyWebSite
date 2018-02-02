<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="model.ItemDataBeans"%>
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
            <jsp:include page="/WEB-INF/jsp/sidebar.jsp"></jsp:include>
            <main class="l-main">
                <div class="Breadcrumb u-mb30px">
                    <span class="Breadcrumb__item" itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
                        <a href="/MyWebSite/Index" itemprop="url">TOP</a>
                    </span>
                    <span class="Breadcrumb__item" itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
                        <a href="/MyWebSite/Category?categoryName=<c:out value="${idb.getCategory()}" />" itemprop="url"><c:out value="${idb.getCategory()}" /></a>
                    </span>
                    <span class="Breadcrumb__item" itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
                        <a href="/MyWebSite/ProductDetail" itemprop="url"><c:out value="${idb.getName()}" /></a>
                    </span>
                </div>
                <section class="Section">
                  <div class="ProductDetail">
                      <div class="ProductDetail__sub">
                          <div class="ProductDetail__imagePanel">
                              <div id="main" class="ProductDetail__mainImage"><img class="Image" src="upload/item/<c:out value="${idb.getFirstFileName()}" />" alt=""></div>
                              <div id="navi" class="ProductDetail__imagethumbs l-row">
                                  <div class="l-w360-quaterColumn">
                                    <a href="upload/item/<c:out value="${idb.getFirstFileName()}" />">
                                      <img class="ProductDetail__imageThumb" src="upload/item/<c:out value="${idb.getFirstFileName()}" />" alt="">
                                    </a>
                                  </div>
                                  <div class="l-w360-quaterColumn">
                                    <a href="upload/item/<c:out value="${idb.getSecondFileName()}" />">
                                      <img class="ProductDetail__imageThumb" src="upload/item/<c:out value="${idb.getSecondFileName()}" />" alt="">
                                    </a>
                                  </div>
                                  <div class="l-w360-quaterColumn">
                                    <a href="upload/item/<c:out value="${idb.getThirdFileName()}" />">
                                      <img class="ProductDetail__imageThumb" src="upload/item/<c:out value="${idb.getThirdFileName()}" />" alt="">
                                    </a>
                                  </div>
                                  <div class="l-w360-quaterColumn">
                                    <a href="upload/item/<c:out value="${idb.getForthFileName()}" />">
                                      <img class="ProductDetail__imageThumb" src="upload/item/<c:out value="${idb.getForthFileName()}" />" alt="">
                                    </a>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="ProductDetail__main">
                          <div class="ProductDetail__head">
                              <p class="ProductDetail__category"><span class="categoryBadge"><c:out value="${idb.getCategory()}" /></span></p>
                              <p class="ProductDetail__name">
                                  <c:out value="${idb.getName()}" />
                              </p>
                              <p class="ProductDetail__price">¥<c:out value="${Helper.displayPrice(idb.getPrice())}" /><span class="ProductDetail__taxIn"> (tax in)</span></p>
                          </div>
                          <div class="ProductDetail__body">
                              <p class="ProductDetail__desc">
                             	 <c:out value="${idb.getDetail()}" />
                              </p>
                              <form class="ProductDetail__cartIn" action="/MyWebSite/Cart" method="post">
                                  <p class="ProductDetail__countSelect">数量<input type="number" name="quantity" min=1 value=1 required></p>
                                  <input type="hidden" name="itemId" value="<c:out value="${idb.getId()}" />">
                                  <input class="button primary" type="submit" value="カートに追加する">
                              </form>
                          </div>
                      </div>
                  </div>
                </section>
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
                <div class="b-one-center u-mb100px"><a class="button secondary" href="/MyWebSite/ReviewCreate?itemId=<c:out value="${idb.getId()}" />">この商品のレビューを書く</a></div>
                <div class="UnderButtons u-mb60px">
                    <div class="UnderButtons__Left"><a href="/MyWebSite/Index">トップに戻る</a></div>
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
