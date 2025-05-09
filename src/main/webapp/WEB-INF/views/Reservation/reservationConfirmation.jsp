<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.catchfood.dto.ReservationDto" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인 페이지</title>
</head>
<body>
	<% ReservationDto dto = (ReservationDto)session.getAttribute("tempReservation"); %>

	<h2>예약 임시 확인 단계입니다.</h2>
	<table border="1">
		<tr>
			<th>예약 날짜</th>
			<td><%= dto.getReservationDate() %></td>
		</tr>
		
		<tr>
			<th>예약 인원</th>
			<td><%= dto.getReservationNumber() %></td>
		</tr>
		
		<tr>
			<th>요구 사항</th>
			<td><%= dto.getReservationRequest() %></td>
		</tr>
		
		<tr>
			<th>메뉴</th>
			<td>@김치찌개 1개, @토마토파스타3개</td>
		</tr>
		
		<tr>
			<th>총 가격</th>
			<td>50000</td>
		</tr>
	</table>
	<h3>날짜, 시간, 인원수, 주문내역이 같다면 결제눌러주시면 됩니다.</h3>
	<jsp:include page="../Payment/payment.jsp" />
</body>
</html>