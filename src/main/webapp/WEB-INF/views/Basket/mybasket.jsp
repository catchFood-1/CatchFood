<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 현황</title>
<head>
  <meta charset="UTF-8">
  <title>예약 현황</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      padding: 20px;
    }

    h2 {
      color: #333;
    }

    .reservation-block {
      margin-bottom: 40px;
      padding: 15px;
      border: 1px solid #ccc;
      border-radius: 8px;
      background-color: #f9f9f9;
    }

    .reservation-block h3 {
      margin: 0 0 10px 0;
      color: #0077cc;
    }

    .reservation-block p {
      margin: 0 0 10px 0;
      font-style: italic;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
    }

    table th, table td {
      border: 1px solid #aaa;
      padding: 8px;
      text-align: center;
    }

    table th {
      background-color: #e0e0e0;
    }
  </style>
</head>
<body>

<h2>${userId}님 예약 현황</h2>

<c:set var="prevReservation" value="-1" />
<c:forEach var="r" items="${myreservation}" varStatus="status">
  <c:if test="${r.reservationNum != prevReservation}">
    <c:if test="${status.index != 0}">
        </table>
    </div>
    </c:if>

    <div class="reservation-block">
      <h3>예약일: ${r.reservationDate} / 인원: ${r.reservationNumber}명</h3>
      <p>요청사항: ${r.reservationRequest}</p>

      <table>
        <tr>
          <th>메뉴</th>
          <th>수량</th>
          <th>금액</th>
        </tr>
  </c:if>

  <tr>
    <td>${r.menuName}</td>
    <td>${r.basketCount}개</td>
    <td>${r.basketPTotal}원</td>
  </tr>

  <c:set var="prevReservation" value="${r.reservationNum}" />
</c:forEach>

</table>
</div> 
<jsp:include page="/WEB-INF/views/Map/map.jsp">
    <jsp:param name="name" value="${r.storeName}" />
    <jsp:param name="lat" value="${r.lat}" />
    <jsp:param name="lng" value="${r.lng}" />
</jsp:include>
</body>

</html>