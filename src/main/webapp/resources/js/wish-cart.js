/* 재료 개별 찜 버튼 */
function ingreWishlist(ingre_idx){
	$.ajax({
		url : "wishIngre",
		type : "get",
		data : {"ingre_idx":ingre_idx},
		success : function(data){
			if (data == "notLogin")
				showPopup("로그인을 해주세요.");
			else if (data == "inWish")
				showPopup("이미 찜에 담겨있습니다.");
			else if (data == "success")
				showPopup("찜 목록에 추가되었습니다.");
			else
				showPopup("오류 발생");
		},
		error : function(){
			alert("실패");
	    }
	})
}

/* 재료 개별 장바구니 버튼 (수량 x) */
function ingreCart(ingre_idx){
	$.ajax({
		url : "cart",
		type : "get",
		data : {"ingre_idx":ingre_idx},
		success : function(data){
			if (data == "notLogin")
				showPopup("로그인을 해주세요.");
			else if (data == "inCart")
				showPopup("이미 장바구니에 담겨있습니다.");
			else if (data == "success")
				showPopup("장바구니 목록에 추가되었습니다.");
			else
				showPopup("오류 발생");
		},
		error : function(){
			alert("실패");
		}
	})
}

/* 장바구니 버튼 (수량 o) */
function ingreDetailCart(ingre_idx){
	var quantity = document.getElementById('quantityInput').value;
	$.ajax({
		url : "currentCart",
		type : "get",
       	data : {"ingre_idx":ingre_idx, "quantity":quantity},
       	success : function(data){
       		if (data == "notLogin")
       			showPopup("로그인을 해주세요.");
       	 	else if (data == "inCart")
       		 	showPopup("이미 장바구니에 담겨있습니다.");
       	 	else if (data == "success")
       		 	showPopup("장바구니 목록에 추가되었습니다.");
       	 	else
       		 	showPopup("오류 발생");
       	},
       	error : function(){
        	alert("실패");
       	}
    })
}

/* 레시피 찜 버튼 */
function recipeWishlist(recipe_idx){
   	$.ajax({
       	url : "wishRecipe",
       	type : "get",
       	data : {"recipe_idx":recipe_idx},
       	success : function(data){
       		if (data == "notLogin")
       			showPopup("로그인을 해주세요.");
       	 	else if (data == "inWish")
       		 	showPopup("이미 찜에 담겨있습니다.");
       	 	else if (data == "success")
       		 	showPopup("찜 목록에 추가되었습니다.");
       	 	else
       		 	showPopup("오류 발생");
        	},
       	error : function(){
           	alert("실패");
       	}
   	})
}

/* 관련 재료 한번에 장바구니 담기 버튼 */
$(document).ready(function() {
   	$("#getCheckedValues").click(function() {
       	let checkedItems = [];
       	$(".check:checked").each(function() {
           	checkedItems.push($(this).val());
       	});
       	$.ajax({
           	url: "allCart",
           	type: "get",
           	traditional: true,
			data: { "checkedItems": checkedItems },
			success: function(data) {
	 			if (data == "notLogin")
	 				showPopup("로그인을 해주세요.");
				else if (data == "success")
					showPopup("장바구니에 추가되었습니다.");
				else
					showPopup("오류 발생");
			},
	        error: function() {
	        	alert("장바구니 담기 실패");
	        }
		});
	});
});