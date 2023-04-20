<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% String category = "home"; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="style/gosumach.css">
<title>고수매칭</title>
</head>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<%
String cust_id = request.getParameter("cust_id");
String cust_pw = request.getParameter("cust_pw");
//session.setAttribute("cust_id",cust_id);
//session.setAttribute("cust_pw",cust_pw);
%>
<%
// 이미지 파일이 저장된 경로를 가져옵니다.
String imagePath = request.getServletContext().getRealPath("/image");

// 이미지 파일의 URL을 생성합니다.
String imageUrl = request.getContextPath() + "/image/";

%>
<!-- 탑 버튼 -->
<script>
$(window).scroll(function(){
	if ($(this).scrollTop() > 300){
		$('.btn_gotop').show();
	} else{
		$('.btn_gotop').hide();
	}
});
$('.btn_gotop').click(function(){
	$('html, body').animate({scrollTop:0},400);
	return false;
});
</script>
<body>
	<div class="wrap">
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




		<section class="section">
			<article>
				<!-- 고수 검색부분 -->
				<div class="servimg">
					<div class="servtext">
						<h2>
							어떤 서비스를 찾고 계신가요?<br> 고수들을 만나 견적을 요청해보세요.
							<div>
								<input type="textarea" name="gosuserch"
									placeholder="어떤 고수를 찾으시나요?"> <input type="button"
									name="gosuserch" value="서비스검색">
							</div>
						</h2>
					</div>
				</div>
			</article>


			<article>
				<!-- 카테고리별 선택 -->
				<div class="gosucate">
					<a href="#"><div class="cate1">
							<li>레슨</li>
						</div></a> <a href="#"><div class="cate2">
							<li>홈/리빙</li>
						</div>
						<a> <a href="#"><div class="cate3">
									<li>이벤트</li>
								</div></a> <a href="#"><div class="cate4">
									<li>비즈니스</li>
								</div></a> <a href="#"><div class="cate5">
									<li>디자인/개발</li>
								</div></a> <a href="#"><div class="cate6">
									<li>건강/미용</li>
								</div></a> <a href="#"><div class="cate7">
									<li>알바</li>
								</div></a> <a href="#"><div class="cate8">
									<li>기타</li>
								</div></a>
				</div>

			</article>


			<article>
				<!-- 인기서비스 카테고리 영역 -->
				<div class="bestcate">
					<div class="gosust">
						<h2>인기 서비스</h2>
					</div>


					<div class="boxlist">

						<div class="boxtitle">
							<a href="bachi_match.bc?category=aircon-sigong"><div class="bestcateimg1"></div></a>
							<div class="box2">
								<li><strong><a
										href="bachi_match.bc?category=aircon-sigong">에어컨 시공 및 설치</a></strong></li>
							</div>

						</div>
						<div class="boxtitle">
							<a href="bachi_match.bc?category=job-conserting"><div class="bestcateimg2"></div></a>

							<div class="box2">
								<li><strong><a
										href="bachi_match.bc?category=job-conserting">취업 컨설팅</a></strong></li>

							</div>
						</div>
						<div class="boxtitle">
							<a href="bachi_match.bc?category=math-lesson"><div class="bestcateimg3"></div></a>
							<div class="box2">
								<li><strong><a href="bachi_match.bc?category=math-lesson">수학과외</a></strong></li>
							</div>
						</div>

						<div class="boxtitle">
							<div class="bestcateimg4"></div>
							<div class="box2">
								<li><strong>도배시공</strong></li>
							</div>
						</div>

						<div class="boxtitle">
							<div class="bestcateimg5"></div>
							<div class="box2">
								<li><strong>음악과외</strong></li>
							</div>
						</div>

						<div class="boxtitle">
							<div class="bestcateimg6"></div>
							<div class="box2">
								<li><strong>PT트레이닝</strong></li>
							</div>
						</div>



						<div class="boxtitle">
							<div class="bestcateimg7"></div>
							<div class="box2">
								<li><strong>화물/운반</strong></li>
							</div>
						</div>
						<div class="boxtitle">
							<div class="bestcateimg8"></div>

							<div class="box2">
								<li><strong>인테리어/시공</strong></li>

							</div>
						</div>
						<div class="boxtitle">
							<div class="bestcateimg9"></div>
							<div class="box2">
								<li><strong>메이크업</strong></li>
							</div>
						</div>

					</div>
			</article>
		</section>

		<!-- 상단으로 이동하기 버튼 -->
		<a href="#" class="btn_gotop"> <span
			class="glyphicon glyphicon-chevron-up">^ </span>
		</a>

		<div style="margin-left: auto; margin-right: auto;">
			<jsp:include page="footer.jsp" />
		</div>
	</div>




</body>
</html>