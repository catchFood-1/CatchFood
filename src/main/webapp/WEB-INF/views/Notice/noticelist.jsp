<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항 목록</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/top.jsp"/>

<h2>공지사항</h2>

<c:if test="${not empty sessionScope.userId and sessionScope.role eq 'admin'}">
    <a href="/noticeinsert">
        <button>공지사항 작성</button>
    </a>
</c:if>

	<table border="1" width="800" cellpadding="10" cellspacing="0">
	    <tr>
	        <th>번호</th>
	        <th>제목</th>
	        <th>유형</th>
	        <th>작성일</th>
	        <th>조회수</th>
	        <th>고정</th>
	    </tr>
	    
	    <c:forEach var="notice" items="${noticeList}" varStatus="status">
	        <tr>
	            <td>
	                ${totalCount - ((currentPage - 1) * pageSize) - status.index}
	            </td>
	            <td>
	                <a href="/noticedetail?noticeNum=${notice.noticeNum}">
	                    ${notice.noticeTitle}
	                </a>
	            </td>
	            <td>${notice.noticeType}</td>
	            <td>${notice.noticeDate.toString().substring(0,10)}</td>
	            <td>${notice.noticeViewCount}</td>
	            <td style="text-align:center;">
	                <c:choose>
	                    <c:when test="${notice.noticePinned == 1}">
	                        📌
	                    </c:when>
	                    <c:otherwise>
	                        -
	                    </c:otherwise>
	                </c:choose>
	            </td>
	        </tr>
	    </c:forEach>
	</table>

	<div style="text-align:center; margin-top: 20px;">
	    <c:forEach var="i" begin="1" end="${(totalCount / pageSize) + (totalCount % pageSize == 0 ? 0 : 1)}">
	        <c:choose>
	            <c:when test="${i == currentPage}">
	                <strong style="color: red;">[${i}]</strong>
	            </c:when>
	            <c:otherwise>
	                <a href="/noticelist?page=${i}">[${i}]</a>
	            </c:otherwise>
	        </c:choose>
	    </c:forEach>
	</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>