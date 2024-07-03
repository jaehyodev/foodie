/* 재료 찜 버튼 */
function ingreWishlist(ingre_idx){
	$.ajax({
		url : "wish-ingre.do",
		type : "get",
		data : {"ingre_idx":ingre_idx},
		success : function(data){
			if (data == "notLogin")
				showPopup("로그인을 해주세요.");
			else if (data == "delWish")
				showPopup("찜 목록에서 삭제되었습니다.");
			else if (data == "inWish")
				showPopup("찜 목록에 추가되었습니다.");
			else
				showPopup("찜 목록 담기를 실패했습니다.");
		},
		error : function(){
			showPopup("오류 발생");
	    }
	})
}

/* 레시피 찜 버튼 */
function recipeWishlist(recipe_idx){
   	$.ajax({
       	url : "wish-recipe.do",
       	type : "get",
       	data : {"recipe_idx":recipe_idx},
       	success : function(data){
       		if (data == "notLogin")
       			showPopup("로그인을 해주세요.");
       	 	else if (data == "delWish")
       		 	showPopup("찜 목록에서 삭제되었습니다.");
       	 	else if (data == "inWish")
       		 	showPopup("찜 목록에 추가되었습니다.");
       	 	else
       		 	showPopup("찜 목록 담기를 실패했습니다.");
        	},
       	error : function(){
           	showPopup("오류 발생");
       	}
   	})
}

/* 레시피 찜 목록 체크 시 전체 레시피 체크 */
function checkRecipesAll(source) {
  if (source.checked) {
    // source 체크박스가 체크되었을 때
    // 모든 체크박스에 체크를 설정
    var checkboxes = document
            .querySelectorAll('#mypage__recipe input[type="checkbox"]');
    checkboxes.forEach(function(checkbox) {
    	checkbox.checked = true;
    });
  } else {
    // source 체크박스가 체크 해제되었을 때
    // 모든 체크박스의 체크를 해제
    var checkboxes = document
            .querySelectorAll('#mypage__recipe input[type="checkbox"]');
    checkboxes.forEach(function(checkbox) {
    	checkbox.checked = false;
    });
  }
}


/* 재료 찜 목록 체크 시 전체 재료 체크 */
function checkIngresAll(source) {
  if (source.checked) {
	  // source 체크박스가 체크되었을 때
	  // 모든 체크박스에 체크를 설정
	  var checkboxes = document
	  				.querySelectorAll('#mypage__ingre input[type="checkbox"]');
	  checkboxes.forEach(function(checkbox) {
			checkbox.checked = true;
		});
	} else {
		// source 체크박스가 체크 해제되었을 때
		// 모든 체크박스의 체크를 해제
		var checkboxes = document
		        .querySelectorAll('#mypage__ingre input[type="checkbox"]');
		checkboxes.forEach(function(checkbox) {
			checkbox.checked = false;
		});
  }	
}


/* 레시피 찜 목록 삭제 */
// 레시피 찜 목록 개별 삭제
function deleteRecipe(recipe_idx) {
  $.ajax({
    url: "wishlist/recipe/delete.do",
    type: "POST",
    data: {"recipe_idx" : recipe_idx},
    success: function(data) {
      if (data == "success") {
      	location.reload();
      }
    },
    error: function() {
    	alert("레시피 찜 목록 삭제 실패");
    }
  })
}
// 레시피 찜 목록 선택된 항목들 삭제
function deleteSelectedRecipes() {
  // 체크된 레시피 체크박스의 값들을 수집
  const checkedboxes = document.querySelectorAll('.recipeCheckbox:checked');
  const recipeIdxArray = Array.from(checkedboxes).map(checkedbox => parseInt(checkedbox.value, 10));

  if (recipeIdxArray.length === 0) {
    alert("삭제할 레시피 항목을 선택해주세요.");
    return;
  }

  // Ajax 요청으로 서버에 레시피 찜 목록 선택된 항목들만 삭제 요청
  $.ajax({
    url: "wishlist/recipe/delete-selected.do",
    type: "POST",
    contentType: "application/json",
    data: JSON.stringify(recipeIdxArray),
    success: function(data) {
			if (data === "success") {
        location.reload();
      }
    },
    error: function() {
    	alert("레시피 찜 목록 삭제 실패");
    }
  });
}


/* 재료 찜 목록 삭제 */
// 재료 찜 목록 개별 삭제
function deleteIngre(ingre_idx) {
  $.ajax({
    url: "wishlist/ingre/delete.do",
    type: "POST",
    data: {"ingre_idx" : ingre_idx},
    success: function(data) {
      if (data == "success") {
      	location.reload();
      }
    },
    error: function() {
    	alert("재료 찜 목록 삭제 실패");
    }
  })
}
// 재료 찜 목록 선택된 항목들 삭제
function deleteSelectedIngres() {
  // 체크된 레시피 체크박스의 값들을 수집
  const checkedboxes = document.querySelectorAll('.ingreCheckbox:checked');
  const ingreIdxArray = Array.from(checkedboxes).map(checkedbox => parseInt(checkedbox.value, 10));

  if (ingreIdxArray.length === 0) {
    alert("삭제할 재료 항목을 선택해주세요.");
    return;
  }

  // Ajax 요청으로 서버에 재료 찜 목록 선택된 항목들만 삭제 요청
  $.ajax({
    url: "wishlist/ingre/delete-selected.do",
    type: "POST",
    contentType: "application/json",
    data: JSON.stringify(ingreIdxArray),
    success: function(data) {
			if (data === "success") {
        location.reload();
      }
    },
    error: function() {
    	alert("재료 찜 목록 삭제 실패");
    }
  });
}