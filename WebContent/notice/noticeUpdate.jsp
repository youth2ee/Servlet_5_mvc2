<%@page import="com.naver.notice.NoticeDTO"%>
<%@page import="com.naver.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.naver.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice update</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
  
</head>
<body>

	<section style="background-color: rgb(240, 240, 240); height: auto; padding-bottom: 20px; height: 910px;">
		<div class="container">
			<h2>Notice Update</h2>
			<form action="./noticeUpdate.notice" method="post">

				<input type="hidden" name="num" value="${requestScope.dto.num}">

				<div class="form-group">
					<label for="title">Title:</label> 
					<input type="text" name="title" class="form-control" id="title" placeholder="Enter title" value="${requestScope.dto.title}">
				</div>
				
				<div class="form-group">
					<label for="writer">Writer:</label> 
					<input type="text" name="writer" class="form-control" id="writer" value="${requestScope.dto.writer}" readonly="readonly">
				</div>

				<div class="form-group">
					<label for="contents">Contents:</label>
					<textarea rows="20" cols="" name="contents" class="form-control" id="contents" placeholder="Enter contents">${requestScope.dto.contents}</textarea>
				</div>

				<button type="submit" class="btn btn-default">Submit</button>

			</form>
		</div>
	</section>
</body>
</html>