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
    <title>Personal Recipe</title>
</head>
<body>
<header class="header">
	<div class="header__top">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-6">
	                <div class="header__top__left">
	                    <ul>
	                        <li><i class="fa fa-envelope"></i> hello@smhrd.com</li>
	                        <li>5만원 이상 구매 시 무료배송</li>
	                    </ul>
	                </div>
	            </div>
	            <div class="col-lg-6">
	                <div class="header__top__right">
	                    <div class="header__top__right__auth">
	                        <a href="login"><i class="fa fa-user"></i> 로그인 / 회원가입</a>
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
                    <a href="index"><img src="resources/img/logo.png" alt=""></a>
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