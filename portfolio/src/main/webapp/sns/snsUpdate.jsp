<%@page import="dto.Feed"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일상공유 메인</title>
	<link rel="stylesheet" type="text/css" href="style/snsUpdate.css">
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
	<!-- 사진올리고 글쓰는 공간 -->
	<section>
		<form action="snsWriteAction.sns" method="post" enctype="multipart/form-data">
			<input type="hidden" name="cust_id" value="<%=id%>"><!-- cust_id값에 로그인한 아이디 값넣기 -->
			<table id="work">
				<thead><tr><td colspan=2> <h2>일상공유 글쓰기</h2> </td></tr> </thead>
				<tbody>
					<tr>
						<td> 
							<div>
								<div id="preview"><img id="previewImg" /></div>
								<div id="inputfile"><input type="file" onchange="readImage(this);" name="feed_pics"> </div>
							</div>
						</td>
						<td>
							<div>
								<textarea placeholder="내용을 입력해주세요" name="feed_txt"><%=feed.getFeed_txt()%></textarea>
								<input type="text" placeholder="#ootd" name="feed_hashtag" id="hashtag" value="<%=feed.getFeed_hashtag() %>">
							</div>
						</td>
					</tr>
				</tbody>
				<tfoot> <tr><td colspan=2><input type="submit" value="제출"> </td></tr></tfoot>					
			</table>
		</form>
	</section>
</div>
<!-- footer -->
<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>
</html>