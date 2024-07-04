/* 재료 개별 장바구니 버튼 (수량 x) */
function ingreCart(ingre_idx) {
  $.ajax({
    url: "cart.do",
    type: "get",
    data: { ingre_idx: ingre_idx },
    success: function (data) {
      if (data == "notLogin") showPopup("로그인을 해주세요.");
      else if (data == "success") showCartPopup("장바구니에 추가되었습니다.");
      else showPopup("장바구니 담기를 실패했습니다.");
    },
    error: function () {
      showPopup("오류 발생");
    },
  });
}

/* 장바구니 버튼 (수량 o) */
function ingreDetailCart(ingre_idx) {
  var quantity = document.getElementById("quantityInput").value;
  $.ajax({
    url: "current-cart.do",
    type: "get",
    data: { ingre_idx: ingre_idx, quantity: quantity },
    success: function (data) {
      if (data == "notLogin") showPopup("로그인을 해주세요.");
      else if (data == "success") showCartPopup("장바구니에 추가되었습니다.");
      else showPopup("장바구니 담기를 실패했습니다.");
    },
    error: function () {
      showPopup("오류 발생");
    },
  });
}

/* 관련 재료 한번에 장바구니 담기 버튼 */
$(document).ready(function () {
  $("#getCheckedValues").click(function () {
    let checkedItems = [];
    $(".check:checked").each(function () {
      checkedItems.push($(this).val());
    });
    $.ajax({
      url: "all-cart.do",
      type: "get",
      traditional: true,
      data: { checkedItems: checkedItems },
      success: function (data) {
        if (data == "notLogin") showPopup("로그인을 해주세요.");
        else if (data == "success") showCartPopup("장바구니에 추가되었습니다.");
        else showPopup("장바구니 담기를 실패했습니다.");
      },
      error: function () {
        showPopup("오류 발생");
      },
    });
  });
});

// 전체 선택/해제 기능
function toggleCheckboxes(source) {
  var checkboxes = document.getElementsByClassName("check");
  for (var i = 0; i < checkboxes.length; i++) {
    if (checkboxes[i] != source) checkboxes[i].checked = source.checked;
  }
}

// 선택 삭제 기능
function deleteSelectedItems() {
  var selectedItems = document.querySelectorAll("#checkEach.check:checked");
  var ingreIdxs = [];
  var memIds = [];

  selectedItems.forEach(function (item) {
    ingreIdxs.push(item.getAttribute("data-ingre-idx")); // 재료 idx
    memIds.push(item.getAttribute("data-mem-id")); // 아이디
  });

  $.ajax({
    type: "get",
    url: "delete-selected-items.do",
    traditional: true,
    data: {
      ingreIdxs: ingreIdxs,
      memIds: memIds,
    },
    success: function (data) {
      showPopup("선택된 항목이 삭제되었습니다");
      popupContainer.remove();
      window.location.reload(); // 현재페이지 새로고침
    },
    error: function () {
      showPopup("삭제 할 항목을 선택해주세요");
    },
  });
}

// 장바구니 수정하기
function updateCart() {
  var cntValues = document.getElementsByName("cntValue"); // 주문 수량
  var cartValues = [];
  var idxValues = document.getElementsByName("idxValue"); // 장바구니 idx
  var basketValues = [];

  for (var i = 0; i < cntValues.length; i++) {
    cartValues.push(cntValues[i].value);
    basketValues.push(idxValues[i].value);
  }

  $.ajax({
    url: "update-cart.do",
    type: "get",
    dataType: "json",
    traditional: true,
    data: { cartValues: cartValues, basketValues: basketValues },
    success: function (data) {
      showPopup("수정되었습니다");
    },
    error: function () {
      console.log("수정실패");
    },
  });
}

// 계속 쇼핑하기
function continueShopping() {
  history.back(); // 이전 페이지로 이동
}

// 아임포트 결제 요청
var payInfo = "";
// user정보 불러오기
var merchant_uid = Math.floor(new Date().getTime() / 1000); // 주문번호
var userSum = parseInt(
  document.querySelector("#member-sum").innerText.replace(/,/g, "")
); // 결제 총액
var userName = document.querySelector("#member-name").value; // 이름
var userPhone = document.querySelector("#member-phone").value; // 연락처
var userEmail = document.querySelector("#member-email").value; // 이메일
var userAddr = document.querySelector("#member-addr").value; // 주소

// 사용자 입력값으로 저장
document.querySelector("#member-name").addEventListener("input", function () {
  userName = this.value;
});

document.querySelector("#member-phone").addEventListener("input", function () {
  userPhone = this.value;
});

document.querySelector("#member-email").addEventListener("input", function () {
  userEmail = this.value;
});

document.querySelector("#member-addr").addEventListener("input", function () {
  userAddr = this.value;
});

// 주문상품 목록 저장
var ingreValues = document.getElementsByName("ingreValue"); // 재료index
var ingreidxValues = [];
var cntValues = document.getElementsByName("cntValue"); // 주문 수량
var countValues = [];

for (var i = 0; i < cntValues.length; i++) {
  countValues.push(cntValues[i].value);
  ingreidxValues.push(ingreValues[i].value);
}
// 결제 요청
function requestPay() {
  event.preventDefault(); // 새로고침 방지
  var checkbox = document.getElementById("acc-or"); // 결제동의 체크 시 결제가능
  var selectedOption = document.querySelector('input[name="pay"]:checked'); // 결제방법 선택

  if (selectedOption) {
    var selectedValue = selectedOption.value;
    if (selectedValue === "card") {
      // 카드결제
      payInfo = "html5_inicis";
    } else if (selectedValue === "kakao") {
      // 카카오페이
      payInfo = "kakaopay";
    } else {
      showPopup("결제 방법을 선택해주세요.");
    }
  }
  if (checkbox.checked) {
    // 결제 동의 시
    IMP.request_pay(
      {
        pg: payInfo,
        pay_method: "card",
        merchant_uid: merchant_uid, // 주문번호
        name: "Foodie",
        amount: userSum, // 결제 총액
        buyer_email: userEmail, // email
        buyer_name: userName, // 이름
        buyer_tel: userPhone, // 연락처
        buyer_addr: userAddr, // 주소
        buyer_postcode: "01181",
      },
      function (rsp) {
        // callback

        //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단
        if (rsp.success) {
          // 주문완료
          $.ajax({
            url: "checkout-success.do",
            type: "get",
            traditional: true,
            data: {
              merchant_uid: rsp.merchant_uid, //주문번호, 주소, 총액
              userAddr: rsp.buyer_addr,
              userSum: rsp.paid_amount,
              ingreidxValues: ingreidxValues, //재료 index, 수량
              countValues: countValues,
            },
            success: function () {
              showIdPopup("주문이 완료되었습니다.", rsp.merchant_uid);
            },
            error: function () {
              console.log("전송실패");
            },
          });
        } else {
          if (!selectedValue) {
            // 결제방법선택 X
            showPopup("결제 방법을 선택해주세요.");
            event.preventDefault();
          } else {
            // 결제 X
            showPopup("결제가 취소되었습니다.");
          }
        }
      }
    );
  } else {
    // 결제 동의 체크 X
    showPopup("결제 동의에 체크해주세요.");
    event.preventDefault();
  }
}
