<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> <!-- 값마다 다름 -->
</head>
<style>
.wrap{
margin:0 auto;
}
.data-category{
width: 900px;
    height: 1000px;
    background: border-box;
    display: flex;
    flex-direction: column;
    align-items: center;
    align-content: center;
    border: #d2d2d2 1px solid;
    padding: 2.4375rem;
}
.category{
    display: flex;
    flex-direction: column;
    align-items: center;
    
}
.serv-text{
    font-size: 1.5rem;
    padding-top:20px;
    padding-bottom:20px;
}
.bachi-select-section{
margin: 0;
    display: flex;
    flex-direction: column;
    gap: 10px;
}
.bachi-select-section .answer{
  display: flex;
    border: 0.2rem solid #f2f2f2;
    flex-direction: column;
    width: 790px;
    height: 90px;
    
   
}
.answer-area{
display: flex;
    flex-direction: row;
    height: 100%;
     padding: 10px 20px;
}
.checkbox-text{
display: flex;
flex-direction: row;
align-items: center;
gap: 10px;
}
input[type="checkbox"] {
  width: 30px;
    height: 30px;
}
.text-textarea{
display: flex;

}
</style>
<% String category = request.getParameter("category"); %>
<body>
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
		
		<div><%
		if(category.equals("aircon-sigong")){
			%><img src=""/>이미지<%
			out.println("에어컨 및 시공"); 
			%>
				<div class="category">
				<div class="data-category">
				<jsp:include page="bachi_progressbar.jsp" />
				
				<div class="serv-text">어떤 서비스를 원하시나요?</div>
				
				<ul class="bachi-select-section">
				<li class="answer">
				<div class="answer-area">
				<div class="checkbox-text"><input type="checkbox" value="설치"><div class="text-textarea">설치</div></div>
				</div>
				</li>
				
				
				<li class="answer">
				<div class="answer-area">
				<div class="checkbox-text"><input type="checkbox" value="이전설치"><div class="text-textarea">이전설치</div></div>
				</div>
				</li>
				
					<li class="answer">
				<div class="answer-area">
				<div class="checkbox-text"><input type="checkbox" value="해체/철거"><div class="text-textarea">해체/철거</div></div>
				</div>
				</li>
				
					<li class="answer">
				<div class="answer-area">
				<div class="checkbox-text"><input type="checkbox" value="수리"><div class="text-textarea">수리</div></div>
				</div>
				</li>
				
				<li class="answer">
				<div class="answer-area">
				<div class="checkbox-text"><input type="checkbox" value="수리"><div class="text-textarea">수리</div></div>
				</div>
				</li>
				
				<li class="answer">
				<div class="answer-area">
				<div class="checkbox-text"><input type="checkbox" id="etc" value="기타"><div class="text-textarea">기타</div></div>
				</div>
				</li>
				
				</ul>
				
				
				<input type="button" value="다음" onclick="next()">
				</div>
				
				</div>
				
				
				
				<%
		}
		
		
		
		
		
		
		
		
		
		
		
		
		%></div>
				
		
	
	
	
	
	
	</section>





	    	<div style="margin-left: auto; margin-right: auto;">
	<jsp:include page="footer.jsp" />
	</div>

</div>



</body>
<script type="text/javascript">
$(function(){
	$("#ect").checked()
});

</script>
<script type="text/javascript">
function next() {
	  var progressBar = document.querySelector('.progress-bar');
	  var progressPercent = document.querySelector('.progress-percent');
	  var currentWidth = parseFloat(progressBar.style.width) || 0;
	  var targetWidth = currentWidth + 10;
	  progressBar.style.width = targetWidth + '%';
	  progressPercent.innerHTML = targetWidth + '%';
	}


</script>
</html>