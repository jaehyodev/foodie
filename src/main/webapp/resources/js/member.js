// jsp에서 script 코드가 body태그의 맨 마지막 부분이 아닌 head태그 위치와 같이
// 애매한 위치에 있는 경우 $(document).ready를 사용할 것

//ID 중복 확인
//id를 입력할 수 있는 input text 영역을 벗어나면 동작한다.
$("#id").on("focusout", function() {

   
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
   
   // @ 포함 여부 확인
   if (!email.includes("@")) {
   $("#label3").css("color", "red").text("올바른 이메일 형식이 아닙니다.");
   return false; // 유효성 검사 실패 시 함수 종료
   }
   
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
   event.preventDefault();

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
            mem_pwck : $("#pwck").val(),
            mem_name : $("#name").val(),
            mem_email : $("#email").val(),
            mem_tel : $("#tel").val(),
            mem_addr : $("#addr").val(),
            mem_extraAddr : $("#extraAddr").val(),
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
            dataType : 'text',
            success : function(result) {
                if(result == "success") {
                    console.log(result);
                   showPopup("회원가입이 완료되었습니다.");
                }
                else if(result == "fail"){
                   console.log(result);
                   showPopup("회원가입 실패 (서버 오류)");
                }
            },
            error: function() {
                console.log(typeof result);
            }
        });
    } else {
        showPopup("입력 정보를 다시 확인해주세요."); // 현재 페이지 유지
    }
});
});
   
   
   




// 비밀번호 변경
$("#updatePwBtn").click(function(event) {
event.preventDefault(); // 폼 제출 실행 방지 (action이 실행되는 것을 방지함.)

// 입력값 유효성 검사
const curPw = $("#curPw").val();
const newPw = $("#newPw").val();
const pwCheck = $("#pwCheck").val();

if (curPw === '') {
    alert("현재 비밀번호를 입력하세요.");
    return;
} else if (newPw === '') {
    alert("새로운 비밀번호를 입력하세요.");
    return;
} else if (pwCheck === '') {
    alert("새로운 비밀번호 확인을 입력하세요.");
    return;
} else if (newPw !== pwCheck) {
    alert("새로운 비밀번호와 확인이 일치하지 않습니다.");
    return;
}

// 비밀번호 유효성 검사 (필요한 경우 추가)
// 예: 비밀번호 길이, 특수문자 포함 여부 등

// 폼 데이터 생성
const formData = {
    curPw : curPw,
    newPw : newPw,
    pwCheck : pwCheck
};

// AJAX 요청
$.ajax({
    url: '/foodie/updatePw.do',
    type: 'POST',
    data: formData,
    dataType: 'text',
    success: function(result) {
        if (result == 'success') {
           console.log(result)
            showPopup("비밀번호 변경이 완료되었습니다.");
        } else if (result == 'curPwFail') {
            showPopup("현재 비밀번호가 일치하지 않습니다.");
            $("#curPw").val(''); // 현재 비밀번호 입력값 초기화
        } else {
            showPopup("비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
        }
    },
    error: function() {
        showPopup("비밀번호 변경 중 오류가 발생했습니다.");
    }
});
});







// 회원탈퇴
$("#deleteBtn").click(function(event) {
event.preventDefault();
    
// 1. 탈퇴 확인 팝업
if (!confirm("정말 회원탈퇴를 진행하시겠습니까?")) {
return; // 취소 시 실행 종료
}

// 2. 입력값 가져오기
const input_id = $("#id").val();
const input_pw = $("#pw").val();

// 3. 필수 입력값 확인
if (!input_id || !input_pw) {
  showPopup("아이디와 비밀번호를 모두 입력해주세요.");
  return;
}

// 4. AJAX 요청
$.ajax({
  url: '/foodie/delete.do',
  type: 'POST',
  data: { input_id: input_id, input_pw: input_pw },
  dataType: 'text',
  success: function(result) {
       if (result == 'success') {
         showPopup("회원탈퇴가 완료되었습니다.");
         // 탈퇴 후 로그아웃 및 메인 페이지 이동 등 추가 로직 구현
       } else if (result == 'fail') {
         showPopup("아이디 또는 비밀번호가 일치하지 않습니다.");
         $("#id, #pw").val(''); // 아이디 비번 입력값 초기화
       } else {
         showPopup("회원탈퇴에 실패했습니다. 다시 시도해주세요.");
       }
     },
     error: function() {
    showPopup("회원탈퇴 중 오류가 발생했습니다.");
     }
 });
 });







// 로그인 확인
$("#loginBtn").click(function(event) {
event.preventDefault();

// 입력값 가져오기
const login_id = $("#login_id").val();
const login_pw = $("#login_pw").val();

// 필수 입력값 확인
if (!login_id || !login_pw) {
  $("#label10").css("color", "red").text("아이디 또는 비밀번호를 입력해주세요.");
  return;
}


// AJAX 요청
$.ajax({
  url: '/foodie/loginCheck',
  type: 'POST',
  data: { id : login_id, pw : login_pw },
  dataType: 'text',
  success: function(result) {
       if (result == 'success') {
         window.location.href = '/foodie/';
       } else if (result == 'fail') {
         $("#label10").css("color", "red").text("아이디 또는 비밀번호가 일치하지 않습니다.");
       } else {
         
       }
     },
     error: function() {
    showPopup("로그인 중 오류가 발생했습니다.");
     }
 });
 });










