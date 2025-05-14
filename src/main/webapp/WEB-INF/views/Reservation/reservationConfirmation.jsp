<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.catchfood.dto.ReservationDto" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인 페이지</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp"/>
	
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
			<td>
				<%
					  List<String> menuName = dto.getMenuName();
					  List<Integer> menuCount = dto.getMenuCount();
					
					  if (menuName != null && menuCount != null) {
					    for (int i = 0; i < menuName.size(); i++) {
					      out.print(menuName.get(i) + " " + menuCount.get(i) + "개");
					      if (i < menuName.size() - 1) {
					        out.print(", ");
					      }
					    }
					  } else {
					    out.print("메뉴 정보가 없습니다.");
					  }
				%>

			</td>
		</tr>
		
		
		    <%
// 			  List<String>menuName = dto.getMenuName();
// 			  List<Integer> menuCount = dto.getMenuCount();
			  List<Integer> menuPrice = dto.getMenuPrice();
			
			  int total = 0;
			  if (menuName != null && menuCount != null && menuPrice != null) {
			    int loopSize = Math.min(menuName.size(), Math.min(menuCount.size(), menuPrice.size()));
			
			    for (int i = 0; i < loopSize; i++) {
			      total += menuCount.get(i) * menuPrice.get(i);
			    }
			  }
			%>
			
		<tr>
		  <th>총 계산하실 금액</th>
		  	<td><%
			      if (menuName != null && menuCount != null && menuPrice != null) {
			        out.print(total + "원");
			      } else {
			        out.print("가격 정보를 불러올 수 없습니다.");
			      }
			    %>
	    	</td>
		</tr>


	</table>
	
	<h3>날짜, 시간, 인원수, 주문내역이 같다면 결제눌러주시면 됩니다.</h3>
	
	<form name="paymentForm" method="post" action="/payment">
		<input type="hidden" name="userId" value="testuser123">
		<input type="hidden" name="reservationDate" value="<%= dto.getReservationDate() %>">
  		<input type="hidden" name="reservationNumber" value="<%= dto.getReservationNumber() %>">
  		<input type="hidden" name="reservationRequest" value="<%= dto.getReservationRequest() %>">
  		
  		<input type="hidden" name="menuNums" value="<%= dto.getMenuNum().toString() %>">
  		<input type="hidden" name="menuCounts" value="<%= dto.getMenuCount().toString() %>">
  		<input type="hidden" name="menuTotals" value="<%= dto.getMenuTotal().toString() %>">
	
		<input type="hidden" name="total" value="<%= total %>">
		<input type="submit" value="결제">
	</form>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>