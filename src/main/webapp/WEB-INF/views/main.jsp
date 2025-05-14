<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CatchFood 메인</title>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      font-family: 'Noto Sans KR', sans-serif;
      background: #f9f9f9;
    }
    .navbar {
      background-color: #ff5a5f;
      color: white;
      padding: 8px 16px;
      font-size: 20px;
      font-weight: bold;
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: relative;
    }
    .navbar-left {
      display: flex;
      align-items: center;
    }
    .navbar-center {
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
      display: flex;
      align-items: center;
    }
/*     .navbar-center img { */
/*       height: 100px; */
/*       margin-left: 10px; */
/*     } */
/*     .navbar-left img { */
/*       height: 100px; */
/*       margin-right: 8px; */
/*     } */
    .right-section {
      display: flex;
      align-items: center;
      gap: 10px;
    }
    .toggle-btn {
      font-size: 22px;
      cursor: pointer;
    }
    .auth-links {
      font-size: 14px;
      display: flex;
      gap: 10px;
    }
    .auth-links a {
      color: white;
      text-decoration: none;
      font-weight: normal;
    }
    .sidebar {
      position: fixed;
      top: 60px;
      right: 0;
      width: 200px;
      height: calc(100% - 60px);
      background-color: #fff;
      box-shadow: -2px 0 5px rgba(0,0,0,0.1);
      overflow-y: auto;
      transition: right 0.3s ease-in-out;
      padding: 20px;
      z-index: 1000;
      display: none;
    }
    .sidebar.active {
      display: block;
    }
    .sidebar a {
      display: block;
      margin: 10px 0;
      color: #333;
      text-decoration: none;
      font-weight: bold;
    }
    .content {
      margin-top: 70px;
      padding: 0 20px;
      max-width: 960px;
      margin-left: auto;
      margin-right: auto;
      overflow-x: hidden;
      box-sizing: border-box;
    }
    .section-title {
      font-size: 22px;
      font-weight: bold;
      margin: 30px 0 10px;
      text-align: center;
    }
    @media (min-width: 1600px) {
      body {
        zoom: 0.9;
      }
    }
    @media (max-width: 768px) {
      .menu-card {
        width: 100% !important;
        margin: 0 auto;
      }
      .content {
        padding: 0 10px;
      }
      .auth-links {
        display: none;
      }
    }
  </style>
</head>
<body>
  <div class="navbar">
    <div class="navbar-left">
      <span><img src="/images/logo7.png" alt="CaTchFood"></span>
    </div>
 
    <div class="right-section">
      <div class="auth-links">
        <a href="login">로그인</a>
        <a href="signup">회원 가입</a>
      </div>
      <div class="toggle-btn" onclick="toggleSidebar()">☰</div>
    </div>
  </div>

  <div class="sidebar" id="sidebar">
    <a href="reservation">예약하기</a>
    <a href="review">리뷰리스트</a>
    <a href="menulist">메뉴 리스트</a>
    <a href="menuinsert">메뉴 작성</a>
    <a href="mybasket">예약 현황</a>
    <a href="reservationList">예약 리스트(관리자용)</a>
  </div>

  <div class="content">
    <div class="section-title"></div>
    <%@ include file="Menu/recommendmenu.jsp" %>
  </div>

  <jsp:include page="footer.jsp"/>

  <script>
    function toggleSidebar() {
      const sidebar = document.getElementById('sidebar');
      sidebar.classList.toggle('active');
    }
  </script>
</body>
</html>
