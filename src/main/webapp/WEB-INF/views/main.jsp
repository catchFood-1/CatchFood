<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" href="/css/recommendmenu.css">
	<h1>메인페이지</h1>
	<a href="">로그인</a><br>
	<a href="">회원 가입</a><p>
	<a href="reservation">예약하기</a><br>
	<a href="review">리뷰리스트</a><br>
	<a href="menulist">메뉴 리스트</a><br>
	<a href="menuinsert">메뉴 작성</a><br>
	<a href="mybasket">예약 현황</a><br>

	
	<a href="reservationList">예약 리스트(관리자용)</a><br>
	
	<%@ include file="Menu/recommendmenu.jsp" %>
	<hr>
   <jsp:include page="footer.jsp"/>
</body>
</html>