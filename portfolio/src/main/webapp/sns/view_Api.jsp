<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#wrap{width:900px; margin:0 auto;}
</style>
<body>
<!-- header -->
<header>
<% 
	request.setCharacterEncoding("utf-8"); 
	String id = (String) session.getAttribute("ID");  //session값에서 아이디 가져올 때 null이면 일반헤더, 아니면 로그인헤더
	if((id==null)){
%>
	<jsp:include page="header.jsp" />
<%
	}else{
		
%>
	<jsp:include page="header_login.jsp" />
	<input type="hidden" name="cust_id" value="<%=id%>">
<%
	}
%>
</header>
<div id="wrap">
	<section id ="rent">
		<ul>
			<li><input type="text" id="text"></li>
			<li id="search">검색</li>
		</ul>
		<div class="result" style="width: 100%"></div>
	</section>
<script>
$(function(){
	$("#search").click(function(){
		var text = $("#text").val();
// 		alert(text);
		$.ajax({
 			url : "publicapi.sns?text="+text,  
 			dataType : "html",
 			success : function(check){
 				$(".result").html(check);
//  				alert(check);
 			}
 		}); 
	});
});
</script>
<%
// 	JSONArray array = (JSONArray) request.getAttribute("array");
// 	for(int i=0; i<array.size(); i++){

// 	    //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
// 	    JSONObject object = (JSONObject) array.get(i);
	    
// 	    if(object.get("CENTER_ADDRES").toString().contains("동대문구")){
// 		    //JSON name으로 추출
// 	   	    out.println("row_"+i+" ===========================================");
// 		    out.println("<br>");
// 		    out.println("CENTER_NAME ==> "+object.get("CENTER_NAME"));
// 		    out.println("<br>");
// 		    out.println("CENTER_ADDRES ==> "+object.get("CENTER_ADDRES"));
// 		    out.println("<br>");
// 		    out.println("CENTER_TEL_NO ==> "+object.get("CENTER_TEL_NO"));
// 		    out.println("<br>");
// 	    }
// 	}
%>
</div>
<!-- footer -->
<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>
</html>