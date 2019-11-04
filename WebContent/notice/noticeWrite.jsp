<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice write</title>
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
	if(memberDTO == null || memberDTO.getGrade() != 0){
		//관리자가 아니므로 바로 인덱스로 보낸다. 
		request.setAttribute("msg", "글 작성 권한이 없습니다.");
		request.setAttribute("path", "../index.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}
%>

	<section style="background-color: rgb(240, 240, 240); height: auto; padding-bottom: 20px; height: 910px;">
		<div class="container">
			<h2>Notice Write</h2>

			<form action="./noticeWriteResult.jsp" method="post">

				<div class="form-group">
					<label for="title">Title:</label> 
					<input type="text" name="title" class="form-control" id="title" placeholder="Enter title">
				</div>

				<div class="form-group">
					<label for="writer">Writer:</label>
					<input type="text" name="writer" class="form-control" id="writer" readonly="readonly" value="<%=memberDTO.getId()%> ">
				</div>

				<div class="form-group">
					<label for="contents">Contents:</label>
					<textarea rows="20" cols="" name="contents" class="form-control" id="contents" placeholder="Enter contents"> </textarea>
				</div>

				<button type="submit" class="btn btn-default">Submit</button>

			</form>
		</div>
	</section>
</body>
</html>