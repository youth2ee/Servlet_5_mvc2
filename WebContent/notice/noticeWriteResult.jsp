<%@page import="com.naver.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.naver.notice.NoticeDAO"%>
<%@page import="com.naver.notice.NoticeDTO"%>
<%@page import="com.naver.point.PointDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String contents = request.getParameter("contents");

	NoticeDTO noticeDTO = new NoticeDTO();
	noticeDTO.setTitle(title);
	noticeDTO.setWriter(writer);
	noticeDTO.setContents(contents);

	Connection con = DBConnector.getConnection();
	NoticeDAO noticeDAO = new NoticeDAO();
	int result = noticeDAO.noticeWrite(con, noticeDTO);

	con.close();

	String msg = "등록 실패";

	if (result > 0) {
		msg = "등록 성공";
		response.sendRedirect("./noticeList.jsp");
	} else {
		request.setAttribute("msg", msg);
		request.setAttribute("path", "./noticeList.jsp");

		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice write result</title>
</head>
<body>

</body>
</html>