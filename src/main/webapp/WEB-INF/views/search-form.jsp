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
	<div class="header__icons">
		<div class="header__mypage ml-5">
			<a href=<c:url value='/mypage'/>>
				<svg xmlns="http://www.w3.org/2000/svg" id="Layer_1" data-name="Layer 1" viewBox="0 0 24 24" width="32" height="32"><path d="M8.974,12.026c3.323,0,6.026-2.703,6.026-6.026S12.297-.026,8.974-.026,2.949,2.677,2.949,6s2.703,6.026,6.025,6.026ZM8.974,.974c2.771,0,5.026,2.254,5.026,5.026s-2.254,5.026-5.026,5.026S3.949,8.771,3.949,6,6.203,.974,8.974,.974Zm14.293,10.758c-.943-.944-2.592-.944-3.535,0l-8.732,8.732v3.536h3.536l8.732-8.732c.472-.472,.732-1.1,.732-1.768s-.26-1.296-.732-1.768Zm-.707,2.828l-8.439,8.439h-2.122v-2.122l8.439-8.439c.566-.566,1.555-.566,2.121,0,.283,.283,.439,.66,.439,1.061s-.156,.777-.439,1.061Zm-9.061,.439H4.5c-1.93,0-3.5,1.57-3.5,3.5v5.5H0v-5.5c0-2.481,2.019-4.5,4.5-4.5H13.5c.345,0,.684,.046,1.014,.122l-.891,.891c-.042-.001-.081-.013-.123-.013Z"/></svg>
			</a>
		</div>
		<div class="header__wishlist ml-5">
			<a href=<c:url value='/wishlist'/>></a>
		</div>
		<div class="header__cart ml-5">
			<a href=<c:url value='/cart'/>></a>
		</div>
	</div>
</div>
<script src="<c:url value='/resources/js/search.js' />"></script>
<script src="<c:url value='/resources/js/popup.js' />"></script>