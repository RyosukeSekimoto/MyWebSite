<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.UserDataBeans"%>
<%
UserDataBeans udb = (UserDataBeans)session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ToeBeans</title>
    <link rel="stylesheet" href="dist/css/main.css">
</head>

<body>
    <div id="wrapper">
        <jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
        <div class="l-content">
            <jsp:include page="/WEB-INF/jsp/sidebar.jsp"></jsp:include>
            <main class="l-main">
                <div class="ImageSlide">
                    <ul id="Slide" class="ImageSlide__main">
                        <li class="ImageSlide__item js-slide-item">
                            <a href="/MyWebSite/Category?categoryName=フード・おやつ"><img class="ImageSlide__image" src="./dist/images/top/slideImage-food-snack.jpg" alt="about our tea" width="720" height="350"></a>
                        </li>
                        <li class="ImageSlide__item js-slide-item">
                            <a href="/MyWebSite/Category?categoryName=キャットタワー"><img class="ImageSlide__image" src="./dist/images/top/slideImage-cat-tower.jpg" alt="about our coffee" width="720" height="350"></a>
                        </li>
                        <li class="ImageSlide__item js-slide-item">
                            <a href="/MyWebSite/Category?categoryName=おもちゃ"><img class="ImageSlide__image" src="./dist/images/top/slideImage-toy.jpg" alt="about our foods" width="720" height="350"></a>
                        </li>
                    </ul>
                    <div class="ImageSlide__sub">
                        <span class="ImageSlide__dot js-slide-point">image1</span>
                        <span class="ImageSlide__dot js-slide-point">image2</span>
                        <span class="ImageSlide__dot js-slide-point">image3</span>
                    </div>
                </div>
                <section class="Section">
                    <h2 class="sectionLabel">By Popularity</h2>
                    <div class="Section__item l-row">
                        <a href="productDetail.html" class="ProductPanel l-main-tripartitionColumn">
                            <div class="ProductPanel__sub">
                                <div class="ProductPanel--badge first">1</div>
                                <img class="ProductPanel__thumb" src="./dist/images/top/sample-product.jpg" alt="">
                            </div>
                            <div class="ProductPanel__main">
                                <p class="ProductPanel__head"><span class="categoryBadge">フード・おやつ</span></p>
                                <div class="ProductPanel__body">
                                  マルチパーパスサークル　コーディネートセットマルチパーパスサークル　コーディネートセット<br>
                                  <span>¥42,660(tax in)</span>
                                </div>
                            </div>
                        </a>
                        <a href="productDetail.html" class="ProductPanel l-main-tripartitionColumn">
                            <div class="ProductPanel__sub">
                                <div class="ProductPanel--badge second">2</div>
                                <img class="ProductPanel__thumb" src="./dist/images/top/sample-product.jpg" alt="">
                            </div>
                            <div class="ProductPanel__main">
                                <p class="ProductPanel__head"><span class="categoryBadge">フード・おやつ</span></p>
                                <div class="ProductPanel__body">
                                  マルチパーパスサークル　コーディネートセットマルチパーパスサークル　コーディネートセット<br>
                                  <span>¥42,660(tax in)</span>
                                </div>
                            </div>
                        </a>
                        <a href="productDetail.html" class="ProductPanel l-main-tripartitionColumn">
                            <div class="ProductPanel__sub">
                                <div class="ProductPanel--badge third">3</div>
                                <img class="ProductPanel__thumb" src="./dist/images/top/sample-product.jpg" alt="">
                            </div>
                            <div class="ProductPanel__main">
                                <p class="ProductPanel__head"><span class="categoryBadge">フード・おやつ</span></p>
                                <div class="ProductPanel__body">
                                  マルチパーパスサークル　コーディネートセットマルチパーパスサークル　コーディネートセット<br>
                                  <span>¥42,660(tax in)</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="Section__item l-row">
                        <a href="productDetail.html" class="ProductPanel l-main-tripartitionColumn">
                            <div class="ProductPanel__sub">
                                <div class="ProductPanel--badge">4</div>
                                <img class="ProductPanel__thumb" src="./dist/images/top/sample-product.jpg" alt="">
                            </div>
                            <div class="ProductPanel__main">
                                <p class="ProductPanel__head"><span class="categoryBadge">フード・おやつ</span></p>
                                <div class="ProductPanel__body">
                                  マルチパーパスサークル　コーディネートセットマルチパーパスサークル　コーディネートセット<br>
                                  <span>¥42,660(tax in)</span>
                                </div>
                            </div>
                        </a>
                        <a href="productDetail.html" class="ProductPanel l-main-tripartitionColumn">
                            <div class="ProductPanel__sub">
                                <div class="ProductPanel--badge">5</div>
                                <img class="ProductPanel__thumb" src="./dist/images/top/sample-product.jpg" alt="">
                            </div>
                            <div class="ProductPanel__main">
                                <p class="ProductPanel__head"><span class="categoryBadge">フード・おやつ</span></p>
                                <div class="ProductPanel__body">
                                  マルチパーパスサークル　コーディネートセットマルチパーパスサークル　コーディネートセット<br>
                                  <span>¥42,660(tax in)</span>
                                </div>
                            </div>
                        </a>
                        <a href="productDetail.html" class="ProductPanel l-main-tripartitionColumn">
                            <div class="ProductPanel__sub">
                                <div class="ProductPanel--badge">6</div>
                                <img class="ProductPanel__thumb" src="./dist/images/top/sample-product.jpg" alt="">
                            </div>
                            <div class="ProductPanel__main">
                                <p class="ProductPanel__head"><span class="categoryBadge">フード・おやつ</span></p>
                                <div class="ProductPanel__body">
                                  マルチパーパスサークル　コーディネートセットマルチパーパスサークル　コーディネートセット<br>
                                  <span>¥42,660(tax in)</span>
                                </div>
                            </div>
                        </a>
                    </div>
                </section>
                <section class="Section">
                    <h2 class="sectionLabel">Latest　Review</h2>
                    <ul class="">
                        <li class="Review">
                            <div class="Review__sub">
                                <img class="Review__writerImg" src="./dist/images/top/profile.jpg" alt="">
                                <p>ねこねこねこさん</p>
                            </div>
                            <div class="Review__main">
                                <div class="Review__head">
                                    <p class="Review__title">
                                        <a href="reviewDetail.html">ここにタイトルが入ります。ここにタイトルが入ります。ここにタイトルが入ります。</a>
                                    </p>
                                    <p class="Review__productName">マルチパーパスサークルコーディネートセットのレビュー</p>
                                    <p class="Review__date">Posted: <time>2018/01/01</time></p>
                                </div>
                                <div class="Review__body l-row-left"></div>
                            </div>
                        </li>
                        <li class="Review">
                            <div class="Review__sub">
                                <img class="Review__writerImg" src="./dist/images/top/profile.jpg" alt="">
                                <p>ねこねこねこさん</p>
                            </div>
                            <div class="Review__main">
                                <div class="Review__head">
                                    <p class="Review__title">
                                        <a href="reviewDetail.html">ここにタイトルが入ります。ここにタイトルが入ります。ここにタイトルが入ります。</a>
                                    </p>
                                    <p class="Review__productName">マルチパーパスサークルコーディネートセットのレビュー</p>
                                    <p class="Review__date">Posted: <time>2018/01/01</time></p>
                                </div>
                                <div class="Review__body l-row-left"></div>
                            </div>
                        </li>
                        <li class="Review">
                            <div class="Review__sub">
                                <img class="Review__writerImg" src="./dist/images/top/profile.jpg" alt="">
                                <p>ねこねこねこさん</p>
                            </div>
                            <div class="Review__main">
                                <div class="Review__head">
                                    <p class="Review__title">
                                        <a href="reviewDetail.html">ここにタイトルが入ります。ここにタイトルが入ります。ここにタイトルが入ります。</a>
                                    </p>
                                    <p class="Review__productName">マルチパーパスサークルコーディネートセットのレビュー</p>
                                    <p class="Review__date">Posted: <time>2018/01/01</time></p>
                                </div>
                                <div class="Review__body l-row-left"></div>
                            </div>
                        </li>
                    </ul>
                </section>
                <div class="UnderButtons UnderButtons--rightOnly u-mb u-mb60px">
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
    <script src="./dist/js/lib/lodash.min.js"></script>
    <script src="./dist/js/lib/flipsnap.js"></script>
    <script src="./dist/js/main.js"></script>
    <script>
        imageSlide('Slide', 2);
    </script>
</body>
</html>
