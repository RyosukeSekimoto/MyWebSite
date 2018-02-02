<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.UserDataBeans" %>

<header class="Header">
	<div class="Header__wrapper l-column">
    	<div class="Header__head">
            <h1 class="logo"><a href="/MyWebSite/Index">Toe Beans</a></h1>
        </div>
		<nav class="Header__body">
            <ul class="Menu">
	            <c:choose>
					<c:when test="${loginUser != null}"><li><a href="/MyWebSite/Mypage" class="Menu__item">MYPAGE</a></li></c:when>
					<c:otherwise><li><a href="/MyWebSite/Login" class="Menu__item">LOGIN</a></li></c:otherwise>
				</c:choose>
                <li><a href="/MyWebSite/Cart" class="Menu__item">CART</a></li>
            </ul>
        </nav>
    </div>
</header>