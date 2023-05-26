<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7c3c7195a7bc32c881f7cd628d1975e&libraries=services"></script>
</head>
<style>
#wrap{width:1080px; margin:0 auto;}
/*위의 제목*/
#info{width: 100%; height: 50px; background-color: beige;}
#infotitle{width:1080px; margin:0 auto; text-align: center;}

/*제목 및 검색창*/
#publicApi>ul{margin-top:10px;}
#publicApi input[type='text']{width: 200px; height: 30pt; padding-left: 0.5em; border: #FFF; border-radius: 15px;
		box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);}
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
<!-- <section id ="info"> -->
<!-- 	<div id = "infotitle"> -->
<!-- 		<img src="img/logo/seoul.jpg" style="height: 50px"> -->
<!-- 		<span> 서울시 인증 정보 검색 </span> -->
<!-- 	</div> -->
<!-- </section> -->
<div id="wrap">
	<section id ="publicApi">
		<ul>
			<li>공구대여소 찾기</li>
			<li><input type="text" id="renttext" placeholder="주소나 상호명을 검색해주세요"></li>
			<li id="searchrent">검색</li>
		</ul>
		<div id="rentMap" style="width: 100%;">
			<ul class="resultset"></ul>
			<div id="rentmap"></div>
		</div>
		<ul>
			<li>시공업체 찾기 </li>
			<li><input type="text" id="repairtext" placeholder="주소나 상호명을 검색해주세요"></li>
			<li id="searchrepair">검색</li>
		</ul>
		<div id="repairMap" style="width: 100%;">
			<ul class="repairset"></ul>
			<div id="repairmap"></div>
		</div>
	</section>
<script>
$(function(){
	
	/* 공구대여소 찾기 */
	$("#searchrent").click(function(){
		var renttext = $("#renttext").val();
		$.ajax({
 			url : "publicapirent.sns?text="+renttext,  
 			dataType : "html",
 			success : function(check){
 				$("#rentMap").html(check);
 			}
 		}); 
	});
	/* 인증업체 찾기 */
	$("#searchrepair").click(function(){
		var repairtext = $("#repairtext").val();
		$.ajax({
 			url : "publicapirepairstore.sns?text="+repairtext,  
 			dataType : "html",
 			success : function(check){
 				$("#repairMap").html(check);
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