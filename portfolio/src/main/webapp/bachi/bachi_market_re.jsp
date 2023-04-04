<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<title>Insert title here</title>
</head>
<%
String cust_id = (String)session.getAttribute("cust_id");
String cust_pw = (String)session.getAttribute("cust_pw");

%>


<style>
.wrap{
	width:1900px;
	margin-left:auto;
	margin-right:auto;
}
.section{width:1280px;height: auto; margin:0 auto;}
.css-lable{
display: flex;
padding-top: 20px;
padding-bottom: 20px;
}
.css-market-title-style{
 width: 70%;
    height: calc(1.5em + 1.5rem);
}
.css-title{
    border-radius: 4px;

    padding: 0.75rem;
    border: 1px solid #e1e1e1;
}
.css-gosu-option{
width:10%;
  height: calc(1.5em + 1.5rem);
}

.option-selected-css{
display: flex;

    padding-bottom: 20px;
        gap: 10px;
   }
.css-gosu-option{
  border-radius: 4px;

    padding: 0.75rem;
    border: 1px solid #e1e1e1;

}   
.file-css{
    display: flex;
    flex-direction: row;
    align-items: center;
    padding-bottom: 20px;
}  
.lable-title{
display: flex;
    padding: 10px 0px 10px 0px;
}
.css-button-his {
    width: 230px;
    height: 70px;
    border: 1px solid lightgray;
    border-radius: 10px;
}
.css-button-re {
    width: 230px;
    height: 70px;
    background-color: #926b61;
    color: white;
    border: none;
    border-radius: 10px;
}
.submit-button{
    display: flex;
    flex-direction: row-reverse;
    justify-content: space-between;
    padding-top: 20px;
}
</style>
<body>
  <!-- 헤더 -->
    <div class="wrap">
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
  
  <section>
 	 <article>
<!-- 상품등록페이지 -->

<form action="bachi_mark_re_send.jsp"  method="post" enctype="multipart/form-data">
<!--  onsubmit="return false;" -->
<div class="section">

	<div class="css-lable"><h2>바치상점 등록</h2></div>

<div class="lable-title">제목</div>
<div class="css-market-title">
<input type="text" name="market_title" placeholder="제목을 입력하세요." class="css-market-title-style css-title">
</div>

<div class="lable-title">상품/카테고리 선택</div>
<div class="option-selected-css">
<select name="gosu_id" id="gosu_id" class="css-gosu-option">
<option value="1">상품옵션1</option>
<option value="2">상품옵션2</option>
</select>
<select name="gosu_menu1" class="css-gosu-option">
	<option value="취미">취미</option>
	<option value="홈/리빙">홈/리빙</option>
 </select>
 <select name="gosu_menu2" class="css-gosu-option">
	<option value="요리">요리</option>
	<option value="인테리어">인테리어</option>
 </select>
</div>
<div class="lable-title">상품 이미지 선택</div>
<div class="file-css">
 <input type="file" id="file-input" name="filename">
<input type="hidden" name="market_picture" id="file-path">
<img id="image-preview">
</div>

<textarea rows="50" cols="160" name="market_text" style="resize: none;" class="css-title"></textarea>

<div class="submit-button">
<input type="submit" value="저장" class="css-button-re">
<input type="button" value="취소" onclick = "location.href ='bachi_market.jsp'" class="css-button-his">
</div>
</div>
</form>
</div>
	</article>
</section>
    <div style="margin-left: auto; margin-right: auto;">
<jsp:include page="footer.jsp" />
</div>
</div>
<script>
$(document).ready(function() {
  // 파일 선택 시 hidden과 img 태그에 파일 경로를 저장하고 이미지를 미리보기합니다.
  $('#file-input').on('change', function() {
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    reader.onload = function(event) {
      //$('#file-path').val("img/test/"+file.name); // 파일 경로를 hidden 태그에 저장합니다.
      $('#image-preview').attr('src', event.target.result); // 미리보기 이미지를 출력합니다.
    };
    reader.readAsDataURL(file); 
  });
});
</script>

</body>

</html>