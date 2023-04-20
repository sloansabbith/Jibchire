<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 값마다 다름 -->
</head>
<style>
.wrap {
	margin: 0 auto;
}

.data-category {
	width: 900px;
	height: 780px;
	background: border-box;
	display: flex;
	flex-direction: column;
	align-items: center;
	align-content: center;
	border: #d2d2d2 1px solid;
	padding: 2.4375rem;
}

.category {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.serv-text {
	font-size: 1.5rem;
	padding-top: 20px;
	padding-bottom: 20px;
}

.bachi-select-section {
	margin: 0;
	display: flex;
	flex-direction: column;
	gap: 10px;
	padding-bottom: 90px;
}

.bachi-select-section .answer {
	display: flex;
	border: 0.2rem solid #f2f2f2;
	flex-direction: column;
	width: 790px;
	height: 90px;
}

.answer-area {
	display: flex;
	flex-direction: row;
	height: 100%;
	padding: 10px 20px;
}

.checkbox-text {
	display: flex;
	flex-direction: row;
	align-items: center;
	gap: 10px;
}

input[type="checkbox"] {
	width: 30px;
	height: 30px;
}

.text-textarea {
	display: flex;
	gap: 10px;
	align-items: center;
}

.text-textarea input[type="text"] {
	width: 350px;
	height: 60px;
}

.behind-next {
	display: flex;
	gap: 20px;
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
			<form action="bachi_question.bc" method="post">
			
			<input type="hidden" name="cust_id" value="<%=id %>">
				<div>
	<img src="" />이미지<%
			//out.println("에어컨 및 시공"); 
			%>
			<%
			
			
			//if(category.equals("aircon-sigong")){
			//	out.println("에어컨 설치");
		//	}else if(category.equals("job-conserting")){
			//	out.println("취업 컨설팅");
			//}else if(category.equals("math-lesson")){
			//	out.println("수학 과외");	
			//}
			
			
			%>
							<%
	if(category.equals("aircon-sigong")){
			%>
					<div class="category">

						<div class="data-category">
							<jsp:include page="bachi_progressbar.jsp" />

							<div class="serv-text">어떤 서비스를 원하시나요?</div>
							<input type="hidden" name="gosu_menu1" value="홈">
							<input type="hidden" name="gosu_menu2" value="에어컨설치">
	
	
							<!-- 1번째 질문 -->
							<ul class="bachi-select-section">
								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="serv" value="설치">
											<div class="text-textarea">설치</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="serv" value="이전설치">
											<div class="text-textarea">이전설치</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="serv" value="해체/철거">
											<div class="text-textarea">해체/철거</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="serv" value="수리">
											<div class="text-textarea">수리</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="serv" id="etc" value="기타">
											<div class="text-textarea">
												기타
												<div id="inputFields"></div>
											</div>
										</div>
									</div>
								</li>

							</ul>


							<!-- 2번째 질문 -->
							<ul class="bachi-select-section">
								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="radio" name="place" value="가정집">
											<div class="text-textarea">가정집</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="radio" name="place" value="사무공간">
											<div class="text-textarea">사무공간</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="radio" name="place" value="상업공간">
											<div class="text-textarea">상업공간</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="radio" name="place" value="물류창고">
											<div class="text-textarea">물류창고</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="radio" id="etc" name="place" value="기타">
											<div class="text-textarea">
												기타
												<div id="inputFields2"></div>
											</div>
										</div>
									</div>
								</li>

							</ul>



							<!-- 3번째 질문 -->


							<ul class="bachi-select-section">
								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="type" value="2in1">
											<div class="text-textarea">2 in 1</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="type" value="벽걸이형">
											<div class="text-textarea">벽걸이형</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="type" value="스탠드형">
											<div class="text-textarea">스탠드형</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="type" value="천장형">
											<div class="text-textarea">천장형</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="type" id="etc" value="기타">
											<div class="text-textarea">
												기타
												<div id="inputFields3"></div>
											</div>
										</div>
									</div>
								</li>

							</ul>

							<div class="behind-next">
								<input type="button" value="이전" 
									class="forword-button"> <input type="button" value="다음"
									 class="next-button"> <input type="submit" value="제출" class="submit">
							</div>
						</div>
					</div>

				</div>

		<% }else if(category.equals("job-conserting")){
			%>
			
			<div class="category">

						<div class="data-category">
							<jsp:include page="bachi_progressbar.jsp" />

							<div class="serv-text">어떤 레슨을 원하시나요?</div>
								<input type="hidden" name="gosu_menu1" value="자기계발">
							<input type="hidden" name="gosu_menu2" value="컨설팅">
							
							<!-- 1번째 질문 -->
							<ul class="bachi-select-section">
								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="serv" value="자소서 첨삭">
											<div class="text-textarea">자소서 첨삭</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="serv" value="이력서 첨삭">
											<div class="text-textarea">이력서 첨삭</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="serv" value="경력기술서 첨삭">
											<div class="text-textarea">경력기술서 첨삭</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="serv" value="면접 컨설팅">
											<div class="text-textarea">면접 컨설팅</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="serv" id="etc" value="기타">
											<div class="text-textarea">
												기타
												<div id="inputFields"></div>
											</div>
										</div>
									</div>
								</li>

							</ul>


							<!-- 2번째 질문 -->
							<ul class="bachi-select-section">
								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="radio" name="place" value="가정집">
											<div class="text-textarea">가정집</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="radio" name="place" value="사무공간">
											<div class="text-textarea">사무공간</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="radio" name="place" value="상업공간">
											<div class="text-textarea">상업공간</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="radio" name="place" value="연습실">
											<div class="text-textarea">연습실</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="radio" id="etc" name="place" value="기타">
											<div class="text-textarea">
												기타
												<div id="inputFields2"></div>
											</div>
										</div>
									</div>
								</li>

							</ul>



							<!-- 3번째 질문 -->


							<ul class="bachi-select-section">
								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="type" value="중학생">
											<div class="text-textarea">중학생</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="type" value="고등학생">
											<div class="text-textarea">고등학생</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="type" value="취업준비생">
											<div class="text-textarea">취업준비생</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="type" value="직장인/이직자">
											<div class="text-textarea">직장인/이직자</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="type" id="etc" value="기타">
											<div class="text-textarea">
												기타
												<div id="inputFields3"></div>
											</div>
										</div>
									</div>
								</li>

							</ul>

							<div class="behind-next">
								<input type="button" value="이전" 
									class="forword-button"> <input type="button" value="다음"
									 class="next-button"> <input type="submit" value="제출" class="submit">
							</div>
						</div>
					</div>

				</div>
			<%
		}else if(category.equals("math-lesson")){
			%>
			<div class="category">

						<div class="data-category">
							<jsp:include page="bachi_progressbar.jsp" />

							<div class="serv-text">어떤 레슨을 원하시나요?</div>
							<input type="hidden" name="gosu_menu1" value="레슨">
							<input type="hidden" name="gosu_menu2" value="수학">
							
							
							<!-- 1번째 질문 -->
							<ul class="bachi-select-section">
								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="serv" value="레슨">
											<div class="text-textarea">레슨</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="serv" value="이전설치">
											<div class="text-textarea">이전설치</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="serv" value="해체/철거">
											<div class="text-textarea">해체/철거</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="serv" value="수리">
											<div class="text-textarea">수리</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="serv" id="etc" value="기타">
											<div class="text-textarea">
												기타
												<div id="inputFields"></div>
											</div>
										</div>
									</div>
								</li>

							</ul>


							<!-- 2번째 질문 -->
							<ul class="bachi-select-section">
								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="radio" name="place" value="가정집">
											<div class="text-textarea">가정집</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="radio" name="place" value="사무공간">
											<div class="text-textarea">사무공간</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="radio" name="place" value="상업공간">
											<div class="text-textarea">상업공간</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="radio" name="place" value="물류창고">
											<div class="text-textarea">물류창고</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="radio" id="etc" name="place" value="기타">
											<div class="text-textarea">
												기타
												<div id="inputFields2"></div>
											</div>
										</div>
									</div>
								</li>

							</ul>



							<!-- 3번째 질문 -->


							<ul class="bachi-select-section">
								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="type" value="2in1">
											<div class="text-textarea">2 in 1</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="type" value="벽걸이형">
											<div class="text-textarea">벽걸이형</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="type" value="스탠드형">
											<div class="text-textarea">스탠드형</div>
										</div>
									</div>
								</li>

								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="type" value="천장형">
											<div class="text-textarea">천장형</div>
										</div>
									</div>
								</li>


								<li class="answer">
									<div class="answer-area">
										<div class="checkbox-text">
											<input type="checkbox" name="type" id="etc" value="기타">
											<div class="text-textarea">
												기타
												<div id="inputFields3"></div>
											</div>
										</div>
									</div>
								</li>

							</ul>

							<div class="behind-next">
								<input type="button" value="이전" 
									class="forword-button"> <input type="button" value="다음"
								 class="next-button"> <input
									type="submit" value="제출" class="submit">
							</div>
						</div>
					</div>

				</div>
			
			<%
		}
			%>



			</form>

		</section>





		<div style="margin-left: auto; margin-right: auto;">
			<jsp:include page="footer.jsp" />
		</div>

	</div>



</body>
<script type="text/javascript">
const checkbox1 = document.querySelectorAll('input[name="serv"][value="기타"]');
checkbox1.forEach(function(checkbox) {
checkbox.addEventListener("change", function() {
	  //체크박스가 체크된 경우
	  if(this.checked && this.value === '기타') {
	    //새로운 입력 필드 생성
	    const inputField = document.createElement("input");
	    inputField.type = "text";
	    inputField.name = "dynamicInput";
	    inputField.placeholder = "입력 필드";

	    //입력 필드를 추가할 div 요소를 찾습니다.
	    const inputFields = document.getElementById("inputFields");

	    //새로운 입력 필드를 div에 추가합니다.
	    inputFields.appendChild(inputField);
	  } else { //체크박스가 체크 해제된 경우
	    //입력 필드를 추가할 div 요소를 찾습니다.
	    const inputFields = document.getElementById("inputFields");

	    //마지막 자식 요소를 삭제합니다.
	    inputFields.removeChild(inputFields.lastChild);
	  }
	});
});

const checkbox2 = document.querySelectorAll('input[name="type"][value="기타"]');
	checkbox2.forEach(function(checkbox) {
	checkbox.addEventListener("change", function() {
		  //체크박스가 체크된 경우
		  if(this.checked && this.value === '기타') {
		    //새로운 입력 필드 생성
		    const inputField = document.createElement("input");
		    inputField.type = "text";
		    inputField.name = "dynamicInput";
		    inputField.placeholder = "입력 필드";

		    //입력 필드를 추가할 div 요소를 찾습니다.
		    const inputFields3 = document.getElementById("inputFields3");

		    //새로운 입력 필드를 div에 추가합니다.
		    inputFields3.appendChild(inputField);
		  } else { //체크박스가 체크 해제된 경우
		    //입력 필드를 추가할 div 요소를 찾습니다.
		    const inputFields3 = document.getElementById("inputFields3");

		    //마지막 자식 요소를 삭제합니다.
		    inputFields3.removeChild(inputFields3.lastChild);
		  }
		});
	});
const radioGroup = document.querySelectorAll('input[name="place"]');
const inputFields2 = document.getElementById("inputFields2");

radioGroup.forEach(function(radio) {
  radio.addEventListener('change', function() {
    if (this.checked && this.value === '기타') {
      // 기타를 선택한 경우, 텍스트 박스를 생성
      const inputField = document.createElement("input");
      inputField.type = "text";
      inputField.name = "dynamicInput";
      inputField.placeholder = "입력 필드";

      // 텍스트 박스를 추가할 div 요소를 찾습니다.
      inputFields2.appendChild(inputField);
    } else {
      // 다른 버튼을 선택한 경우, 텍스트 박스를 제거
      inputFields2.innerHTML = '';
    }
  });
});

	
	
	
var questions = document.querySelectorAll(".bachi-select-section");



var currentSectionIndex = 0; // 현재 화면의 인덱스
var previousSelectedOptions = [];
$('.bachi-select-section').hide();
$('.forword-button').hide();

$(document).ready(function() {
	
	  $('.bachi-select-section').eq(0).show(); // 0번째 bachi-select-section 보이기
	  $('.submit').hide();
	  $('.next-button').click(function() {
	    var currentSection = $('.bachi-select-section').eq(currentSectionIndex);
	    var selectedOption = currentSection.find('input:checked'); // 현재 화면에서 선택된 항목 가져오기
	    
	    if (selectedOption.length === 0) { // 선택하지 않은 항목이 있을 경우
	        alert("선택해주세요");
	        event.preventDefault();
	        return;
	      }
	    // 이전 화면에서 선택된 항목을 저장
	    previousSelectedOptions[currentQuestionIndex] = selectedOption.val();
	    
	    
	    next();
	    
	    currentSection.hide(); // 현재 보이는 section 숨기기
	    currentSectionIndex++; // 인덱스 증가
	    $('.forword-button').show(); // 이전버튼 보이기
	    
	    if(currentSectionIndex === $('.bachi-select-section').length) {
	      $('.next-button').hide(); // 마지막 화면에서는 다음버튼 숨기기
	      $('.submit').show();
	    }
	    
	    $('.bachi-select-section').eq(currentSectionIndex).show(); // 다음 section 보이기
	  });
	  
	  $('.forword-button').click(function(){
	    var currentSection = $('.bachi-select-section').eq(currentSectionIndex);
	    currentSection.hide(); // 현재 보이는 section 숨기기
	    currentSectionIndex--; // 인덱스 감소
	    $('.next-button').show(); // 다음버튼 보이기
	    
	    if(currentSectionIndex === 0) {
	      $('.forword-button').hide(); // 첫 번째 화면에서는 이전버튼 숨기기
	       
	    }
	    
	    $('.bachi-select-section').eq(currentSectionIndex).show(); // 이전 section 보이기
	    
	    if (previousSelectedOptions[currentQuestionIndex]) {
	        var progressBar = document.querySelector('.progress-bar');
	        var progressPercent = document.querySelector('.progress-percent');
	        var questions = document.querySelectorAll('.bachi-select-section');
	        var targetWidth = Math.round((parseFloat(progressBar.style.width) || 0) - 100 / questions.length);

	        if (targetWidth == 99) {
	          targetWidth = targetWidth - 1;
	        }

	        progressBar.style.width = targetWidth + '%';
	        progressPercent.innerHTML = targetWidth + '%';
	      }

	      // 이전 화면으로 이동
	    
	    
	  });
	  $(".submit").click(function(){
		 if("<%=id%>"=="null"){
			 alert("로그인 후 이용해주세요");
			 return false;
		 } 
	  });
});


</script>
<script type="text/javascript">
var questions = document.querySelectorAll(".bachi-select-section");
var currentQuestionIndex = 0;

function next() {
	  var progressBar = document.querySelector('.progress-bar');
	  var progressPercent = document.querySelector('.progress-percent');
	  var questions = document.querySelectorAll('.bachi-select-section');



	  var targetWidth = Math.round((parseFloat(progressBar.style.width) || 0) + 100 / questions.length);

	  if (targetWidth == 99) {
	    targetWidth = targetWidth + 1;
	  }

	  progressBar.style.width = targetWidth + '%';
	  progressPercent.innerHTML = targetWidth + '%';

	    
	    // 모든 화면에서 선택값을 가져온 경우 게이지 바를 멈춤
	    if(currentQuestionIndex === questions.length -1) {
	        progressBar.style.width = '100%';
	        progressPercent.innerHTML = '100%';
	    }


	}



</script>
</html>