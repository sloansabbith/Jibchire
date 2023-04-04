<%@page import="dto.Feed"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일상공유 메인</title>
	<link rel="stylesheet" type="text/css" href="style/snsRead.css">
</head>
<%  //데이터 작업으로 얻은 객체 가져오기
	Feed feed = (Feed)request.getAttribute("Feed");
    String nowPage = (String)request.getAttribute("page");
    //System.out.println(nowPage); 클래스를 컴파일 할 수 없다는 오류 떠서 잠시 주석처리. 어제처럼 jdk보다 eclipse보다 상위버전이라서 ? 
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

	<section>
		<table>
			<thead>
				<tr><td colspan="3">일단 해시태그 넣어 봄<%= feed.getFeed_hashtag() %><td></tr>
			</thead>
			<tbody>
				<!-- 사진 나오는 공간 -->
				<tr>
					<td><div class="pics"><img src="feedPics/<%= feed.getFeed_pics() %>"></div> </td>
					<td><div class="pics"> gg</div> </td>
					<td><div class="pics"> gg</div> </td>
					
				</tr>
			</tbody>
			<tfoot >
				<tr>
					<td colspan="3">
					<!-- 자기글이면 수정,삭제버튼 -->
						<%
					  		//글의 데이터에서 작성자의 아이디와, 현제 로그인한 사람의 아이디가 동일하면 삭제, 수정버튼 생성
					  	
					   	String id2 = feed.getCust_id(); 
						int num = feed.getFeed_id(); //value값으로 jsp코드가 가면 안되니까
						if(id.equals(id2)){ 
							out.println("<input type='button' value='삭제' onclick='return deleteConfirm()'>"); //삭제버튼 누르면 그 글을 바로 삭제
							out.println("<input type='button' value='수정' onclick='return updateConfirm()'>"); //수정버튼 누르면 그 글의 수정페이지로
							out.println("<input type ='hidden' name ='post_id' id='post_id' value ="+feed.getFeed_id()+">");
							out.println("<input type ='hidden' name ='post_id' id='deleteConfirm' value ="+num+">"); //js에 jsp코드를 쓸 수 없으니까
							//out.println("<input type='button' value='수정' onclick="+"location.href='snsUpdateAction.bo?feed_id="+feed.getFeed_id()+"'>"); //수정버튼 누르면 그 글의 수정페이지로
						}	
						%>
					</td>
				</tr>
			</tfoot>
		</table>
	</section>
	
</div>
<script>
	function deleteConfirm(){
		var fid = document.getElementById("deleteConfirm").value;
		var cnfm = confirm("삭제 하시겠습니까?");

		if(cnfm){
			document.location.href = "snsDeleteAction.bo?feed_id="+fid;
		}else{
			return false;
		}
	}
	function updateConfirm(){
		var fid = document.getElementById("deleteConfirm").value;
		var cnfm = confirm("수정 하시겠습니까?");

		if(cnfm){
			document.location.href = "snsUpdateAction.bo?feed_id="+fid;
		}else{
			return false;
		}
	}
</script>
<!-- datetime으로 저장된 필드 0000-00-00 오전/오후 00:00 형식으로

SELECT
    (CASE
         WHEN INSTR(DATE_FORMAT(CREATE_DATE, '%Y-%m-%d %p %h:%i'), 'PM') > 0
         THEN REPLACE(DATE_FORMAT(CREATE_DATE, '%Y-%m-%d %p %h:%i'), 'PM', '오후')
         ELSE REPLACE(DATE_FORMAT(CREATE_DATE, '%Y-%m-%d %p %h:%i'), 'AM', '오전')    
         END) AS CREATE_DATE
FROM test -->

	
<!-- footer -->
<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>
</html>