<%@ page import="dao.CmtHousewarming" %>
<%@ page import="dto.Post_house" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
%>
<%
	CmtHousewarming sl = new CmtHousewarming();
	int pid = Integer.parseInt(request.getParameter("post_id"));
	Post_house po = sl.select_one(pid);
%>

</body>
</html>