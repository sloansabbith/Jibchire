<%@page import="dto.Pro_post"%>
<%@page import="dao.CmtHousewarming"%>
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
int pro_id = Integer.parseInt(request.getParameter("pro_id"));
CmtHousewarming house = new CmtHousewarming();
Pro_post product =house.selectItem(pro_id);
%>
<div id="selectwrap" style="position: absolute;">
	<img id="selectimg" src="postPics/<%=product.getPro_picture()%>" style="width: 100px;">
	<ul id="selectinfo">
		<li>[<%=product.getPro_menu1()%>]</li>
		<li><%=product.getPro_title()%></li>
		<li><%=product.getPro_company()%></li>
		<li><%=product.getPro_price()%></li>
	
	</ul>
</div>
</body>
</html>