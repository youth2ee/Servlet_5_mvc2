<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");	
	String path = (String)request.getAttribute("path");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>common result</title>
</head>
<body>

<script type="text/javascript">
	alert('<%=msg%>');
	location.href='<%=path%>';
</script>

</body>
</html>