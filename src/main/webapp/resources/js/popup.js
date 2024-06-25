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
       if(message=="로그인을 해주세요.")
           window.location.href = '/foodie/login';
       else if(message=="수정되었습니다"){
       		popupContainer.remove();
       		window.location.reload();
       }else if(message=="주문이 완료되었습니다"){
       		window.location.href = `/foodie/success/\rsp.merchant_uid`;
       }      
       else
       		popupContainer.remove(); // 예시로 현재 창을 닫는 동작만 수행
    }

    popupContainer.appendChild(popupMessage);
    popupContainer.appendChild(closeButton);
    document.body.appendChild(popupContainer);
}

function showPopup(message, merchant_uid) {
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
       if(message=="주문이 완료되었습니다"){
       		window.location.href = '/foodie/success/'+merchant_uid;
       }      
       else
       		popupContainer.remove(); // 예시로 현재 창을 닫는 동작만 수행
    }

    popupContainer.appendChild(popupMessage);
    popupContainer.appendChild(closeButton);
    document.body.appendChild(popupContainer);
}
