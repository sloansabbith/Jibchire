<%@page import="dto.Feed_comment"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  //데이터 작업으로 얻은 객체 가져오기
	ArrayList<Feed_comment> commentlist = (ArrayList<Feed_comment>)request.getAttribute("commentlist");
%>
<% 
	for(int j =0; j<commentlist.size(); j++){ 
%> 
	<ul>
		<li class="commentimg"><img src="feedPics/<%=commentlist.get(j).getCust_pic()%>" onerror="this.src='img/sns/reddit-round-line-icon.png'" style="width:24px; height: 24px;"> </li>
		<li class="commentid"><%=commentlist.get(j).getCust_id()%> </li>
		<li class="comnenttxt"><%=commentlist.get(j).getCmt_txt()%> </li>
		<li class="commenttime"><%=commentlist.get(j).getCmt_time()%> </li>
	</ul>
<%  
	}
%>

</body>
</html>