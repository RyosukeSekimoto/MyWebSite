<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.UserDataBeans"%>
<!DOCTYPE html>
<%
UserDataBeans udb = (UserDataBeans)request.getAttribute("udb");
String errorMsg = (String)request.getAttribute("errorMsg");
%>
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
            <main class="l-main">
                <section class="Section">
                    <h2 class="pageLabel">新規会員登録</h2>
                    <%if(errorMsg != null) { %>
					<p class="validation"><%= errorMsg %></p>
					<% } %>
                    <div class="InputFormsArea">
                        <form class="" action="/MyWebSite/RegisterConfirm" enctype="multipart/form-data" method="post">
                            <ul class="InputFormsArea__formList">
                                <h3 class="InputFormsArea__title">ユーザー情報</h3>
                                <li class="InputFormsArea__formItem">
                                    <p>ログインID ※必須</p>
                                    <input type="text" name="loginId" value="<%= udb.getLoginId() %>" required>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>ニックネーム ※必須</p>
                                    <input type="text" name="nickname" value="<%= udb.getNickname() %>" required>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>氏名 ※必須</p>
                                    <input type="text" name="name" value="<%= udb.getName() %>" required>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>住所 ※必須</p>
                                    <input type="text" name="address" value="<%= udb.getAddress() %>" required>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>パスワード ※必須</p>
                                    <input type="password" name="pass" value="<%= udb.getPass() %>" required>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>パスワード（確認） ※必須</p>
                                    <input type="password" name="confirmPass" value="<%= udb.getPass() %>" required>
                                </li>
                            </ul>
                            <ul class="InputFormsArea__formList .view_box">
                                <h3 class="InputFormsArea__title">ペットプロフィール</h3>
                                <li class="InputFormsArea__formItem">
                                    <p>名前 ※必須</p>
                                    <input type="text" name="petName" value="<%= udb.getPetName() %>" required>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>種類 ※必須</p>
                                    <select name="petType" required>
                                    	<option value="" <% if(udb.getPetType().isEmpty()) { %>selected<% } %>>選択してください</option>
                                        <option value="日本猫（雑種）" <% if(udb.getPetType().equals("日本猫（雑種）")) { %>selected<% } %>>日本猫（雑種）</option>
                                        <option value="スコティッシュフォールド" <% if(udb.getPetType().equals("スコティッシュフォールド")) { %>selected<% } %>>スコティッシュフォールド</option>
                                        <option value="アメリカンショートヘア" <% if(udb.getPetType().equals("アメリカンショートヘア")) { %>selected<% } %>>アメリカンショートヘア</option>
                                        <option value="ラグドール" <% if(udb.getPetType().equals("ラグドール")) { %>selected<% } %>>ラグドール</option>
                                        <option value="ブリティッシュショートヘア" <% if(udb.getPetType().equals("ブリティッシュショートヘア")) { %>selected<% } %>>ブリティッシュショートヘア</option>
                                        <option value="ロシアンブルー" <% if(udb.getPetType().equals("ロシアンブルー")) { %>selected<% } %>>ロシアンブルー</option>
                                        <option value="マンチカン" <% if(udb.getPetType().equals("マンチカン")) { %>selected<% } %>>マンチカン</option>
                                        <option value="ベンガル" <% if(udb.getPetType().equals("ベンガル")) { %>selected<% } %>>ベンガル</option>
                                        <option value="シャム" <% if(udb.getPetType().equals("シャム")) { %>selected<% } %>>シャム</option>
                                        <option value="シンガプーラ" <% if(udb.getPetType().equals("シンガプーラ")) { %>selected<% } %>>シンガプーラ</option>
                                        <option value="オシキャット" <% if(udb.getPetType().equals("オシキャット")) { %>selected<% } %>>オシキャット</option>
                                        <option value="エキゾチックショートヘア" <% if(udb.getPetType().equals("エキゾチックショートヘア")) { %>selected<% } %>>エキゾチックショートヘア</option>
                                        <option value="メインクーン" <% if(udb.getPetType().equals("メインクーン")) { %>selected<% } %>>メインクーン</option>
                                        <option value="ノルウェージャンフォレストキャット" <% if(udb.getPetType().equals("ノルウェージャンフォレストキャット")) { %>selected<% } %>>ノルウェージャンフォレストキャット</option>
                                        <option value="スフィンクス" <% if(udb.getPetType().equals("スフィンクス")) { %>selected<% } %>>スフィンクス</option>
                                        <option value="アビシニアン" <% if(udb.getPetType().equals("アビシニアン")) { %>selected<% } %>>アビシニアン</option>
                                        <option value="ペルシャ" <% if(udb.getPetType().equals("ペルシャ")) { %>selected<% } %>>ペルシャ</option>
                                        <option value="ソマリ" <% if(udb.getPetType().equals("ソマリ")) { %>selected<% } %>>ソマリ</option>
                                        <option value="サイベリアン" <% if(udb.getPetType().equals("サイベリアン")) { %>selected<% } %>>サイベリアン</option>
                                        <option value="シャルトリュー" <% if(udb.getPetType().equals("シャルトリュー")) { %>selected<% } %>>シャルトリュー</option>
                                        <option value="オリエンタル" <% if(udb.getPetType().equals("オリエンタル")) { %>selected<% } %>>オリエンタル</option>
                                        <option value="その他" <% if(udb.getPetType().equals("その他")) { %>selected<% } %>>その他</option>
                                    </select>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>性別 ※必須</p>
                                    <select name="petSex" required>
                                    	<option value="" <% if(udb.getPetSex().isEmpty()) { %>selected<% } %>>選択してください</option>
                                        <option value="♂" <% if(udb.getPetSex().equals("♂")) { %>selected<% } %>>♂</option>
                                        <option value="♀" <% if(udb.getPetSex().equals("♀")) { %>selected<% } %>>♀</option>
                                    </select>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>生年月日 ※必須</p>
                                    <input type="date" name="petBirthDate" value="<%= udb.getPetBirthDate() %>" required>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>紹介文</p>
                                    <textarea name="petDesc"><%= udb.getPetDesc() %></textarea>
                                </li>
                                <li class="InputFormsArea__formItem">
                                    <p>アイコン用画像</p>
                                    <input type="file" id="file" name="petIconFile"/>
                                    <div id="result" class="profileImage"></div>
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
