<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <script src="/JS/check.js"></script>
</head>
<body>
	<jsp:include page="../top.jsp"/>
	<h2>회원가입</h2>
	
    <form name="register" method="post" action="registerProcess">
        ID : <input type="text" name="userId" required><br>
        비밀번호 : <input type="password" name="userPasswd" required><br>
        비밀번호 확인 : <input type="password" name="userPasswd2" required><br>
        이메일 : <input type="text" name="userEmail" required>@
        		<select name="email">
        			<option value="naver.com">naver.com</option>
        			<option value="daum.net">daum.net</option>
        			<option value="nate.com">nate.com</option>
        			<option value="gmail.com">gmail.com</option>
        		</select>
        <br>
        이름 : <input type="text" name="userName" required><br>
        생년월일 : <input type="date" name="userBirth" required><br>
        성별 : 
        <input type="radio" name="userGender" value="남성" required>남성
        <input type="radio" name="userGender" value="여성" required>여성<br>
        전화번호 : <input type="text" name="userPhone" required><br>
        주소 : <input type="text" name="userAddress" id="userAddress" readonly="readonly">
		 	  <input type="button" value="주소검색" onClick="goPopup();"><br>
        상세주소 : <input type="text" name="userAddrdetail"><br> 
        <input type="button" value="회원가입" onclick="check()">
    </form>
    
	<jsp:include page="../footer.jsp"/>	
	</body>
</html>
