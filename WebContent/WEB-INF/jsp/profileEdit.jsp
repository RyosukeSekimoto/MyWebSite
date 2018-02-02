<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="model.UserDataBeans"%>

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
                    <h2 class="pageLabel">プロフィールの編集</h2>
					<p class="validation"><c:out value="${errorMsg}" /></p>
                    <div class="InputFormsArea">
                        <form class="" action="/MyWebSite/ProfileEditConfirm" enctype="multipart/form-data" method="post">
                            <ul class="InputFormsArea__formList">
                                <h3 class="InputFormsArea__title">ユーザー情報</h3>
                                <li class="InputFormsArea__formItem">
                                    <p>ログインID</p>
                                    <input type="text" name="loginId" value="<c:out value="${udb.getLoginId()}" />" readonly>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>ニックネーム</p>
                                    <input type="text" name="nickname" value="<c:out value="${udb.getNickname()}" />">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>氏名</p>
                                    <input type="text" name="name" value="<c:out value="${udb.getName()}" />">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>住所</p>
                                    <input type="text" name="address" value="<c:out value="${udb.getAddress()}" />">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>パスワード</p>
                                    <input type="password" name="pass" value="" placeholder="変更する場合は記入してください">
                                    <input type="hidden" name="existedPass" value="<c:out value="${udb.getPass()}" />">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>パスワード（確認）</p>
                                    <input type="password" name="confirmPass" value="" placeholder="変更する場合は記入してください">
                                </li>
                            </ul>
                            <ul class="InputFormsArea__formList .view_box">
                                <h3 class="InputFormsArea__title">ペットプロフィール</h3>
                                <li class="InputFormsArea__formItem">
                                    <p>名前</p>
                                    <input type="text" name="petName" value="<c:out value="${udb.getPetName()}" />">
                                </li>
                                <li class="InputFormsArea__formItem">
                                <p>種類</p>
                                <select name="petType" required>
                                    <option value="" <c:if test="${udb.getPetType().isEmpty()}">selected</c:if>>選択してください</option>
                                    <option value="日本猫" <c:if test="${udb.getPetType().equals('日本猫')}">selected</c:if>>日本猫</option>
                                    <option value="スコティッシュフォールド"<c:if test="${udb.getPetType().equals('スコティッシュフォールド')}">selected</c:if>>スコティッシュフォールド</option>
                                    <option value="アメリカンショートヘア" <c:if test="${udb.getPetType().equals('アメリカンショートヘア')}">selected</c:if>>アメリカンショートヘア</option>
                                    <option value="ラグドール" <c:if test="${udb.getPetType().equals('ラグドール')}">selected</c:if>>ラグドール</option>
                                    <option value="ブリティッシュショートヘア" <c:if test="${udb.getPetType().equals('ブリティッシュショートヘア')}">selected</c:if>>ブリティッシュショートヘア</option>
                                    <option value="ロシアンブルー" <c:if test="${udb.getPetType().equals('ロシアンブルー')}">selected</c:if>>ロシアンブルー</option>
                                    <option value="マンチカン" <c:if test="${udb.getPetType().equals('マンチカン')}">selected</c:if>>マンチカン</option>
                                    <option value="ベンガル" <c:if test="${udb.getPetType().equals('ベンガル')}">selected</c:if>>ベンガル</option>
                                    <option value="シャム" <c:if test="${udb.getPetType().equals('シャム')}">selected</c:if>>シャム</option>
                                    <option value="シンガプーラ" <c:if test="${udb.getPetType().equals('シンガプーラ')}">selected</c:if>>シンガプーラ</option>
                                    <option value="オシキャット"<c:if test="${udb.getPetType().equals('オシキャット')}">selected</c:if>>オシキャット</option>
                                    <option value="エキゾチックショートヘア" <c:if test="${udb.getPetType().equals('エキゾチックショートヘア')}">selected</c:if>>エキゾチックショートヘア</option>
                                    <option value="メインクーン" <c:if test="${udb.getPetType().equals('メインクーン')}">selected</c:if>>メインクーン</option>
                                    <option value="ノルウェージャンフォレストキャット" <c:if test="${udb.getPetType().equals('ノルウェージャンフォレストキャット')}">selected</c:if>>ノルウェージャンフォレストキャット</option>
                                    <option value="スフィンクス" <c:if test="${udb.getPetType().equals('スフィンクス')}">selected</c:if>>スフィンクス</option>
                                    <option value="アビシニアン" <c:if test="${udb.getPetType().equals('アビシニアン')}">selected</c:if>>アビシニアン</option>
                                    <option value="ペルシャ" <c:if test="${udb.getPetType().equals('ペルシャ')}">selected</c:if>>ペルシャ</option>
                                    <option value="ソマリ" <c:if test="${udb.getPetType().equals('ソマリ')}">selected</c:if>>ソマリ</option>
                                    <option value="サイベリアン" <c:if test="${udb.getPetType().equals('サイベリアン')}">selected</c:if>>サイベリアン</option>
                                    <option value="シャルトリュー" <c:if test="${udb.getPetType().equals('シャルトリュー')}">selected</c:if>>シャルトリュー</option>
                                    <option value="オリエンタル" <c:if test="${udb.getPetType().equals('オリエンタル')}">selected</c:if>>オリエンタル</option>
                                    <option value="その他" <c:if test="${udb.getPetType().equals('その他')}">selected</c:if>>その他</option>
                                </select>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>性別</p>
                                    <select name="petSex">
                                    	<option value="">選択してください</option>
                                        <option value="♂" <c:if test="${udb.getPetSex().equals('♂')}">selected</c:if>>♂</option>
                                        <option value="♀" <c:if test="${udb.getPetSex().equals('♀')}">selected</c:if>>♀</option>
                                    </select>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>生年月日</p>
                                    <input type="date" name="petBirthDate" value="<c:out value="${udb.getPetBirthDate()}" />">
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>紹介文</p>
                                    <c:choose>
                                    <c:when test="${udb.getPetDesc() != null}"><textarea name="petDesc"><c:out value="${udb.getPetDesc()}" /></textarea></c:when>
                                    <c:when test="${udb.getPetDesc() == null}"><textarea></textarea></c:when>
                                    </c:choose>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>アイコン用画像</p>
                                    <input type="file" id="file" name="petIconFile"/>
                                    <div id="result" class="profileImage"></div>
                                    <c:if test="${udb.getFileName() != null}">
                                    <div class="profileImage"><img src="upload/profile/<c:out value="${udb.getFileName()}" />"></div>
                                    <input type="hidden" name="existedIconFileName" value="<c:out value="${udb.getFileName()}" />">
                                    </c:if>
                                </li>
                            </ul>
                            <div class="b-one-center"><button type="submit" class="button secondary">編集確認へ</button></div>
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
