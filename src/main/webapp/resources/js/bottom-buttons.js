// 하단에 AI 버튼 클릭하면 AI 챗봇 창 열기
document.getElementById('btn_ai').addEventListener('click', function() {
  openChatbot();
});

// 하단에 위로 가기 버튼 클릭하면 화면 위로 올리기
document.getElementById('btn_top').addEventListener('click', function() {
  window.scrollTo({top: 0, behavior: 'smooth'});
});
