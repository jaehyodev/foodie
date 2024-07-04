<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="hero__categories">
	<div class="hero__categories__all">
		<i class="fa fa-bars"></i> <span>카테고리</span>
	</div>
	<ul id="categories-list">
		<li><a href="<c:url value='/recipe-grid/주부'/>">주부 레시피</a></li>
		<li><a href="<c:url value='/recipe-grid/키즈'/>">키즈 레시피</a></li>
		<li><a href="<c:url value='/recipe-grid/자취생'/>">자취생 레시피</a></li>
		<li><a href="<c:url value='/recipe-grid/다이어트'/>">다이어트 레시피</a></li>
		<li><a href="<c:url value='/recipe-grid/캠핑'/>">캠핑 레시피</a></li>
		<li><a href="<c:url value='/recipe-grid/파티'/>">파티 레시피</a></li>
		<li><a href="<c:url value='/recipe-grid/야식'/>">야식 레시피</a></li>
		<li><a href="#" id="ingredient-link">재료 사러가기</a></li>
	</ul>
	<ul id="additional-categories">
		<li><a href="<c:url value='/ingre-grid/채소/1'/>">채소</a></li>
		<li><a href="<c:url value='/ingre-grid/과일/1'/>">과일</a></li>
		<li><a href="<c:url value='/ingre-grid/수산/1'/>">수산</a></li>
		<li><a href="<c:url value='/ingre-grid/정육ㆍ계란류/1'/>">정육ㆍ계란류</a></li>
		<li><a href="<c:url value='/ingre-grid/쌀ㆍ잡곡/1'/>">쌀ㆍ잡곡</a></li>
		<li><a href="<c:url value='/ingre-grid/면ㆍ오일/1'/>">면ㆍ오일</a></li>
		<li><a href="<c:url value='/ingre-grid/우유ㆍ유제품/1'/>">우유ㆍ유제품</a></li>
		<li><a href="<c:url value='/ingre-grid/소스ㆍ조미료/1'/>">소스ㆍ조미료</a></li>
		<li><a href="<c:url value='/ingre-grid/음료/1'/>">음료</a></li>
		<li><a href="<c:url value='/ingre-grid/기타/1'/>">기타</a></li>
		<li><a href="#" id="view-recipes">레시피 보러가기</a></li>
	</ul>
</div>