   // 전체 선택/해제 기능
   function toggleCheckboxes(source) {
      var checkboxes = document.getElementsByClassName("check");
      for (var i = 0; i < checkboxes.length; i++) {
         if (checkboxes[i] != source)
            checkboxes[i].checked = source.checked;
      }
   }

   // 선택 삭제 기능   
   function deleteSelectedItems() {
    var selectedItems = document.querySelectorAll("#checkEach.check:checked");
    var ingreIdxs = [];
    var memIds = [];
    
    selectedItems.forEach(function(item) {
        ingreIdxs.push(item.getAttribute("data-ingre-idx"));
        memIds.push(item.getAttribute("data-mem-id"));
    });

    $.ajax({
        type: "get",
        url: "deleteSelectedItems.do",
        traditional: true,
        data: {
            ingreIdxs: ingreIdxs,
            memIds: memIds
        },
        success: function(data){
            showPopup("선택된 항목이 삭제되었습니다");
            popupContainer.remove();
            window.location.reload();
        },
        error: function(){
            showPopup("삭제 할 항목을 선택해주세요");
        }
    });
   }
   
   //장바구니 수정하기
   function updateCart(){
      
      var cntValues = document.getElementsByName("cntValue");//주문 수량
      var cartValues = [];
      var idxValues = document.getElementsByName("idxValue");//장바구니 idx
      var basketValues = [];
      
      for(var i=0; i<cntValues.length; i++){
         cartValues.push(cntValues[i].value);
         basketValues.push(idxValues[i].value);
      }
      
        $.ajax({
         url : "updateCart.do",
         type : "get",
         dataType : "json",
         traditional : true,
         data : {"cartValues":cartValues,"basketValues":basketValues},
         success :function(data){
            showPopup("수정되었습니다");
         },
         error: function() {
              console.log("수정실패");
          }
      })   
   }
   
   //계속 쇼핑하기
   function continueShopping(){
      history.back(); //이전 페이지로 이동
   }
   
         var payInfo = '';
         //user정보 불러오기
         var merchant_uid = Math.floor(new Date().getTime() / 1000); //주문번호
         var userSum = parseInt(document.querySelector('#member-sum').innerText.replace(/,/g, '')); //결제 총액
         var userName = document.querySelector('#member-name').value;
         var userPhone = document.querySelector('#member-phone').value;
         var userEmail = document.querySelector('#member-email').value;
         var userAddr = document.querySelector('#member-addr').value;
            
         //사용자 입력값으로 저장
         document.querySelector('#member-name').addEventListener('input', function() {
            userName = this.value;
         });

         document.querySelector('#member-phone').addEventListener('input', function() {
            userPhone = this.value;
         });

         document.querySelector('#member-email').addEventListener('input', function() {
            userEmail = this.value;
         });

         document.querySelector('#member-addr').addEventListener('input', function() {
            userAddr = this.value;
         });
         //주문상품 목록 저장
         var ingreValues = document.getElementsByName("ingreValue");//재료idx
         var ingreidxValues = [];
         var cntValues = document.getElementsByName("cntValue");//주문 수량
         var countValues = [];
         
         for(var i=0;i<cntValues.length;i++){
            countValues.push(cntValues[i].value);
            ingreidxValues.push(ingreValues[i].value);
         }
         console.log(ingreidxValues)
         console.log(countValues)
         
          //결제 요청  
         function requestPay(){
               
            event.preventDefault();//새로고침 방지
            var checkbox = document.getElementById('acc-or'); //결제동의 체크 시 결제가능
            var selectedOption = document.querySelector('input[name="pay"]:checked'); //결제방법 선택         

            if(selectedOption){
               var selectedValue = selectedOption.value;
               if(selectedValue === 'card'){ //카드결제
                  payInfo = 'html5_inicis';
                  }else if (selectedValue === 'kakao'){ //카카오페이
                     payInfo = 'kakaopay';
                  }else{
                     showPopup("결제 방법을 선택해주세요.")
                  }
            }
            if(checkbox.checked){ //결제 동의 시
               IMP.request_pay({
                     pg : payInfo,
                     pay_method : 'card',
                     merchant_uid : merchant_uid, // 주문번호
                     name : 'Foodie',
                     amount : userSum, // 결제 총액
                     buyer_email : userEmail, // email
                     buyer_name : userName, // 이름
                     buyer_tel : userPhone, // 번호
                     buyer_addr : userAddr, // 주소
                     buyer_postcode : '01181',
            }, function(rsp) { // callback
               //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단               
                  if(rsp.success){ //주문완료
                        $.ajax({
                           url : "checkoutSuccess.do",
                           type : "get",
                           traditional: true,
                           data : {
                                 "merchant_uid":rsp.merchant_uid,
                                 "userAddr":rsp.buyer_addr,
                                 "userSum":rsp.paid_amount,
                                 "ingreidxValues":ingreidxValues,
                                 "countValues":countValues
                                 },//주문번호,주소,총액
                           success : function(){
                              showIdPopup("주문이 완료되었습니다.", rsp.merchant_uid);
                           },
                           error : function(){
                              console.log("전송실패")
                           }
                        })                  
                     }else{
                        if(!selectedValue){ // 결제방법선택 X
                           showPopup("결제 방법을 선택해주세요.")
                           event.preventDefault();
                        }else{ //결제 X
                           showPopup("결제가 취소되었습니다.")                     
                        }
                     }                                    
                  });
               }else{
                  showPopup("결제 동의에 체크해주세요.")
                  event.preventDefault();
               }         
            }