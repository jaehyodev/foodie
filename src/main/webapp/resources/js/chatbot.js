/* 챗봇 열기 - Begin */
function openChatbot() {
  window.open(
    "/chatbot",
    "ChatGPT openAI Chatbot",
    "width=400,height=600"
  );
}
/* 챗봇 열기 - End */


/* 챗봇 토글 - Begin */
let isChatGPT = true; // ChatGPT(푸)인지 Chatbase(디)인지 확인!

$(document).ready(function () {
  $("#toggleButton").click(function () {
    $(this).toggleClass("active");
    if ($(this).hasClass("active")) {
      $("#footer__ai-name").text("디 💖");
      isChatGPT = false;
      $("#chatbot__content").append(
        '<div class="content__box__container"><div class="chatbot__content__box">안녕하세요! 푸보다 조금 더 똑똑한 세계 최고의 요리사 디 입니다.</div></div>'
      );
      $("#chatbot__content").scrollTop($("#chatbot__content")[0].scrollHeight);
    } else {
      $("#footer__ai-name").text("푸 💖");
      isChatGPT = true;
      $("#chatbot__content").append(
        '<div class="content__box__container"><div class="chatbot__content__box">안녕하세요! 세계 최고의 요리사 푸 입니다.</div></div>'
      );
      $("#chatbot__content").scrollTop($("#chatbot__content")[0].scrollHeight);
    }
  });
});
/* 챗봇 토글 - End */


/****************************** 챗봇 대화 기능 - Begin ******************************/
let isWaitingResponse = false; // AI 답변 대기 중인지 여부
let initMessage = "안녕하세요! 세계 최고의 요리사 푸 입니다."; // 챗봇의 첫 메시지


/* 채팅 'ENTER' 키 입력 이벤트 - Begin */
$("#input__container__type").keydown(function (event) {
  if (event.key === "Enter") {
    event.preventDefault();
    startChat();
  }
});
/* 채팅 'ENTER' 키 입력 이벤트 - End */


/* 정지 버튼 - Begin */
function stopChat() {
  if (isWaitingResponse) {
    console.log("Chat 요청을 취소합니다.");
    if (currentAjaxRequest) {
      currentAjaxRequest.abort(); // AJAX 요청 취소
      currentAjaxRequest = null;
    }
    if (abortController) {
      abortController.abort(); // Fetch 요청 취소
      abortController = null;
    }
    $("#input__container__send-btn").show();
    $("#input__container__stop-btn").hide(); // STOP 버튼 숨김
    $("#chatbot__content").find(".chatbot__content__box--waiting").remove();
    isWaitingResponse = false;
  }
}
/* 정지 버튼 - End */


// 초기에 STOP 버튼 숨기기
$("#input__container__stop-btn").hide();


// 컴퓨터가 첫 환영 메시지 출력
$("#chatbot__content").append(
  '<div class="content__box__container"><div class="chatbot__content__box">' + initMessage + '</div></div>'
);


/* 사용자가 메시지를 입력하고 보내는 함수 - Begin */
function startChat() {
  var userInput = $("#input__container__type").val().trim();

  if (userInput !== "") {
    chat(userInput, true);
    $("#input__container__type").val("");
  }
}
/* 사용자가 메시지를 입력하고 보내는 함수 - End */


/* 새로운 대화 메시지를 화면에 추가하는 함수 - Begin */
function chat(message, isUserChat) {
  var chatbotContent = $("#chatbot__content");
  var whoChatClass = isUserChat ? " chatbot__content__my-box" : "";
  var chatElement = $(
    '<div class="content__box__container"><div class="chatbot__content__box' +
      whoChatClass +
      '">' +
      linkifyText(message) +
      "</div></div>"
  );

  // 대화 메시지를 화면에 띄우기 전에 이전의 'AI 답변 중...' 메시지 삭제
  if (!isUserChat) {
    $("#chatbot__content").find(".chatbot__content__box--waiting").remove();
  }

  // 대화 메시지를 화면에 띄우기
  chatbotContent.append(chatElement);

  // 사용자의 메시지라면 대화 메시지를 서버로 보내기
  if (isUserChat) {
    if (isChatGPT) {
      // ChatGPT API 이용
      sendChatToServer(message);
    } else {
      // Chatbase API 이용
      receiveChatbaseAPI(message);
    }
  }

  // 새로운 메시지가 추가되면 스크롤을 맨 아래로 이동
  chatbotContent.scrollTop(chatbotContent.prop("scrollHeight"));
}
/* 새로운 대화 메시지를 화면에 추가하는 함수 - End */


/* ChatGPT API 사용 - Begin */
// sendChatToServer(message) : 실제 사용자의 메시지를 서버로 보내고 답변을 받아오는 함수
let currentAjaxRequest = null; // 현재 진행 중인 AJAX 요청

function sendChatToServer(message) {
  // 현재 진행 중인 AJAX 요청을 저장
  if (currentAjaxRequest) {
    // abort()는 AJAX 요청을 취소하는 JavaScript의 메서드
    currentAjaxRequest.abort(); // 이전 요청 취소
  }

  currentAjaxRequest = $.ajax({
    type: "POST",
    url: "/chatbot/hit-openai-api", // 서버의 컨트롤러 매핑 URL
    contentType: "application/json; charset=UTF-8",
    data: JSON.stringify(message),
    beforeSend: function () {
      // AI가 답변 중임을 표시하는 메시지 추가
      $("#chatbot__content").append(
        '<div class="content__box__container"><div class="chatbot__content__box chatbot__content__box--waiting">AI가 답변 중...</div></div>'
      );
      $("#input__container__send-btn").hide();
      $("#input__container__stop-btn").show(); // STOP 버튼 표시
      isWaitingResponse = true;
    },
    success: function (response) {
      console.log("서버에서 응답 받음:");
      chat(response, false);
    },
    error: function (error) {
      console.error("Error sending data: ", error);
    },
    complete: function () {
      // AI 답변 완료 후 대기 메시지 삭제
      $("#chatbot__content").find(".chatbot__content__box--waiting").remove();
      $("#input__container__send-btn").show();
      $("#input__container__stop-btn").hide(); // STOP 버튼 숨김
      isWaitingResponse = false;
    },
  });
}
/* ChatGPT API 사용 - End */


/* Chatbase API 사용 - Begin */
// receiveChatbaseAPI(message) : 실제 사용자의 메시지를 서버로 보내고 답변을 받아오는 함수
let abortController = null; // Fetch 요청 취소용 컨트롤러
 
async function receiveChatbaseAPI(message) {
  if (abortController) {
    abortController.abort(); // 이전 요청 취소
  }
  abortController = new AbortController();

  // 'SEND' 버튼을 가리고 'STOP' 버튼을 표시하며 AI가 답변 중임을 표시하는 메시지 추가
  $("#input__container__send-btn").hide();
  $("#input__container__stop-btn").show();
  $("#chatbot__content").append(
    '<div class="content__box__container"><div class="chatbot__content__box chatbot__content__box--waiting">AI가 답변 중...</div></div>'
  );
  isWaitingResponse = true;

  try {
    const response = await fetch("https://www.chatbase.co/api/v1/chat", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Bearer fecd40cf-4e01-469f-a7c8-ffbeae578d53",
      },
      body: JSON.stringify({
        messages: [
          {
            content: message,
            role: "user",
          },
        ],
        chatbotId: "NfqOA3dRdfUfWcAiPIkof",
        stream: false,
        model: "gpt-4o",
        temperature: 0,
      }),
      signal: abortController.signal,
    });

    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(errorData.message);
    }

    const data = await response.json();
    console.log("-Chatbase에서 보낸 데이터-");
    console.log(data);

    // chat 함수 호출
    chat(data.text, false);
  } catch (error) {
    if (error.name === "AbortError") {
      console.log("Chat 요청이 취소되었습니다.");
    } else {
      console.error("Error in receiveChatbaseAPI:", error);
      // 오류 처리 필요
    }
  } finally {
    // AI 답변 완료 후 대기 메시지 삭제
    $("#chatbot__content").find(".chatbot__content__box--waiting").remove();
    $("#input__container__send-btn").show();
    $("#input__container__stop-btn").hide(); // STOP 버튼 숨김
    isWaitingResponse = false;
    abortController = null;
  }
}
/* Chatbase API 사용 - End */


/* 챗봇 메시지 안에 주소가 있으면 링크 상태로 변환 - Begin */
function linkifyText(message) {
  const urlPattern =
    /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/gi;
  return message.replace(urlPattern, function (url) {
    return '<a href="' + url + '" target="_blank">' + url + "</a>";
  });
}
/* 챗봇 메시지 안에 주소가 있으면 링크 상태로 변환 - End */


/****************************** 챗봇 대화 기능 - End ******************************/
