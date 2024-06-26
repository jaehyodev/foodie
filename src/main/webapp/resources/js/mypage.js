/* 메인 화면에서 로그인 안 했을 때 찜 목록 누르면 팝업창 띄우기 */
function ingreWishlist(ingre_idx){
	$.ajax({
		url : "wishlist",
		type : "get",
		data : {"ingre_idx":ingre_idx},
		success : function(data){
			if (data == "notLogin")
				showPopup("로그인을 해주세요.");
			else if (data == "inWish")
				showPopup("찜 목록에서 삭제되었습니다.");
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