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
    .navbar-left img {
      height: 40px;
      margin-right: 8px;
    }
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
    .overlay {
      display: none;
      position: fixed;
      top: 60px;
      left: 0;
      width: 100%;
      height: calc(100% - 60px);
      background: rgba(0, 0, 0, 0.3);
      z-index: 999;
    }
    .overlay.active {
      display: block;
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
  <!-- 상단 네비게이션 -->
  <div class="navbar">
    <div class="navbar-left">
      <img src="/images/log6.png" alt="CaTchFood 로고">
    </div>

    <div class="right-section">
      <div class="auth-links">
        <a href="login">로그인</a>
        <a href="signup">회원 가입</a>
      </div>
      <div class="toggle-btn" onclick="toggleSidebar()">☰</div>
    </div>
  </div>

  <!-- 사이드바 -->
  <div class="sidebar" id="sidebar">
    <a href="reservation">예약하기</a>
    <a href="review">리뷰리스트</a>
    <a href="menulist">메뉴 리스트</a>
    <a href="menuinsert">메뉴 작성</a>
    <a href="mybasket">예약 현황</a>
    <a href="reservationList">예약 리스트(관리자용)</a>
  </div>

  <!-- 오버레이 -->
  <div class="overlay" id="overlay"></div>

  <!-- 본문 콘텐츠 -->
  <div class="content">
    <div class="section-title">사장님 추천메뉴 ⭐</div>
    <%@ include file="Menu/recommendmenu.jsp" %>
  </div>

  <jsp:include page="footer.jsp"/>

  <!-- 사이드바 제어 스크립트 -->
  <script>
    function toggleSidebar() {
      const sidebar = document.getElementById('sidebar');
      const overlay = document.getElementById('overlay');

      const isActive = sidebar.classList.contains('active');

      if (isActive) {
        sidebar.classList.remove('active');
        overlay.classList.remove('active');
      } else {
        sidebar.classList.add('active');
        overlay.classList.add('active');
      }
    }

    // 오버레이 클릭 시 닫기
    document.getElementById('overlay').addEventListener('click', function () {
      document.getElementById('sidebar').classList.remove('active');
      document.getElementById('overlay').classList.remove('active');
    });
  </script>
</body>
</html>