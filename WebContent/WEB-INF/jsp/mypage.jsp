<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                            <img src="./dist/images/top/mypage-profileImage.jpg" alt="" class="Profile__image">
                        </div>
                        <div class="Profile__main">
                            <div class="Profile__head">
                                <h2 class="Profile__name">ねこねこねこさん</h2>
                                <div class="Profile__detail">
                                    <p>スコティッシュ・フォールド（性別：<span class="Profile__sex">♂</span>）
                                        <br>生年月日：<span class="Profile__birthDate">0000/00/00</span>
                                        <br>オーナー：<span class="Profile__ownerName">オーナーの名前
                                    </p>
                                </div>
                            </div>
                            <div class="Profile__body">
                                <p class="Profile__desc">植物由来の原料を主原料とした安心・安全なスペシャル低刺激な全犬種用のドッグシャンプーです。アレルギーなどの肌のトラブルに悩む愛犬の皮膚に負担かけることなくお使いいただけます。また、香りに敏感な犬達です。香料も着色料も一切使用しておりません。</p>
                            </div>
                        </div>
                    </div>
                    <div class="OwnerDetail">
                        <h3 class="OwnerDetail__title">Owner detail</h3>
                        <div class="l-row">
                            <div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">ログインID</p>
                                <p class="OwnerDetail__param">ここにログインIDが入ります。</p>
                            </div>
                            <div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">住所</p>
                                <p class="OwnerDetail__param">ここにログインIDが入ります。ここにログインIDが入ります。ここにログインIDが入ります。ここにログインIDが入ります。</p>
                            </div>
                        </div>
                        <div class="l-row">
                            <div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">ニックネーム</p>
                                <p class="OwnerDetail__param">ここにログインIDが入ります。</p>
                            </div>
                            <div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">登録日時</p>
                                <p class="OwnerDetail__param">ここにログインIDが入ります。</p>
                            </div>
                        </div>
                        <div class="l-row u-mb30px">
                            <div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">名前</p>
                                <p class="OwnerDetail__param">ここにログインIDが入ります。</p>
                            </div>
                            <div class="l-main-halfColumn">
                                <p class="OwnerDetail__label">更新日時</p>
                                <p class="OwnerDetail__param">ここにログインIDが入ります。</p>
                            </div>
                        </div>
                        <div class="b-one-center"><a class="button secondary" href="profileEdit.html">プロフィールを編集する</a></div>
                    </div>
                </section>
                <section class="Section u-mb100px">
                    <h2 class="sectionLabel japanese">購入履歴</h2>
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
                                <tr>
                                    <td>0000/00/00</td>
                                    <td>通常配送</td>
                                    <td class="price">¥00000</td>
                                    <td><a href="purchaseDetail.html">詳細</a></td>
                                </tr>
                                <tr>
                                    <td>0000/00/00</td>
                                    <td>通常配送</td>
                                    <td class="price">¥00000</td>
                                    <td><a href="purchaseDetail.html">詳細</a></td>
                                </tr>
                                <tr>
                                    <td>0000/00/00</td>
                                    <td>通常配送</td>
                                    <td class="price">¥00000</td>
                                    <td><a href="purchaseDetail.html">詳細</a></td>
                                </tr>
                                <tr>
                                    <td>0000/00/00</td>
                                    <td>通常配送</td>
                                    <td class="price">¥00000</td>
                                    <td><a href="purchaseDetail.html">詳細</a></td>
                                </tr>
                                <tr>
                                    <td>0000/00/00</td>
                                    <td>通常配送</td>
                                    <td class="price">¥00000</td>
                                    <td><a href="purchaseDetail.html">詳細</a></td>
                                </tr>
                                <tr>
                                    <td>0000/00/00</td>
                                    <td>通常配送</td>
                                    <td class="price">¥00000</td>
                                    <td><a href="purchaseDetail.html">詳細</a></td>
                                </tr>
                                <tr>
                                    <td>0000/00/00</td>
                                    <td>通常配送</td>
                                    <td class="price">¥00000</td>
                                    <td><a href="purchaseDetail.html">詳細</a></td>
                                </tr>
                                <tr>
                                    <td>0000/00/00</td>
                                    <td>通常配送</td>
                                    <td class="price">¥00000</td>
                                    <td><a href="purchaseDetail.html">詳細</a></td>
                                </tr>
                                <tr>
                                    <td>0000/00/00</td>
                                    <td>通常配送</td>
                                    <td class="price">¥00000</td>
                                    <td><a href="purchaseDetail.html">詳細</a></td>
                                </tr>
                                <tr>
                                    <td>0000/00/00</td>
                                    <td>通常配送</td>
                                    <td class="price">¥00000</td>
                                    <td><a href="purchaseDetail.html">詳細</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
                <section class="Section Section--borderBottom">
                    <h2 class="sectionLabel">Review</h2>
                    <ul id="entry_list_more" class="">
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
