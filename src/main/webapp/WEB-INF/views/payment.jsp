<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 화면</title>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script> <!-- IMP전역 변수생성 -->
</head>
<body>
	결제 방법을 선택하세요.<p>
	<button onclick="requestPay('kakaopay.TC0ONETIME')">카카오페이 결제</button><br>
	<button onclick="requestPay('tosspay.tosstest')">토스페이</button><br>
	<button onclick="requestPay('payco.PARTNERTEST')">페이코</button><br>
	<button onclick="requestPay('html5_inicis')">카드결제 (이니시스)</button>
    <script>
      var IMP = window.IMP;
      IMP.init("imp46514803"); // 가맹점 식별코드

      function requestPay(pgValue) {
        IMP.request_pay({
          pg: pgValue,
          pay_method: "card",
          merchant_uid: "order_" + new Date().getTime(),
          name: "포트원 결제 API 테스트 상품",  //일시적으로 삽입
          amount: 100, //일시적으로 삽입
          buyer_email: "test@test.com", //일시적으로 삽입
          buyer_name: "류지호", //일시적으로 삽입
          buyer_tel: "010-1234-5678", //일시적으로 삽입
          buyer_addr: "부산시 해운대구", //일시적으로 삽입
          buyer_postcode: "12345" //일시적으로 삽입
        }, function (rsp) {
          if (rsp.success) {
            alert("결제 성공!");
            
            // 여기서 백엔드로 imp_uid 넘기기 (예: fetch 또는 form submit)
          } else {
            alert("결제 실패: " + rsp.error_msg);
          }
        });
      }
    </script>
</body>
</html>