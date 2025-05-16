<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<jsp:include page="../top.jsp"/>
	
	<c:if test="${not empty error}">
    	<script>
       		alert('${error}');
    	</script>
	</c:if>
	
	<h3>로그인</h3>
	<form name="login" method="post" action="loginSuccess">
		아이디 : <input type="text" name="userId"><br>
		비밀번호 : <input type="password" name="userPasswd"><br>
		<input type="submit" value="로그인">
	</form>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>