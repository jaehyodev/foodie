// jsp에서 script 코드가 body태그의 맨 마지막 부분이 아닌 head태그 위치와 같이
// 애매한 위치에 있는 경우 $(document).ready를 사용할 것

//ID 중복 확인
//id를 입력할 수 있는 input text 영역을 벗어나면 동작한다.
$("#id").on("focusout", function() {
<<<<<<< HEAD
	
	var id = $("#id").val();
	
	// id input 태그에 아무 것도 입력이 안되있을 경우
	if(id == '' || id.length == 0) {
		$("#label1").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
		return false;
		// js는 return문을 만나는 순간 코드 실행 종료
		// 값을 반환해야하기 때문에 flase 입력 -> 다른 값을 입력해도 됨.
	}
	
	//Ajax로 전송
	$.ajax({
		url : '/foodie/idCheck',
		data : {
			mem_id : id
		},
		type : 'POST',
		dataType : 'json',
		success : function(result) {
			if (result == true) {
				$("#label1").css("color", "blue").text("사용 가능한 ID 입니다.");
			} else{
				$("#label1").css("color", "red").text("사용 불가능한 ID 입니다.");
				// $("#id").val('');
			}
		}
	}); // ajax 끝
	 
=======
   
   var id = $("#id").val();
   
   // id input 태그에 아무 것도 입력이 안되있을 경우
   if(id == '' || id.length == 0) {
      $("#label1").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
      return false;
      // js는 return문을 만나는 순간 코드 실행 종료
      // 값을 반환해야하기 때문에 flase 입력 -> 다른 값을 입력해도 됨.
   }
   
   //Ajax로 전송
   $.ajax({
      url : '/foodie/idCheck',
      data : {
         mem_id : id
      },
      type : 'POST',
      dataType : 'json',
      success : function(result) {
         if (result == true) {
            $("#label1").css("color", "blue").text("사용 가능한 ID 입니다.");
         } else{
            $("#label1").css("color", "red").text("사용 불가능한 ID 입니다.");
            // $("#id").val('');
         }
      }
   }); // ajax 끝
    
>>>>>>> b24a22e41feaab5eefc4694cdfef95de2533bc5f
});
    




// 비밀번호 확인
$("#pw, #pwck").on("focusout", function() {
    const pw = $("#pw").val();
    const pwck = $("#pwck").val();

    if (pw !== '' && pwck !== '') { // 비밀번호와 비밀번호 확인 값이 모두 입력된 경우에만 확인
        if (pw !== pwck) {
            $("#label2").css("color", "red").text("비밀번호가 일치하지 않습니다.");
        } else {
            $("#label2").css("color", "blue").text("비밀번호가 일치합니다.");
        }
    } else {
        $("#label2").text(""); // 입력되지 않은 경우 메시지 초기화
    }
});




// email 중복 확인
$("#email").on("focusout", function() {
   
   var email = $("#email").val();
   
   // email input 태그에 아무 것도 입력이 안되있을 경우
   if(email == '' || email.length == 0) {
      $("#label3").css("color", "red").text("공백은 email로 사용할 수 없습니다.");
      return false;
      // js는 return문을 만나는 순간 코드 실행 종료
      // 값을 반환해야하기 때문에 flase 입력 -> 다른 값을 입력해도 됨.
   }
   
   //Ajax로 전송
   $.ajax({
      url : '/foodie/emailCheck',
      data : {
         mem_email : email
      },
      type : 'POST',
      dataType : 'json',
      success : function(result) {
         if (result == true) {
            $("#label3").css("color", "blue").text("사용 가능한 email 입니다.");
         } else{
            $("#label3").css("color", "red").text("사용 불가능한 email 입니다.");
         }
      }
   }); // ajax 끝
});



// phone 중복 확인 $("태그의 id값")
$("#tel").on("focusout", function() {
	
	var tel = $("#tel").val();
	
	// tel input 태그에 아무 것도 입력이 안되있을 경우
	if(tel == '' || tel.length == 0) {
		$("#label4").css("color", "red").text("공백은 전화번호로 사용할 수 없습니다.");
		return false;
		// js는 return문을 만나는 순간 코드 실행 종료
		// 값을 반환해야하기 때문에 flase 입력 -> 다른 값을 입력해도 됨.
	}
	
	//Ajax로 전송
	$.ajax({
		url : '/foodie/phoneCheck',
		data : {
			mem_phone : tel
		},
		type : 'POST',
		dataType : 'json',
		success : function(result) {
			if (result == true) {
				$("#label4").css("color", "blue").text("사용 가능한 전화번호입니다.");
			} else{
				$("#label4").css("color", "red").text("사용 불가능한 전화번호입니다.");
			}
		}
	}); // ajax 끝
	 
});






// 회원가입 버튼 클릭 이벤트 처리
$("#joinBtn").click(function(event) {
    // id값이 joinBtn인 button태그를 클릭했을 때
    // 해당하는 form 내에 있는 데이터가 바로 Controller로 전달되는 것을 방지
    // event.preventDefault();

    // 입력값을 boolean값으로 구분하여 변수에 담고
    // 해당 변수를 if 문에서 조건으로 사용함.
    var isValidId = $("#label1").text() === "사용 가능한 ID 입니다.";
    var isValidPw = $("#label2").text() === "비밀번호가 일치합니다.";
    var isValidEmail = $("#label3").text() === "사용 가능한 email 입니다.";
    var isValidTel = $("#label4").text() === "사용 가능한 전화번호입니다.";
	
    if (isValidId && isValidPw && isValidEmail && isValidTel) {
        // 중복을 확인해야하는 값들이 모두 true 일 경우
        // formData 에 사용자가 입력한 정보들 객체 형태로 담기
        const formData = {
            mem_id : $("#id").val(),
            mem_pw : $("#pw").val(),
            mem_email : $("#email").val(),
            mem_phone : $("#tel").val(),
            mem_addr : $("addr").val(),
            mem_extraAddr : $("extraAddr").val(),
            allergy_list : [],
        	dislike_list : []
        };
		
		// 알러지 정보 (체크된 체크박스 값 가져오기)
   	    $("input[name=allergy_list]:checked").each(function() {
        formData.allergy_list.push($(this).val());
    	});

    	// 비선호 식재료 정보 (체크된 체크박스 값 가져오기)
    	$("input[name=dislike_list]:checked").each(function() {
        formData.dislike_list.push($(this).val());
    	});
		
		
		
        $.ajax({
            url : '/foodie/join.do',
            type : 'POST',
            data : formData,
            dataType : 'json',
            success : function(data) {
                if (data == "success") {
                    showPopup("회원가입이 완료되었습니다."); // 로그인 페이지 이동
                    console.log("회원가입 성공");
                    // popupContainer.remove();
                   // window.location.href = '/foodie/login
                } else {
                    showPopup("회원가입 실패(서버 오류)"); // 현재 페이지 유지
                }
            },
            error: function() {
                showPopup("오류 발생"); // 현재 페이지 유지
                console.log(typeof data);
            }
        });
    } else {
        // 유효성 검사 실패 또는 중복된 값이 있을 경우
        showPopup("입력 정보를 다시 확인해주세요."); // 현재 페이지 유지
    }
});
   
   var tel = $("#tel").val();
   
   // tel input 태그에 아무 것도 입력이 안되있을 경우
   if(tel == '' || tel.length == 0) {
      $("#label4").css("color", "red").text("공백은 전화번호로 사용할 수 없습니다.");
      return false;
      // js는 return문을 만나는 순간 코드 실행 종료
      // 값을 반환해야하기 때문에 flase 입력 -> 다른 값을 입력해도 됨.
   }
   
   //Ajax로 전송
   $.ajax({
      url : '/foodie/phoneCheck',
      data : {
         mem_phone : tel
      },
      type : 'POST',
      dataType : 'json',
      success : function(result) {
         if (result == true) {
            $("#label4").css("color", "blue").text("사용 가능한 전화번호입니다.");
         } else{
            $("#label4").css("color", "red").text("사용 불가능한 전화번호입니다.");
         }
      }
   }); // ajax 끝
    
});
