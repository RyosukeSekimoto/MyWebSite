<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<header class="Header Header--admin">
	<div class="Header__wrapper l-column">
    	<div class="Header__head">
			<h1 class="adminLogo"><a href="/MyWebSite/Admin">管理者専用ページ</a></h1>
        </div>
		<nav class="Header__body">
			<ul class="Menu">
				<li><a href="/MyWebSite/Users" class="Menu__item Menu__item--white">ユーザー</a></li>
				<li><a href="/MyWebSite/Items" class="Menu__item Menu__item--white">商品</a></li>
				<li><a href="/MyWebSite/Logout" class="Menu__item Menu__item--white">ログアウト</a></li>
			</ul>
		</nav>
	</div>
</header>