/* 기본 팝업 */
function showPopup(message) {
    const popupContainer = document.createElement('div');
    popupContainer.id = 'popup-container';
    popupContainer.style.position = 'fixed';
    popupContainer.style.top = '50%';
    popupContainer.style.left = '50%';
    popupContainer.style.transform = 'translate(-50%, -50%)';
    popupContainer.style.backgroundColor = 'white';
    popupContainer.style.padding = '30px';
    popupContainer.style.borderRadius = '10px';
    popupContainer.style.boxShadow = '0 0 20px rgba(0, 0, 0, 0.1)';
    popupContainer.style.maxWidth = '90%';
    popupContainer.style.width = '500px';
    popupContainer.style.textAlign = 'center';

    const popupMessage = document.createElement('p');
    popupMessage.id = 'popup-message';
    popupMessage.textContent = message;
    popupMessage.style.fontSize = '18px';
    popupMessage.style.margin = '20px 0';

    const closeButton = document.createElement('button');
    closeButton.id = 'popup-confirm';
    closeButton.textContent = '확인';
    closeButton.style.padding = '10px 20px';
    closeButton.style.fontSize = '16px';
    closeButton.style.backgroundColor = '#D03737';
    closeButton.style.color = 'white';
    closeButton.style.border = 'none';
    closeButton.style.borderRadius = '5px';
    closeButton.style.cursor = 'pointer';
    closeButton.style.transition = 'background-color 0.3s';
    closeButton.addEventListener('click', popupConfirm);

    function popupConfirm() {
       if(message=="로그인을 해주세요."){
             popupContainer.remove();          
           window.location.href = '/login';
       }
       else if(message=="수정되었습니다."){
             popupContainer.remove();
             window.location.reload();
       }
       else if(message=="회원가입이 완료되었습니다."){
              popupContainer.remove();
              window.location.href = '/login';
       }
       else if(message=="회원가입 실패 (서버 오류)"){
              popupContainer.remove();
       }
       else if(message=="입력 정보를 다시 확인해주세요."){
              popupContainer.remove();
       }
       else if(message=="비밀번호 변경이 완료되었습니다."){
              popupContainer.remove();
              window.location.href = '/update-pw';
       }
       else if(message=="현재 비밀번호가 일치하지 않습니다."){
              popupContainer.remove();
       }else if(message=="회원탈퇴가 완료되었습니다."){
       				 popupContainer.remove();
       				 window.location.href = '/';
       }else if(message=="아이디 또는 비밀번호가 일치하지 않습니다."){
       				popupContainer.remove();
       } else if (message=="현재 비밀번호를 입력하세요.") {
       				popupContainer.remove();
       } else if (message=="새로운 비밀번호를 입력하세요.") {
       				popupContainer.remove();
       } else if (message=="새로운 비밀번호 확인을 입력하세요.") {
       				popupContainer.remove();
       } else if (message=="새로운 비밀번호와 확인이 일치하지 않습니다.") {
       				popupContainer.remove();
       }else if (message=="새로운 비밀번호는 영어와 숫자 조합으로 5~20자리여야 합니다.") {
              popupContainer.remove();
       }
       else{
             popupContainer.remove(); // 예시로 현재 창을 닫는 동작만 수행
             window.location.reload();
       }
    }

    popupContainer.appendChild(popupMessage);
    popupContainer.appendChild(closeButton);
    document.body.appendChild(popupContainer);
}

/* 주문 완료 팝업 */
function showIdPopup(message, merchant_uid) {
    const popupContainer = document.createElement('div');
    popupContainer.id = 'popup-container';
    popupContainer.style.position = 'fixed';
    popupContainer.style.top = '50%';
    popupContainer.style.left = '50%';
    popupContainer.style.transform = 'translate(-50%, -50%)';
    popupContainer.style.backgroundColor = 'white';
    popupContainer.style.padding = '30px';
    popupContainer.style.borderRadius = '10px';
    popupContainer.style.boxShadow = '0 0 20px rgba(0, 0, 0, 0.1)';
    popupContainer.style.maxWidth = '90%';
    popupContainer.style.width = '500px';
    popupContainer.style.textAlign = 'center';

    const popupMessage = document.createElement('p');
    popupMessage.id = 'popup-message';
    popupMessage.textContent = message;
    popupMessage.style.fontSize = '18px';
    popupMessage.style.margin = '20px 0';

    const closeButton = document.createElement('button');
    closeButton.id = 'popup-confirm';
    closeButton.textContent = '확인';
    closeButton.style.padding = '10px 20px';
    closeButton.style.fontSize = '16px';
    closeButton.style.backgroundColor = '#D03737';
    closeButton.style.color = 'white';
    closeButton.style.border = 'none';
    closeButton.style.borderRadius = '5px';
    closeButton.style.cursor = 'pointer';
    closeButton.style.transition = 'background-color 0.3s';
    closeButton.addEventListener('click', popupConfirm);

    function popupConfirm() {
       if(message=="주문이 완료되었습니다."){
             window.location.href = '/success/'+merchant_uid;
       }      
       else
             popupContainer.remove(); // 예시로 현재 창을 닫는 동작만 수행
    }

    popupContainer.appendChild(popupMessage);
    popupContainer.appendChild(closeButton);
    document.body.appendChild(popupContainer);
}

/* 장바구니 버튼 클릭 시 팝업 */
function showCartPopup(message) {
    const popupContainer = document.createElement('div');
    popupContainer.id = 'popup-container';
    popupContainer.style.position = 'fixed';
    popupContainer.style.top = '50%';
    popupContainer.style.left = '50%';
    popupContainer.style.transform = 'translate(-50%, -50%)';
    popupContainer.style.backgroundColor = 'white';
    popupContainer.style.padding = '30px';
    popupContainer.style.borderRadius = '10px';
    popupContainer.style.boxShadow = '0 0 20px rgba(0, 0, 0, 0.1)';
    popupContainer.style.maxWidth = '90%';
    popupContainer.style.width = '500px';
    popupContainer.style.textAlign = 'center';
    
    const popupMessage = document.createElement('p');
    popupMessage.id = 'popup-message';
    popupMessage.textContent = message;
    popupMessage.style.fontSize = '18px';
    popupMessage.style.margin = '20px 0';

    const confirmButton = document.createElement('button');
    confirmButton.id = 'popup-confirm';
    confirmButton.textContent = '계속 쇼핑하기';
    confirmButton.style.padding = '10px 20px';
    confirmButton.style.fontSize = '16px';
    confirmButton.style.backgroundColor = '#D03737';
    confirmButton.style.color = 'white';
    confirmButton.style.border = 'none';
    confirmButton.style.borderRadius = '5px';
    confirmButton.style.cursor = 'pointer';
    confirmButton.style.transition = 'background-color 0.3s';
    confirmButton.addEventListener('click', popupConfirm);

    const goToCartButton = document.createElement('button');
    goToCartButton.id = 'popup-go-to-cart';
    goToCartButton.textContent = '장바구니 가기';
    goToCartButton.style.marginTop = '10px';
    goToCartButton.style.marginLeft = '10px';
    goToCartButton.style.padding = '10px 20px';
    goToCartButton.style.fontSize = '16px';
    goToCartButton.style.backgroundColor = '#D03737';
    goToCartButton.style.color = 'white';
    goToCartButton.style.border = 'none';
    goToCartButton.style.borderRadius = '5px';
    goToCartButton.style.cursor = 'pointer';
    goToCartButton.style.transition = 'background-color 0.3s';
    goToCartButton.addEventListener('click', goToCart);

    function popupConfirm() {
        if (message == "로그인을 해주세요.") {
            popupContainer.remove();
            window.location.href = '/login';
        }
        else {
            popupContainer.remove(); // 예시로 현재 창을 닫는 동작만 수행
            window.location.reload();
        }
    }

    function goToCart() {
        popupContainer.remove();
        window.location.href = '/cart'; // 장바구니 페이지로 이동
    }

    popupContainer.appendChild(popupMessage);
    popupContainer.appendChild(confirmButton);
    popupContainer.appendChild(goToCartButton); // 장바구니로 가기 버튼 추가
    document.body.appendChild(popupContainer);
}

/* 주문 취소 확인 팝업 */
function showConfirmPopup(message, onConfirm) {
    const popupContainer = document.createElement('div');
    popupContainer.id = 'popup-container';
    popupContainer.style.position = 'fixed';
    popupContainer.style.top = '50%';
    popupContainer.style.left = '50%';
    popupContainer.style.transform = 'translate(-50%, -50%)';
    popupContainer.style.backgroundColor = 'white';
    popupContainer.style.padding = '30px';
    popupContainer.style.borderRadius = '10px';
    popupContainer.style.boxShadow = '0 0 20px rgba(0, 0, 0, 0.1)';
    popupContainer.style.maxWidth = '90%';
    popupContainer.style.width = '500px';
    popupContainer.style.textAlign = 'center';

    const popupMessage = document.createElement('p');
    popupMessage.id = 'popup-message';
    popupMessage.textContent = message;
    popupMessage.style.fontSize = '18px';
    popupMessage.style.margin = '20px 0';

    const closeButton = document.createElement('button');
    closeButton.id = 'popup-confirm';
    closeButton.textContent = '확인';
    closeButton.style.padding = '10px 20px';
    closeButton.style.fontSize = '16px';
    closeButton.style.backgroundColor = '#D03737';
    closeButton.style.color = 'white';
    closeButton.style.border = 'none';
    closeButton.style.borderRadius = '5px';
    closeButton.style.cursor = 'pointer';
    closeButton.style.transition = 'background-color 0.3s';

    closeButton.addEventListener('click', function() {
    	popupContainer.remove();
      	if (typeof onConfirm === 'function') {
        	onConfirm();
        }
      });

    const cancelButton = document.createElement('button');
    cancelButton.textContent = '취소';
    cancelButton.style.padding = '10px 20px';
    cancelButton.style.fontSize = '16px';
    cancelButton.style.backgroundColor = '#888888';
    cancelButton.style.marginLeft = '10px';
    cancelButton.style.color = 'white';
    cancelButton.style.border = 'none';
    cancelButton.style.borderRadius = '5px';
    cancelButton.style.cursor = 'pointer';
    cancelButton.style.transition = 'background-color 0.3s';
    cancelButton.style.marginLeft = '10px';

    cancelButton.addEventListener('click', function() {
    	popupContainer.remove();
    });

    popupContainer.appendChild(popupMessage);
    popupContainer.appendChild(closeButton);
    popupContainer.appendChild(cancelButton);
    document.body.appendChild(popupContainer);
}
