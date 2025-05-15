<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/main.css">
</head>
<body>
  	<div class="navbar">
	    <div class="navbar-left">
	      <a href="/">
	      	<img src="/images/logo.png" alt="CaTchFood 로고">
	      </a>
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
  		<a href="noticelist">공지사항</a>
	    <a href="reservation">예약하기</a>
	    <a href="review">리뷰리스트</a>
	    <a href="menulist">메뉴 리스트</a>
	    <a href="menuinsert">메뉴 작성</a>
	    <a href="mybasket">예약 현황</a>
	    <a href="reservationList">예약 리스트(관리자용)</a>
	  </div>
	  
	  
	  <div class="overlay" id="overlay"></div>
	  
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
	
	    document.getElementById('overlay').addEventListener('click', function () {
	      document.getElementById('sidebar').classList.remove('active');
	      document.getElementById('overlay').classList.remove('active');
	    });
	  </script>
</body>
</html>