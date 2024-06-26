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

