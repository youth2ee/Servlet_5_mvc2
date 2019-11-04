<%@page import="com.naver.notice.NoticeDTO"%>
<%@page import="com.naver.notice.NoticeDAO"%>
<%@page import="com.naver.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.naver.point.PointDAO"%>
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

	if (noticeDTO == null) {
		response.sendRedirect("./noticeList.jsp");
	} else {
		request.setAttribute("dto", noticeDTO);

		RequestDispatcher view = request.getRequestDispatcher("./noticeSelectResult.jsp");
		view.forward(request, response);
	}
%>