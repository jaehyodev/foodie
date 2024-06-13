<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Personal Food</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="index"><img src="resources/img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
            	<!-- 찜 -->
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <!-- 장바구니 -->
                <li><a href="cart"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <!-- 장바구니 총 금액 -->
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="humberger__menu__contact">
            <ul>
            	<!-- 이메일 -->
                <li><i class="fa fa-envelope"></i> hello@smhrd.com</li>
                <li>5만원 이상 구매 시 무료배송</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
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
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>카테고리</span>
                        </div>
                        <ul>
                            <li><a href="#">채소</a></li>
                            <li><a href="#">과일</a></li>
                            <li><a href="#">정육</a></li>
                            <li><a href="shopgrid">수산</a></li>
                            <li><a href="#">쌀ㆍ잡곡</a></li>
                            <li><a href="#">면ㆍ오일</a></li>
                            <li><a href="#">우유ㆍ유제품</a></li>
                            <li><a href="#">소스ㆍ조미료</a></li>
                            <li><a href="recipe">레시피</a></li>
                            
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <input type="text" placeholder="">
                                <button type="submit" class="site-btn">검색</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
   								<button onclick="openChatbot()" id="chatbot-btn"><i class="fa fa-comments"></i></button>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>재료 추천받기</h5>
                                <span>24시간 챗봇 상담</span>
                            </div>
                        </div>
                    </div>
                    <div class="hero__item set-bg" data-setbg="resources/img/hero/banner.jpg">
                        <div class="hero__text">
                            <span>신선한 재료</span>
                            <h2>Vegetable <br />100% 유기농</h2>
                            <p>스푼 식자재로 건강하게 만든 요리</p>
                            <a href="#" class="primary-btn">지금 구매하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-1.jpg">
                            <h5><a href="#">오렌지</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-2.jpg">
                            <h5><a href="#">건조 과일</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-3.jpg">
                            <h5><a href="#">야채</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-4.jpg">
                            <h5><a href="#">과일 음료</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-5.jpg">
                            <h5><a href="#">소고기</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->
    <br></br>
    
    
    <section class="categories">
        <div class="container">
            <div class="row">
               <div class="col-lg-12">
                    <div class="section-title">
                        <h2>오늘만 특가✨</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li>매일 달라지는 초특가 상품을 만나보세요. 오늘만 이 가격입니다.</li>
                            
                        </ul>
                    </div>
                </div>
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-1.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">소고기</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-2.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">바나나</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-3.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">미니수박</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-4.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">수박</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-1.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">소고기</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </section>

    <!-- Banner Begin -->

    <!-- Banner End -->

<section class="categories">
        <div class="container">
            <div class="row">
               <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Best 상품👍</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li>스푼 최근 인기상품입니다.</li>
                            
                        </ul>
                    </div>
                </div>
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-1.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">소고기</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-2.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">바나나</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-3.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">미니수박</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-4.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">수박</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-1.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">소고기</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </section>
    <section class="categories">
        <div class="container">
            <div class="row">
               <div class="col-lg-12">
                    <div class="section-title">
                        <h2>🐮🐷싱싱 냉장육 썸머 페스티벌</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li>건강하게 길러 더 맛있는 냉장육 할인 ~!</li>
                            
                        </ul>
                    </div>
                </div>
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-1.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">소고기</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-2.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">바나나</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-3.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">미니수박</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-4.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">수박</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-1.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">소고기</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </section>
    <section class="categories">
        <div class="container">
            <div class="row">
               <div class="col-lg-12">
                    <div class="section-title">
                        <h2>🐟스푼 수산시장</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li>할인중인 수산물을 모아보았어요!</li>
                            
                        </ul>
                    </div>
                </div>
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-1.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">소고기</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-2.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">바나나</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-3.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">미니수박</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-4.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">수박</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-1.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">소고기</a></h6>
                            <h5>1,000원</h5>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </section>
    
	<!-- Latest Product Section End -->


    <!-- Blog Section Begin -->
    <section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>스푼만의 특별한 레시피🥗</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="resources/img/blog/sidebar/food1.png" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> July 7,2024</li>
                                
                            </ul>
                            <h5><a href="#">양배추스테이크</a></h5>
                        <p>스테이크는 고기로만 만들 수 있다는 편견을 깨트린 양배추스테이크</p>

                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="resources/img/blog/sidebar/food2.png" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> July 7,2024</li>
                             
                            </ul>
                            <h5><a href="#">훈제오리고기포케</a></h5>
                        <p>아직 포케가 익숙하지 않은 분이라면 오리고기로 토핑을 한 훈제오리고기포케에 도전해보세요 !</p>

                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="resources/img/blog/sidebar/food3.png" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> July 7,2024</li>
                                
                            </ul>
                            <h5><a href="#">훈제연어포케</a></h5>
                            <p>해산물이 들어간 가장 대표적인 포케</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="index"><img src="resources/img/logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 60-49 Road 11378 New York</li>
                            <li>Phone: +65 11.188.888</li>
                            <li>Email: hello@colorlib.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>TEAM</h6>
                        <ul>
                            <li><a href="#">Kim Jae Hyo</a></li>
                            <li><a href="shopgrid">Gwak Hyo Jeong</a></li>
                            <li><a href="mypage">Park Jun Sik</a></li>
                            <li><a href="cart">Lee Seung Ji</a></li>
                            <li><a href="index">Hong Ji Yeon</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">DB / ChatBot</a></li>
                            <li><a href="shopgrid">Shop / Recipe Page</a></li>
                            <li><a href="mypage">My Page</a></li>
                            <li><a href="cart">Cart / Pay Page</a></li>
                            <li><a href="index">Main Page</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>Join Our Newsletter Now</h6>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                        <div class="footer__copyright__payment"><img src="resources/img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="resources/js/jquery-3.3.1.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.nice-select.min.js"></script>
    <script src="resources/js/jquery-ui.min.js"></script>
    <script src="resources/js/jquery.slicknav.js"></script>
    <script src="resources/js/mixitup.min.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/main.js"></script>
    <script>
        function openChatbot() {
            window.open("/smartfood/chatbot", "SmartTalk", "width=400,height=600");
        }
    </script>



</body>

</html>