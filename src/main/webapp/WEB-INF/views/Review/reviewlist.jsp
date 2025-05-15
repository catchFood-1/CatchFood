<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 리스트</title>
</head>
<body>
	<jsp:include page="../top.jsp"/>

	<h2>리뷰작성</h2>
	<table border="1" width="500">
	    <tr>
			<td colspan="3">
				○리뷰
			</td>
		</tr>
		<c:if test="${empty review}">
	    <tr>
	        <td colspan="3" align="center" style="padding: 20px;">
	            첫 번째 리뷰를 남겨주세요 😊
	        </td>
	    </tr>
		</c:if>
		
	    <c:forEach var="dto" items="${review}" varStatus="status">
	        <tr>
	            <td>
	                ${totalCount - ((currentPage - 1) * 10 + status.index)}
	            </td>
	            <td>${dto.userId}</td>
	            <td>
	                <span style="color: gold;">
	                    <c:forEach var="i" begin="1" end="${dto.reviewStars}">★</c:forEach>
	                </span>
	            </td>
	        </tr>
			<tr>
			    <td colspan="3" align="center">
			        <c:if test="${not empty dto.reviewImage}">
			            <c:forTokens items="${dto.reviewImage}" delims="," var="img">
			                <img src="${img}" width="300px" style="margin: 5px;" onerror="this.style.display='none';"/>
			            </c:forTokens>
			        </c:if>
			    </td>
			</tr>
	        <tr>
	            <td colspan="3">${dto.reviewContent}</td>
	        </tr>
	        <tr>
	            <td colspan="3">${dto.reviewDay.toString().substring(0,10)}</td>
	        </tr>
	         <tr>
	            <td colspan="3">
	            <a href="/reviewdelete?reviewNum=${dto.reviewNum}">리뷰 삭제</a>
	            </td>
	        </tr>
	    </c:forEach>
	</table>
	
	<div>
	    <c:forEach begin="1" end="${totalPage}" var="i">
	        <a href="/review?page=${i}">
	            <c:choose>
	                <c:when test="${i == currentPage}">
	                    <b>[${i}]</b>
	                </c:when>
	                <c:otherwise>
	                    [${i}]
	                </c:otherwise>
	            </c:choose>
	        </a>
	    </c:forEach>
	</div>
	
	<form action="/insert" method="get">
	    <input type="submit" value="리뷰작성하기">
	</form>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>