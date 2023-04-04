<%@ page import="dao.CmtHousewarming" %>
<%@ page import="dto.Post_house" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 메인화면</title>
		<link rel="stylesheet" type="text/css" href="style/view_board.css">
		<!-- 데이터 처리 기능인 Create(생성), Read(읽기), Update(갱신), Delete(삭제)를 묶어서 일컫는 말이다. -->
	</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/view_board.js"> </script>
<%
request.setCharacterEncoding("utf-8");
%>
<!-- 게시판 메인화면을 위한 전체 데이터 셀렉-->
<%
CmtHousewarming sel = new CmtHousewarming();
	ArrayList<Post_house> alist = sel.select_all(); // 게시글 데이터 모두 불러오기
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
	    <!-- 참고) section style 분류 탭 : jsp:include page="tap_style.jsp" -->    	
    	<!-- 메뉴 분류 탭 주거형태 방 개수, 집 평수, 가족인원수, 집 연식-->
	    <div id="menu">
		    <ul>
		    	<li> <select id="house" name="post_house"> 
		    			<option value = "apart"> 아파트 </option>
		    			<option value = "officetel"> 오피스텔</option>
		    			<option value = "house"> 주택 </option>
		    			<option value = "villa">빌라</option>
		    		 </select></li>
		    	<li> <select id="rooms" name="post_rooms" > </select></li>  
		    	<li> <select id="m2" name="post_m2" > </select></li>
		    	<li> <select id="fam" name="post_fam"> </select></li> <!-- 가족인원수 -->
		    	<li> <select id="houseold" name="post_houseold"></select></li>  
		    	<li> <select id="family" name="post_family"><!-- 가족형태 -->
		    			<option value = "1인가구"> 1인가구 </option>
		    			<option value = "반려동물"> 반려동물 </option>
		    			<option value = "부모님과 함께"> 부모님과 함께 </option>
		    			<option value = "룸메이트"> 룸메이트 </option>
		    			<option value = "자녀와 함께"> 자녀와 함께 </option>
		    		 </select> </li>
		    	<li> <select id="style" name="post_style"> 
		    			<option value = "미니멀/심플"> 미니멀/심플 </option>
		    			<option value = "내추럴"> 내추럴 </option>
		    			<option value = "북유럽"> 북유럽 </option>
		    			<option value = "빈티지"> 빈티지 </option>
		    			<option value = "유니크"> 유니크 </option>
		    			<option value = "프렌치/플로럴"> 프렌치/플로럴 </option>
		    			<option value = "믹스매치"> 믹스매치 </option>
		    			<option value = "한옥"> 한옥 </option>
		    			<option value = "오피스겸용"> 오피스겸용 </option>
		    		 </select></li>
		    	<li>
		    		<% //로그인한 상태면 글쓰기 버튼 보이게 할 것
						String id2 = (String) session.getAttribute("ID");
						if(!(id2==null)){
					%>
	    			    <input type="button" value="글쓰기" onclick="location.href='view_write.jsp'">
    			    <%  } 	
    			    %>
		    	</li>
		    </ul>
	    </div>
	    <div id="list">
	    	<ul>
	    		<%  
    			for(int i=0; i<alist.size(); i++){   //한 줄에 세 칸을 넣을	

    			%>
	    		<li><a href = "view_read.jsp?post_id=<%= alist.get(i).getPost_id() %>">
	    			<div class="thumbnail"> <img src="postPics/sm_<%= alist.get(i).getPost_pics() %>"></div>
	    			<div class="title"><%=alist.get(i).getPost_title() %>  </div>
	    			<div class="writer"><%=alist.get(i).getCust_id() %> </div></a>
	    			<div class="view">조회수 10 북마크 10</div>

	    		</li>
    			<%		
    			
    			}
	    		%>
	    	</ul>
	    </div>

	</div>    
	<!-- footer -->
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>