<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Foodie</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/resources/css/elegant-icons.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/resources/css/nice-select.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/resources/css/owl.carousel.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/resources/css/slicknav.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>" type="text/css">
</head>

<body>

    <!-- Header Section Begin -->
    <%@ include file="./header.jsp"%>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>카테고리</span>
                        </div>
                        <ul>
                        	<li><a href="<c:url value='/shopgrid/채소/1'/>">채소</a></li>
                        	<li><a href="<c:url value='/shopgrid/과일/1'/>">과일</a></li>
                        	<li><a href="<c:url value='/shopgrid/수산/1'/>">수산</a></li>
                        	<li><a href="<c:url value='/shopgrid/정육ㆍ계란류/1'/>">정육ㆍ계란류</a></li>
                        	<li><a href="<c:url value='/shopgrid/쌀ㆍ잡곡/1'/>">쌀ㆍ잡곡</a></li>
                        	<li><a href="<c:url value='/shopgrid/면ㆍ오일/1'/>">면ㆍ오일</a></li>
                        	<li><a href="<c:url value='/shopgrid/우유ㆍ유제품/1'/>">우유ㆍ유제품</a></li>
                        	<li><a href="<c:url value='/shopgrid/소스ㆍ조미료/1'/>">소스ㆍ조미료</a></li>
                        	<li><a href="<c:url value='/shopgrid/음료/1'/>">음료</a></li>
                        	<li><a href="<c:url value='/shopgrid/기타/1'/>">기타</a></li>
                        	<li><a href="<c:url value='/recipe/주부'/>">레시피 보러가기</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <input type="text" placeholder="검색어를 입력하세요">
                                <button type="submit" class="site-btn">검색</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-comments"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>재료 추천받기</h5>
                                <span>24시간 챗봇 상담</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>재료</h4>
                            <ul>
                                <li><a href="<c:url value='/shopgrid/채소/1'/>">채소</a></li>
	                        	<li><a href="<c:url value='/shopgrid/과일/1'/>">과일</a></li>
	                        	<li><a href="<c:url value='/shopgrid/수산/1'/>">수산</a></li>
	                        	<li><a href="<c:url value='/shopgrid/정육ㆍ계란류/1'/>">정육ㆍ계란류</a></li>
	                        	<li><a href="<c:url value='/shopgrid/쌀ㆍ잡곡/1'/>">쌀ㆍ잡곡</a></li>
	                        	<li><a href="<c:url value='/shopgrid/면ㆍ오일/1'/>">면ㆍ오일</a></li>
	                        	<li><a href="<c:url value='/shopgrid/우유ㆍ유제품/1'/>">우유ㆍ유제품</a></li>
	                        	<li><a href="<c:url value='/shopgrid/소스ㆍ조미료/1'/>">소스ㆍ조미료</a></li>
	                        	<li><a href="<c:url value='/shopgrid/음료/1'/>">음료</a></li>
	                        	<li><a href="<c:url value='/shopgrid/기타/1'/>">기타</a></li>
                            </ul>
                        </div>
                        <div class="sidebar__item"></div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>${ingrelist.get(0).ingre_cat }</h2>
                        </div>
                    </div>
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>${total }</span> 개의 상품</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    	<c:forEach items="${ingrelist }" var="list">
                    		<div class="col-lg-4 col-md-6 col-sm-6">
	                            <div class="product__item">
	                                <div class="product__item__pic set-bg" data-setbg="<c:url value='../../resources/img${list.ingre_img}'/>">
	                                    <ul class="product__item__pic__hover">
	                                        <li><a href="<c:url value='javascript:ingreWishlist(${list.ingre_idx})'/>"><i class="fa fa-heart"></i></a></li>
	                                        <li><a href="<c:url value='javascript:ingreCart(${list.ingre_idx})'/>"><i class="fa fa-shopping-cart"></i></a></li>
	                                    </ul>
	                                </div>
	                                <div class="product__item__text">
	                                    <h6><a href="<c:url value='/shopdetail/${list.ingre_name }'/>">${list.ingre_name }</a></h6>
	                                    <h5>${list.ingre_price }원</h5>
	                                </div>
	                            </div>
	                        </div>
					    </c:forEach>
                    </div>
                    <div class="product__pagination">
                    	<c:forEach begin="${1 }" end="${endPage }" var="page">
                    		<a href="<c:url value='/shopgrid/${ingrelist.get(0).ingre_cat }/${page }'/>">${page }</a>
                    	</c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

    <!-- Footer Section Begin -->
    <%@ include file="./footer.jsp"%>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="<c:url value='/resources/js/jquery-3.3.1.min.js' />"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.nice-select.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery-ui.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.slicknav.js' />"></script>
	<script src="<c:url value='/resources/js/mixitup.min.js' />"></script>
	<script src="<c:url value='/resources/js/owl.carousel.min.js' />"></script>
	<script src="<c:url value='/resources/js/main.js' />"></script>
	<script src="<c:url value='/resources/js/popup.js' />"></script>
	<script src="<c:url value='/resources/js/wish-cart.js' />"></script>
</body>
</html>