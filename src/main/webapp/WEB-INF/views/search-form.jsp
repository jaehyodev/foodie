<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="hero__search">
	<div class="hero__search__form">
		<form action="#">
			<input type="text" placeholder="푸디 제품, 요리명 등 다양하게 검색해보세요 !"
				id="input-search">
			<button type="button" class="site-btn" onclick="search()">검색</button>
		</form>
	</div>
		<div class="header__wishlist__cart">
				<div class="header__wishlist"><a href=<c:url value='/wishlist'/>><i class="fa fa-heart"></i></a><span>찜 목록</span></div>
				<div class="header__cart"><a href=<c:url value='/cart'/>><i class="fa fa-shopping-bag"></i></a><span>장바구니</span></div>
		</div>
<!-- 		<div class="hero__search__phone__icon" onclick="openChatbot()">
			<i class="fa fa-comments"></i>
		</div>
		<div class="hero__search__phone__text">
			<span>AI 챗봇 상담</span>
		</div> -->

</div>