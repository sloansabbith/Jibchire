<%@page import="dto.Feed_comment"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.commentupdate:hover{cursor: pointer;}
.commentdelete:hover{cursor: pointer;}
</style>
</head>
   <% 
	String id = (String) session.getAttribute("ID");  //로그인한 아이디
	if((id==null)){
	}else{
%>
	<input type="hidden" name="cust_id" value="<%=id%>">
<%
	}
%>
<body>
<%  //데이터 작업으로 얻은 객체 가져오기
	ArrayList<Feed_comment> commentlist = (ArrayList<Feed_comment>)request.getAttribute("commentlist");
	String cust_id = (String)request.getAttribute("cust_id");
	if(commentlist.size()==0){
%>
	<div class="comment">
		<div style="margin: 20px auto; width: 60%;font-weight: 700; font-style: italic;"> 아직 등록된 댓글이 없습니다. </div>
	</div>
<%	
	}else{
		for(int j =0; j<commentlist.size(); j++){ 
%>
	<div class="comments"> 
	<ul id="<%=commentlist.get(j).getFeed_id()%>">
		<li class="commentimg"><img src="feedPics/<%=commentlist.get(j).getCust_pic()%>" onerror="this.src='img/sns/reddit-round-line-icon.png'" style="width:24px; height: 24px;"> </li>
		<li class="commentid"><%=commentlist.get(j).getCust_id()%> </li>
		<li class="comnenttxt"><%=commentlist.get(j).getCmt_txt()%> </li>
		<li class="commenttime"><%=commentlist.get(j).getCmt_time()%> </li>
<%
		if(commentlist.get(j).getCust_id().equals(cust_id)){
%>
		<li class="commentupdate" id="<%=commentlist.get(j).getCmt_id()%>">수정</li>
		<li class="commentdelete" id="<%=commentlist.get(j).getCmt_id()%>">삭제</li>
<%			
		}
%>		
	</ul>
	</div>
<%  
		}
	}
%>
<script>
	$(function(){
		/*댓글 수정 삭제*/
		$(".commentdelete").click(function(){
			var cnfm = confirm("삭제 하시겠습니까?");
			var cmt_id = $(this).attr("id");
			var cust_id = $("input:hidden[name=cust_id]").val();
			var feed_id = $(this).parent().attr("id");
	 		if(cnfm){
	 			//alert(feed_id);
	 			$.ajax({
		            url : "snsDeleteComment.sns?cmt_id="+cmt_id+"&cust_id="+cust_id+"&feed_id="+feed_id,  
		            dataType : "html",
		            //data : "post",
		            success : function(check){
		            	alert(check);
		            	$("div").html(check);
		            	//$(location).prop("href", location.href); //새로고침
		            	
	      	     	}
				});
	 			//document.location.href = "snsDeleteComment.sns?cmt_id="+cmt_id;
	 		}else{
	 			return false;
	 		}
		});
	});
</script>
</body>
</html>