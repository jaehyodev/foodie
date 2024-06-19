<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Foodie</title>
</head>
<body>
<header class="header">
   <div class="header__top">
       <div class="container">
           <div class="row">
               <div class="col-lg-6">
                   <div class="header__top__left">
                       <ul>
                           <li>하루 안에 도착하는 푸디 배송 ~ 🚚</li>
                       </ul>
                   </div>
               </div>
               <div class="col-lg-6">
                   <div class="header__top__right">
                       <div class="header__top__right__auth">
                           <form action="logout" method="post">
	                           <c:choose>
	                              <c:when test="${empty Member}">
	                                 <a href="login"><i class="fa fa-user"></i>로그인 / </a><a href="join">회원가입</a>
	                              </c:when>
	                              <c:otherwise>
	                                 <h6>${Member.mem_id}님환영합니다.</h6>
	                                 <button type="submit">로그아웃</button>
	                              </c:otherwise>
	                           </c:choose>
                        	</form>
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="index"><img src="<c:url value='/resources/img/logo.png'/>" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                        <li><a href="cart"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
</body>
</html>