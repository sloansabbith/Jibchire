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
		   	<div class="selectBoxList">
		        <!-- selectBox주거환경-->
		        <div class="box">
		            <div class="selectBox2 ">
		            <button class="label">주거환경</button>
		            <ul class="optionList">
		                <li class="optionItem">아파트</li>
		                <li class="optionItem">오피스텔</li>
		                <li class="optionItem">주택</li>
		                <li class="optionItem">빌라</li>
		            </ul>
		            </div>
		        </div>
		        <!-- selectBox방 개수 -->
		        <div class="box">
		            <div class="selectBox2 ">
		            <button class="label">방 개수</button>
		            <ul class="optionList">
		                <li class="optionItem">1개</li>
		                <li class="optionItem">2개</li>
		                <li class="optionItem">3개</li>
		                <li class="optionItem">4개 이상</li>
		            </ul>
		            </div>
		        </div>
		        <!-- selectBox집 평수 -->
		        <div class="box">
		            <div class="selectBox2  ">
		            <button class="label">집 평수</button>
		            <ul class="optionList">
		                <li class="optionItem">5평 이상</li>
		                <li class="optionItem">10평 이상</li>
		                <li class="optionItem">15평 이상</li>
		                <li class="optionItem">20평 이상</li>
		                <li class="optionItem">25평 이상</li>
		                <li class="optionItem">30평 이상</li>
		            </ul>
		            </div>
		        </div>
		        <!-- selectBox집 연식 -->
		        <div class="box">
		            <div class="selectBox2  ">
		            <button class="label">집 연식</button>
		            <ul class="optionList">
		                <li class="optionItem">5년 미만</li>
		                <li class="optionItem">5년 이상</li>
		                <li class="optionItem">10년 이상</li>
		                <li class="optionItem">15년 이상</li>
		                <li class="optionItem">20년 이상</li>
		                <li class="optionItem">25년 이상</li>
		            </ul>
		            </div>
		        </div>
		        <!-- selectBox가족형태 -->
		        <div class="box">
		            <div class="selectBox2  ">
		            <button class="label">가족형태</button>
		            <ul class="optionList">
		                <li class="optionItem">1인가구</li>
		                <li class="optionItem">신혼부부</li>
		                <li class="optionItem">부모님과 함께</li>
		                <li class="optionItem">어린 자녀와 함께</li>
		            </ul>
		            </div>
		        </div>
		        <!-- selectBox스타일 -->
		        <div class="box">
		            <div class="selectBox2  ">
		            <button class="label">스타일</button>
		            <ul class="optionList">
		                <li class="optionItem">미니멀/심플</li>
		                <li class="optionItem">내추럴</li>
		                <li class="optionItem">북유럽</li>
		                <li class="optionItem">빈티지</li>
		                <li class="optionItem">유니크</li>
		                <li class="optionItem">프렌치/플로럴</li>
		                <li class="optionItem">믹스매치</li>
		                <li class="optionItem">한옥</li>
		                <li class="optionItem">오피스겸용</li>
		            </ul>
		            </div>
		        </div>
		        <!-- selectBox스타일 -->
		        <div class="box">
		            <div class="selectBox2  ">
		            <button class="label">스타일</button>
		            <ul class="optionList">
		                <li class="optionItem">미니멀/심플</li>
		                <li class="optionItem">내추럴</li>
		                <li class="optionItem">북유럽</li>
		                <li class="optionItem">빈티지</li>
		                <li class="optionItem">유니크</li>
		                <li class="optionItem">프렌치/플로럴</li>
		                <li class="optionItem">믹스매치</li>
		                <li class="optionItem">한옥</li>
		                <li class="optionItem">오피스겸용</li>
		            </ul>
		            </div>
		        </div>
		        
		    </div>
	  
	    <div id="list">
	    	<ul>
	    		<%  
    			for(int i=0; i<alist.size(); i++){   //한 줄에 세 칸을 넣을	
    			%>
	    		<li>
	    			<a href = "view_read.jsp?post_id=<%= alist.get(i).getPost_id() %>">
		    			<div class="thumbnail"> <img src="postPics/sm_<%= alist.get(i).getPost_pics() %>"></div>
		    			<div class="title"><%=alist.get(i).getPost_title() %>  </div>
		    			<div class="writer"><%=alist.get(i).getCust_id() %> </div>
	    			</a>
	    			<div class="view">조회수 10 북마크 10</div>
	    		</li>
    			<%		
    			
    			}
	    		%>
	    	</ul>
	    </div>
	    <div id="writing">
	    	<!-- selectBox5 -->
	 		<% //로그인한 상태면 글쓰기 버튼 보이게 할 것
				String id2 = (String) session.getAttribute("ID");
				if(!(id2==null)){
			%>
			    <input type="button" value="글쓰기" onclick="location.href='view_write.jsp'">
		    <%  } 	
		    %>
	    </div>

	</div>    
	<!-- footer -->
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>