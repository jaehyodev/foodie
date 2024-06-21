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
    
    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/3a115195d8.js" crossorigin="anonymous"></script>

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

    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <%@ include file="./header.jsp"%>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <!-- 상단 카테고리 -->
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
	                    	<li><a href="<c:url value='/recipe/주부'/>">주부 레시피</a></li>
	                        <li><a href="<c:url value='/recipe/키즈'/>">키즈 레시피</a></li>
	                        <li><a href="<c:url value='/recipe/자취생'/>">자취생 레시피</a></li>
	                        <li><a href="<c:url value='/recipe/다이어트'/>">다이어트 레시피</a></li>
	                        <li><a href="<c:url value='/recipe/캠핑'/>">캠핑 레시피</a></li>
	                        <li><a href="<c:url value='/recipe/파티'/>">파티 레시피</a></li>
	                        <li><a href="<c:url value='/recipe/야식'/>">야식 레시피</a></li>
	                        <li><a href="<c:url value='/shopgrid/채소/1'/>">재료 사러가기</a></li>
	                    </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                        <!-- 검색창 -->
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

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
        	<div class="col-lg-12 col-md-12">
	        	<div class="product__details__pic">
	            	<div class="product__details__pic__item">
	                	<!-- 레시피 대표 사진 -->
	                	<img class="product__details__pic__item--large"
	                    	src="<c:url value='../resources/img${recipe.recipe_title_img }'/>" alt="">
	                </div>
	            </div>
	        </div>
	        <br></br>
	        <div class="col-lg-12 col-md-12">
            	<div class="product__details__text">
                    <div class="row">
                    	<div class="col-lg-8 col-md-8">
                    		<!-- 레시피명 -->
	                        <h3>${recipe.getRecipe_name() }</h3>
	                        <c:forEach items="${recipecontent }" var="list">
	                        	<h5 style="line-height: 2.0;">${list }</h5>
				            </c:forEach>
	                        <br></br>
                    	</div>
                    	<div class="col-lg-4 col-md-4">
	                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
	                        
	                        <ul>
	                            <li><b>인분 <i class="fa-solid fa-utensils i-recipe"></i></b> <span>${recipe.getRecipe_portion() }인분</span></li>
	                            <li><b>시간 <i class="fa-solid fa-clock i-recipe"></i></b> <span>${recipe.getRecipe_time() }분 이내</span></li>
	                        </ul>
                    	</div>
                    </div>
                </div>
                
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">재료</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">조리 순서</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>재료</h6>
                                    <c:forEach items="${recipe.getRecipe_all_ingre().split(', ') }" var="recipe">
                                    	<p>${recipe }</p>
			                    	</c:forEach>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>조리순서</h6>
                                    <c:forEach items="${recipecook }" var="recipecook" varStatus="loop">
                                    	<p>${loop.index + 1}. ${recipecook }</p>
			                    	</c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <!-- 관련상품 -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>관련 상품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            	<c:forEach items="${recipe_ingre }" var="list">
            		<div class="col-lg-3 col-md-4 col-sm-6">
	                    <div class="product__item">
	                    	<input class="check" type="checkbox" checked></input>
	                        <div class="product__item__pic set-bg" data-setbg="<c:url value='../resources/img${list.ingre_img }'/>">
	                            <ul class="product__item__pic__hover">
	                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
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
		</div>
    </section>
    <section class="related-product">
        <div class="container">
            <a href="#" class="primary-btn float-center">선택 상품 장바구니 담기</a>
            <br></br>
        </div>
    </section>
    <!-- Related Product Section End -->
	
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
</body>
</html>