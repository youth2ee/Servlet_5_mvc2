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
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");

	NoticeDTO noticeDTO = new NoticeDTO();

	noticeDTO.setNum(num);
	noticeDTO.setTitle(title);
	noticeDTO.setContents(contents);

	Connection con = DBConnector.getConnection();
	NoticeDAO noticeDAO = new NoticeDAO();
	int result = noticeDAO.noticeUpdate(con, noticeDTO);

	con.close();

	String msg = "수정 실패";

	if (result > 0) {
		msg = "수정 성공";
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
<title>notice update result</title>
</head>
<body>

</body>
</html>