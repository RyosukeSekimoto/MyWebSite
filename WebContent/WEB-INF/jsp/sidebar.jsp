<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<aside class="l-sub">
	<div class="Search">
		<p class="Search__title">ITEM SEARCH</p>
		<form class="Search__searchBox" action="/MyWebSite/SearchResult" method="GET">
			<input class="Search__searchInput" type="text" name="searchWord" value="" placeholder="商品名から探す"><input class="Search__searchSubmit" type="submit" name="" value="">
		</form>
	</div>
	<div class="Categorys">
		<p class="Categorys__title">CATEGORY<span class="Categorys__titleArrow"><img src="dist/images/top/arrow02.png" alt=""></span></p>
		<ul class="Categorys__list">
			<li class="Categorys__listItem">
				<a href="/MyWebSite/Category?categoryName=フード・おやつ">
					<p class="Categorys__text">フード・おやつ</p>
                    <img class="Categorys__arrow" src="dist/images/top/arrow.png" alt="" width="8" height="auto">
                </a>
            </li>
            <li class="Categorys__listItem">
				<a href="/MyWebSite/Category?categoryName=キャットタワー">
					<p class="Categorys__text">キャットタワー</p>
                    <img class="Categorys__arrow" src="dist/images/top/arrow.png" alt="" width="8" height="auto">
                </a>
            </li>
            <li class="Categorys__listItem">
				<a href="/MyWebSite/Category?categoryName=おもちゃ">
					<p class="Categorys__text">おもちゃ</p>
                    <img class="Categorys__arrow" src="dist/images/top/arrow.png" alt="" width="8" height="auto">
                </a>
            </li>
            <li class="Categorys__listItem">
				<a href="/MyWebSite/Category?categoryName=首輪">
					<p class="Categorys__text">首輪</p>
                    <img class="Categorys__arrow" src="dist/images/top/arrow.png" alt="" width="8" height="auto">
                </a>
            </li>
            <li class="Categorys__listItem">
				<a href="/MyWebSite/Category?categoryName=爪とぎ">
					<p class="Categorys__text">爪とぎ</p>
                    <img class="Categorys__arrow" src="dist/images/top/arrow.png" alt="" width="8" height="auto">
                </a>
            </li>
            <li class="Categorys__listItem">
				<a href="/MyWebSite/Category?categoryName=トイレ・猫砂">
					<p class="Categorys__text">トイレ・猫砂</p>
                    <img class="Categorys__arrow" src="dist/images/top/arrow.png" alt="" width="8" height="auto">
                </a>
            </li>
            <li class="Categorys__listItem">
				<a href="/MyWebSite/Category?categoryName=猫雑貨">
					<p class="Categorys__text">猫雑貨</p>
                    <img class="Categorys__arrow" src="dist/images/top/arrow.png" alt="" width="8" height="auto">
                </a>
            </li>
		</ul>
	</div>
</aside>