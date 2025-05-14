<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<h2 style="text-align:center;">사장님 추천메뉴 ⭐</h2>
<div class="container">

  <c:forEach var="menu" items="${rec}" varStatus="status">
    <c:if test="${status.index < 3}">
      <div class="menu-card">
        <img src="${menu.menuImage}" alt="${menu.menuName}">
        <h3>${menu.menuName}</h3>
        <p>${menu.menuPrice}원</p>
        <p>${menu.menuDescription}</p>
      </div>
    </c:if>
  </c:forEach>
</div>

<hr>

<h3 style="text-align:center;">다른 추천메뉴 더 보기</h3>
<div class="slider-container">
  <div class="slider-wrapper">
    <c:forEach var="menu" items="${rec}" varStatus="status">
      <c:if test="${status.index >= 3}">
        <div class="menu-card slide-item">
          <img src="${menu.menuImage}" alt="${menu.menuName}">
          <h3>${menu.menuName}</h3>
          <p>${menu.menuPrice}원</p>
          <p>${menu.menuDescription}</p>
        </div>
      </c:if>
    </c:forEach>
  </div>
</div>
