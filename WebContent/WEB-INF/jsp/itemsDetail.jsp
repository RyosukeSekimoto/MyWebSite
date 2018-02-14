<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="model.ItemDataBeans"%>
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
                    <h2 class="pageLabel">商品詳細</h2>
                    <div class="InputFormsArea">
                        <form class="" action="" enctype="multipart/form-data" method="post">
                            <ul class="InputFormsArea__formList">
                                <li class="InputFormsArea__formItem">
                                    <p>商品名</p>
                                    <input type="text" name="" value="<c:out value="${idb.getName()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>カテゴリ</p>
                                    <input type="text" name="" value="<c:out value="${idb.getCategory()}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>価格</p>
                                    <input type="text" name="" value="<c:out value="${Helper.displayPrice(idb.getPrice())}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>紹介文</p>
                                    <textarea type="text" name="" readonly="readonly"><c:out value="${idb.getDetail()}" /></textarea>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>登録日時</p>
                                    <input type="text" name="" value="<c:out value="${Helper.displayDateTime(idb.getCreateDate())}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>更新日時</p>
                                    <input type="text" name="" value="<c:out value="${Helper.displayDateTime(idb.getUpdateDate())}" />" readonly="readonly">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>画像</p>
                                    <ul class="InputFormsArea__productPhotos">
                                      <li>メイン画像<img src="upload/item/<c:out value="${idb.getFirstFileName()}" />" alt=""></li>
                                      <c:if test="${idb.getSecondFileName() != null}"><li>サブ画像1<img src="upload/item/<c:out value="${idb.getSecondFileName()}" />" alt=""></li></c:if>
                                      <c:if test="${idb.getThirdFileName() != null}"><li>サブ画像2<img src="upload/item/<c:out value="${idb.getThirdFileName()}" />" alt=""></li></c:if>
                                      <c:if test="${idb.getForthFileName() != null}"><li>サブ画像3<img src="upload/item/<c:out value="${idb.getForthFileName()}" />" alt=""></li></c:if>
                                    </ul>
                                </li>
                            </ul>
                        </form>
                    </div>
                </section>
                <div class="b-one-center u-mb100px">
                    <a class="button secondary btnLeft" href="/MyWebSite/Items">商品一覧に戻る</a>
                </div>
            </main>
        </div>
        <jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
    </div>
    <script src="./dist/js/lib/jquery-3.2.1.min.js"></script>
    <script src="./dist/js/main.js"></script>
</body>
</html>
