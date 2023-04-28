<%@ page import="dao.CmtHousewarming" %>
<%@ page import="dto.Post_house" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 읽기</title>
	<link rel="stylesheet" type="text/css" href="style/view_read.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/view_read.js"> </script>
<%
 request.setCharacterEncoding("utf-8");
%>
<%
	Post_house po = (Post_house)request.getAttribute("post");
%>
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
	<%
		}
	%>
	</header>
		<div id="wrap">

			<%
			String savePath = "/community/communityPic";
			ServletContext context = getServletContext();
			String sDownloadPath = context.getRealPath(savePath);
			String sFilePath = sDownloadPath + "\\" + po.getPost_pics();
			//out.println("<section id='mainpic'><img src='"+sFilePath+"'> </section>");
			//out.println(sFilePath);
			%>
			<!-- 사진 슬라이더 -->
			<div class="postPics">
				 <img src="postPics/<%=po.getPost_pics() %>" id="mainpicimg">
			</div>

		   	<div id="title"> 
		   		<h1><%=po.getPost_title() %></h1>
		   		<!-- //현재 session에서 저장된 ID값과 db에서 가져온 id 값이 일치한다면 버튼생성 -->
		   		<%
		   		//글의 데이터에서 작성자의 아이디와, 현제 로그인한 사람의 아이디가 동일하면 삭제, 수정버튼 생성
			   	String id2 = po.getCust_id();
				if(!(id==null) && id.equals(id2)){ 
					out.println("<input type='button' value='삭제' onclick="+"location.href='delete_write.jsp?post_id="+po.getPost_id()+"'>"); //삭제버튼 누르면 그 글을 바로 삭제
					out.println("<input type='button' value='수정' onclick="+"location.href='view_update.jsp?post_id="+po.getPost_id()+"'>"); //수정버튼 누르면 그 글의 수정페이지로
					out.println("<input type = 'hidden' name ='post_id' id='post_id' value = "+po.getPost_id()+">");
				}	
				%>   	
		   	</div>	
			<!-- 세부내용박스(집특징, 평수 등등) -->	   	
		   	<div id="info">
		   		<table>
		   			<tr><td>주거형태</td>
		   				<td><%=po.getPost_house()%> </td>
		   				<td>방개수</td>
		   				<td><%=po.getPost_rooms()%>개</td>
		   				<td>집 평수</td>
		   				<td><%=po.getPost_m2()%>평</td>
		   			</tr>
		   			<tr>	
		   				<td>집 연식</td>
		   				<td><%=po.getPost_houseold()%>년 이상</td>
		   				<td>가족 인원<</td>
		   				<td><%=po.getPost_fam()%>명</td>
		   				<td>가족 형태</td>
		   				<td><%=po.getPost_family()%></td>
		   			</tr>
<!-- 		   			<tr> 스타일, 색상 빠졌음--> 
<!-- 		   				<td>가족 인원</td> -->
<%-- 		   				<td><%=po.getPost_fam()%>명</td> --%>
<!-- 		   				<td>가족형태</td> -->
<%-- 		   				<td><%=po.getPost_family()%></td> --%>
<!-- 		   				<td>반려동물</td> -->
<%-- 		   				<td><%=po.getPost_pet()%></td> --%>
<!--    					</tr> -->
<!--    					<tr> -->
<!-- 		   				<td>지역</td> -->
<%-- 		   				<td><%=po.getPost_region()%></td> --%>
<!-- 		   				<td>예산</td> -->
<%-- 		   				<td><%=po.getPost_budget()%>만원</td> --%>
<!-- 		   				<td></td> -->
<!-- 		   				<td></td> -->
<!--    					</tr> -->
<!--    					<tr> -->
<!-- 		   				<td>공사시작일</td> -->
<%-- 		   				<td><%=po.getPost_startdate()%></td> --%>
<!-- 		   				<td>공사마감일</td> -->
<%-- 		   				<td><%=po.getPost_enddate()%></td> --%>
<!-- 		   				<td></td> -->
<!-- 		   				<td></td> -->
<!-- 		   			</tr> -->
		   		</table>
					
			</div >
			<!-- 내용 -->
			<div class="content">
		   		<pre>
		   			<%=po.getPost_txt()%>
		   		</pre>
    		</div>
    		<div class="postPics">
				 <div class="pics"> <img src="postPics/<%=po.getPost_pic2() %>" style="width:600px; height: auto;"> </div>
				 <div class="postItem">
				 	<ul class="itemthumbnailinfo">
				 		<li> <div class="postIteminfos"> </div> </li>
				 		<li> <div class="postIteminfos"> </div> </li>
				 		<li> <div class="postIteminfos"> </div> </li>
				 		<li> <div class="postIteminfos"> </div> </li>
				 	</ul>
				 	<!-- 큰 사진에 대한 상품 사진 넣는 공간 -->
				 	<ul class="itemthumbnail">
				 		<li><img src="postPics/<%=po.getPost_item10()%>" style="width:120px; height: 120px;"> 
				 			<input type="hidden" value="<%=po.getPost_item10()%>"></li>
				 		<li><img src="postPics/<%=po.getPost_item11()%>" style="width:120px; height: 120px;"> 
				 			<input type="hidden" value="<%=po.getPost_item11()%>"></li>
				 		<li><img src="postPics/<%=po.getPost_item12()%>" style="width:120px; height: 120px;"> 
				 			<input type="hidden" value="<%=po.getPost_item12()%>"></li>
				 		<li><img src="postPics/<%=po.getPost_item13()%>" style="width:120px; height: 120px;"> 
				 			<input type="hidden" value="<%=po.getPost_item13()%>"></li>
				 	</ul>
				 </div> 			
			</div>
			<pre>
    			<%=po.getPost_txt2()%>
    		</pre>
    		<div class="postPics">
				 <div class="pics"> <img src="postPics/<%=po.getPost_pic3() %>"style="width:600px; height: auto;"> </div>
				 <div class="postItem">
				 	<ul class="itemthumbnailinfo">
				 		<li> <div class="postIteminfos"> </div> </li>
				 		<li> <div class="postIteminfos"> </div> </li>
				 		<li> <div class="postIteminfos"> </div> </li>
				 		<li> <div class="postIteminfos"> </div> </li>
				 	</ul>
				 	<!-- 큰 사진에 대한 상품 사진 넣는 공간 -->
				 	<ul class="itemthumbnail">
				 		<li><img src="postPics/<%=po.getPost_item10()%>" style="width:120px; height: 120px;"> 
				 			<input type="hidden" value="<%=po.getPost_item10()%>"></li>
				 		<li><img src="postPics/<%=po.getPost_item11()%>" style="width:120px; height: 120px;"> 
				 			<input type="hidden" value="<%=po.getPost_item11()%>"></li>
				 		<li><img src="postPics/<%=po.getPost_item12()%>" style="width:120px; height: 120px;"> 
				 			<input type="hidden" value="<%=po.getPost_item12()%>"></li>
				 		<li><img src="postPics/<%=po.getPost_item13()%>" style="width:120px; height: 120px;"> 
				 			<input type="hidden" value="<%=po.getPost_item13()%>"></li>
				 	</ul>
				 	
				 </div> 
			</div>
			
			<pre>
    			<%=po.getPost_txt3()%>
    		</pre>
    		<div class="postPics">
				 <div class="pics"> <img src="postPics/<%=po.getPost_pic4() %>" > </div>
			</div>
			<pre>
    			<%=po.getPost_txt4() %>
    		</pre>
		</div>
	<!-- footer -->
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
<script>
$(function(){
	$(".postIteminfos").hide();
	$(".itemthumbnail > li:first-child").mouseover(function(){
		var picName = $(".itemthumbnail > li:first-child >input[type=hidden]").val();
		$.ajax({
			url : "select_product.jsp?picture="+picName,  
			dataType : "html",
			success : function(check){
				$(".itemthumbnailinfo > li:first-child > div").html(check);
			}
		}); 
		$(".itemthumbnailinfo > li:first-child > div").show();
	});
	$(".itemthumbnail > li:nth-child(2)").mouseover(function(){
		var picName = $(".itemthumbnail > li:nth-child(2) >input[type=hidden]").val();
		$.ajax({
			url : "select_product.jsp?picture="+picName,  
			dataType : "html",
			success : function(check){
				$(".itemthumbnailinfo > li:nth-child(2)> div").html(check);
			}
		}); 
		$(".itemthumbnailinfo > li:nth-child(2) > div").show();
	});
	$(".itemthumbnail > li:nth-child(3)").mouseover(function(){
		var picName = $(".itemthumbnail > li:nth-child(3) >input[type=hidden]").val();
		$.ajax({
			url : "select_product.jsp?picture="+picName,  
			dataType : "html",
			success : function(check){
				$(".itemthumbnailinfo > li:nth-child(3)> div").html(check);
			}
		}); 
		$(".itemthumbnailinfo > li:nth-child(3) > div").show();
	});
	$(".itemthumbnail > li:nth-child(4)").mouseover(function(){
		var picName = $(".itemthumbnail > li:nth-child(4) >input[type=hidden]").val();
		$.ajax({
			url : "select_product.jsp?picture="+picName,  
			dataType : "html",
			success : function(check){
				$(".itemthumbnailinfo > li:nth-child(4)> div").html(check);
			}
		}); 
		$(".itemthumbnailinfo > li:nth-child(4) > div").show();
	});
	
	$(".itemthumbnail > li ").mouseout(function(){
		$(".postIteminfos").hide();
	});
});
</script>
</body>
</html>