<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="style/gosumach.css">
	<title>고수매칭</title>
</head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<%
String cust_id = "test123"; //request.getParameter("cust_id");
String cust_pw = "test1234"; //requset.getParameter("cust_pw");
session.setAttribute("cust_id",cust_id);
session.setAttribute("cust_pw",cust_pw);
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
				<div class="servtext"><h2>어떤 서비스를 찾고 계신가요?<br>
					고수들을 만나 견적을 요청해보세요.
					<div>
					<input type="textarea" name="gosuserch" placeholder="어떤 고수를 찾으시나요?">
					<input type="button" name="gosuserch" value="서비스검색">
					</div>
				</h2></div>
				</div>
			</article>

			
	<article>
				<!-- 카테고리별 선택 -->
				<div class="gosucate">
					<a href="#"><div class="cate1"><li>레슨</li></div></a>
					<a href="#"><div class="cate2"><li>홈/리빙</li></div><a>
					<a href="#"><div class="cate3"><li>이벤트</li></div></a>
					<a href="#"><div class="cate4"><li>비즈니스</li></div></a>
					<a href="#"><div class="cate5"><li>디자인/개발</li></div></a>
					<a href="#"><div class="cate6"><li>건강/미용</li></div></a>
					<a href="#"><div class="cate7"><li>알바</li></div></a>
					<a href="#"><div class="cate8"><li>기타</li></div></a>
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
				<a href=""><div class="bestcateimg1"></div></a>
					<div class="box2">
				<li><strong><a href="bachi_match_cate.jsp?category=aircon-sigong">에어컨 시공 및 설치</a></strong></li>
				</div>
				
			</div>
				<div class="boxtitle">
				<div class="bestcateimg2"></div>
				
				<div class="box2">
				<li><strong>취업 컨설팅</strong></li>
				
				</div>
			</div>
			<div class="boxtitle">
				<div class="bestcateimg3"></div>
				<div class="box2">
				<li><strong>수학과외</strong></li>
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

			<!-- 위치별 활동지역 고수 찾기 -->
			<article>
				<div class="chloca">
					<div class="locatext">
				<h2>내 위치에서 고수를 직접 찾아보세요.</h2>
				
				<div class="gosuselect">
				<select name="bigtitle" multiple="4" style="font-size: 16pt;">
				<optgroup>
				<option>전체선택</option>
				<option>대분류 카테고리</option>
				</optgroup>
				</select>
					

				<select name="midletitle" multiple="4" style="font-size: 16pt;">
				<optgroup>
				<option>중분류 카테고리</option>
				<option>카테고리1</option>
				</optgroup>
				</select>

				<select name="subitle" multiple="4" style="font-size: 16pt;">
				<optgroup>
				<option>소분류 카테고리</option>
				<option>카테고리1</option>
				<option>카테고리2</option>
				<option>카테고리3</option>
				<option>카테고리4</option>
				<option>카테고리5</option>
				<option>카테고리6</option>
				</optgroup>
				</select>
			</div>
			<!-- 지역 입력 및 검색 창 -->
			<div class="selectad">
				<div class="selectadrees">
					<input type="textarea" name="adreesgosu" placeholder="지역을 입력하세요."  style="border: solid 1px #c2988d;">
					<input type="button" name="adreesgosu"  value="검색">
				</div>
			</div>
			
			
			<div class="adrarea">
				<!-- 지도 API연동 -->
				<div class="adrimg">
					<!-- <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.329278627543!2d127.02688761507552!3d37.50015127981036!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca15857ce38dd%3A0xac87641577138f5d!2z6re466aw7Lu07ZOo7YSw7JWE7Lm0642w66-4IOqwleuCqOy6oO2NvOyKpA!5e0!3m2!1sko!2skr!4v1677087339919!5m2!1sko!2skr" width="500" height="500" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe> --></div>



				<!--지역별 검색되었을때 고수회원-->
				<div class="adbox">

					<div style="border: solid 2px #cfb89c; width: 560px; height:100px; background-color: white; float: left;">
					<div class="gosuimg"><img src="img/gosu/bestgosu1.jpg"></div>
					<div class="nikname"><h4>고수회원 닉네임</h4></div>
					<div class="ad"><li>활동가능지역</li></div>
					<div class="star"><li>★4.8</li></div>
					<div class="miter"><li>반경 n미터</li></div>
					</div>

					<div style="border: solid 2px #cfb89c; width: 560px; height:100px; background-color: white; float: left; margin-left: -1px;">
					<div class="gosuimg"><img src="img/gosu/bestgosu2.jpg"></div>
					<div class="nikname"><h4>고수회원 닉네임</h4></div>
					<div class="ad"><li>활동가능지역</li></div>
					<div class="star"><li>★4.8</li></div>
					<div class="miter"><li>반경 n미터</li></div>
					</div>

						<div style="border: solid 2px #cfb89c; width: 560px; height:100px; background-color: white; float: left; margin-left: -1px;">
					<div class="gosuimg"><img src="img/gosu/bestgosu3.jpg"></div>
					<div class="nikname"><h4>고수회원 닉네임</h4></div>
					<div class="ad"><li>활동가능지역</li></div>
					<div class="star"><li>★4.8</li></div>
					<div class="miter"><li>반경 n미터</li></div>
					</div>

						<div style="border: solid 2px #cfb89c; width: 560px; height:100px; background-color: white; float: left; margin-left: -1px;">
					<div class="gosuimg"><img src="img/gosu/bestserv1.jpg"></div>
					<div class="nikname"><h4>고수회원 닉네임</h4></div>
					<div class="ad"><li>활동가능지역</li></div>
					<div class="star"><li>★4.8</li></div>
					<div class="miter"><li>반경 n미터</li></div>
					</div>

						<div style="border: solid 2px #cfb89c; width: 560px; height:100px; background-color: white; float: left; margin-left: -1px;">
					<div class="gosuimg"><img src="img/gosu/bestserv2.jpg"></div>
					<div class="nikname"><h4>고수회원 닉네임</h4></div>
					<div class="ad"><li>활동가능지역</li></div>
					<div class="star"><li>★4.8</li></div>
					<div class="miter"><li>반경 n미터</li></div>
					</div>


						<div style="border: solid 2px #cfb89c; width: 560px; height:100px; background-color: white; float: left; margin-left: -1px;">
					<div class="gosuimg"><img src="img/gosu/bestserv3.jpg"></div>
					<div class="nikname"><h4>고수회원 닉네임</h4></div>
					<div class="ad"><li>활동가능지역</li></div>
					<div class="star"><li>★4.8</li></div>
					<div class="miter"><li>반경 n미터</li></div>
					</div>

					<!-- 스크롤 빈 영역 존재, 더 없을 경우 문구띄우기 -->
					<span style="line-height: 140px;">해당 지역에서의 고수를 더 찾을 수 없습니다.</span>
			
				</div>
				
				</div>
			</article>


		</section>

		<!-- 상단으로 이동하기 버튼 -->
<a href="#" class="btn_gotop">
  <span class="glyphicon glyphicon-chevron-up">^
  </span>
</a>

<div style="margin-left: auto; margin-right: auto;">
			<jsp:include page="footer.jsp" />
			</div>
	</div>


	

</body>
</html>