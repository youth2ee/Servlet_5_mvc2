<%@page import="com.naver.notice.NoticeDTO"%>
<%@page import="com.naver.point.PointDTO"%>
<%@page import="com.naver.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.naver.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));

	NoticeDAO noticeDAO = new NoticeDAO();
	Connection con = DBConnector.getConnection();

	NoticeDTO noticeDTO = noticeDAO.noticeSelect(con, num);

	con.close();
%>

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
<%@ include file="../layout/nav.jspf" %>

<%
	if(memberDTO == null && !memberDTO.getId().trim().equals(noticeDTO.getWriter().trim())){
		//관리자가 아니므로 바로 인덱스로 보낸다. 
		request.setAttribute("msg", "글 수정 권한이 없습니다.");
		request.setAttribute("path", "../index.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}
%>

	<section style="background-color: rgb(240, 240, 240); height: auto; padding-bottom: 20px; height: 910px;">
		<div class="container">
			<h2>Notice Update</h2>
			<form action="./noticeUpdateResult.jsp" method="post">

				<input type="hidden" name="num" value="<%=noticeDTO.getNum()%>">

				<div class="form-group">
					<label for="title">Title:</label> 
					<input type="text" name="title" class="form-control" id="title" value="<%=noticeDTO.getTitle()%>" placeholder="Enter title">
				</div>

				<div class="form-group">
					<label for="contents">Contents:</label>
					<textarea rows="20" cols="" name="contents" class="form-control" id="contents" placeholder="Enter contents"><%=noticeDTO.getContents()%></textarea>
				</div>

				<button type="submit" class="btn btn-default">Submit</button>

			</form>
		</div>
	</section>
</body>
</html>