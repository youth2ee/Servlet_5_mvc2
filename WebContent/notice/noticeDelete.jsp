<%@page import="com.naver.member.MemberDTO"%>
<%@page import="com.naver.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.naver.notice.NoticeDAO"%>
<%@page import="com.naver.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));

	NoticeDAO noticeDAO = new NoticeDAO();
	Connection con = DBConnector.getConnection();
	int result = noticeDAO.noticeDelete(con, num);

	con.close();

	String msg = "삭제 실패";

	if (result > 0) {
		msg = "삭제 성공";
		request.setAttribute("msg", msg);
		request.setAttribute("path", "./noticeList.jsp");

		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	} else {
		response.sendRedirect("./noticeList.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice delete</title>
</head>
<body>
</body>
</html>