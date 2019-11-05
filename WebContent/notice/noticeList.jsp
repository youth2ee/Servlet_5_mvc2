<%@page import="com.naver.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice list</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style type="text/css">
.div_t {
	width: 70%;
	height: 910px;
	margin: 0 auto;
	background-color: rgb(240, 240, 240);
}

.t {
	width: 100%;
	margin: 0 auto;
	text-align: center;
	font-size: 13px;
	border-bottom: 5px rgb(240, 240, 240) solid;
	border-spacing: 0px;
	border-collapse: collapse;
}

.notice {
	height: 70px;
	font-size: 30px;
	background-color: rgb(240, 240, 240);
}

.black {
	font-weight: bold;
	height: 50px;
	background-color: #252525;
	text-align: center;
	color: white;
}

.b1 {
	width: 10%;
}

.b2 {
	text-align: left;
	border-bottom: 5px rgb(240, 240, 240) solid;
}

.b3 {
	height: 50px;
	background-color: white;
	border-bottom: 5px rgb(240, 240, 240) solid;
}

.b4 {
	text-align: left;
	font-weight: bold;
}

.a {
	color: black;
	text-decoration: none;
}
</style>

</head>
<body>

	<section style="background-color: rgb(240, 240, 240); height: auto; padding-bottom: 20px;">
		<div class="div_t">
			<table class="t">
				<thead>
					<tr class="notice">
						<td colspan="5">NOTICE</td>
					</tr>

					<tr class="black">
						<td class="b1">NO</td>
						<td>TITLE</td>
						<td class="b1">WRITER</td>
						<td class="b1">DATE</td>
						<td class="b1">HIT</td>
					</tr>
				</thead>

				<tbody>
				<!-- 자바의 향상된 for문과 유사 / 개수만큼 알아서 돌려준다. -->
				<c:forEach items="${requestScope.list}" var="dto">
					<tr class="b3">
						<td>${pageScope.dto.num}</td>
						<td class="b4"><a class="a" href="./noticeSelect.notice?num=${pageScope.dto.num}">${pageScope.dto.title}</a></td>
						<td>${pageScope.dto.writer}</td>
						<td>${pageScope.dto.reg_date}</td>
						<td>${pageScope.dto.hit}</td>
					</tr>
				</c:forEach>

				</tbody>
			</table>
			
			<div>
				<c:forEach begin="1" end="10" step="2" var="i">
					${pageScope.i}
				</c:forEach>
			</div>
			
			<!-- 로그인 한 사람만 작성버튼 보기 : session에 memberDTO가 들어있다고 가정하고 한다. -->
			<c:if test="${not empty sessionScope.member}"> 
				<a href="./noticeWrite.notice">write</a>
			</c:if>
			
			<c:choose>
				<c:when test=""></c:when>
				<c:when test=""></c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
			

		</div>
	</section>
</body>
</html>