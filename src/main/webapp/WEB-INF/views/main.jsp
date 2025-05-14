<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<title>CatchFood 메인</title>
  	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
   	<link rel="stylesheet" href="/css/main.css">
</head>
<body>
	<jsp:include page="top.jsp"/>
	
	  <!-- 본문 콘텐츠 -->
	  <div class="content">
	    <%@ include file="Menu/recommendmenu.jsp" %>
	  </div>

  <jsp:include page="footer.jsp"/>
</body>
</html>