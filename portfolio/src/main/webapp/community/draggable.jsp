<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>draggable</title>
	<link rel="stylesheet" type="text/css" href="style/view_write.css">
<link rel="stylesheet"href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
</head>

<style>
#pic{width:500px; height:1200px; margin: 0 auto;}
#draggable {	width: 150px;	height: 150px;	padding: 0.5em;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	//첨부파일 삽입하면 이미지 미리보기
	function readImage(input) {  
	
	  if (input.files && input.files[0]) { // 인풋 태그에 파일이 있는 경우
	    var reader = new FileReader();  // FileReader 인스턴스 생성
	    reader.onload = function(e) {
	      document.getElementById('previewImg').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } 
	  else {
	    document.getElementById('previewImg').src = "";
	  }
	}
	/* draggable의 범위 한정*/
	$(function() {
		$(".draggable").draggable({ containment: "#previewImg" });
		
		$("input[type='submit']").click(function(){
	
			var top = $("#icon1").css("top");
			var left = $("#icon1").css("left");
			var position = top +","+left+",";
			$("input:hidden[name='icon1']").attr("value",position);
			
			var top = $("#icon2").css("top");
			var left = $("#icon2").css("left");
			var position = top +","+left+",";
			$("input:hidden[name='icon2']").attr("value",position);
			
			var top = $("#icon3").css("top");
			var left = $("#icon3").css("left");
			var position = top +","+left+",";
			$("input:hidden[name='icon3']").attr("value",position);
			
			var top = $("#icon4").css("top");
			var left = $("#icon4").css("left");
			var position = top +","+left+",";
			$("input:hidden[name='icon4']").attr("value",position);
			
			var top = $("#icon5").css("top");
			var left = $("#icon5").css("left");
			var position = top +","+left+",";
			$("input:hidden[name='icon5']").attr("value",position);
			
			var top = $("#icon6").css("top");
			var left = $("#icon6").css("left");
			var position = top +","+left+",";
			$("input:hidden[name='icon6']").attr("value",position);
			
			var top = $("#icon7").css("top");
			var left = $("#icon7").css("left");
			var position = top +","+left+",";
			$("input:hidden[name='icon7']").attr("value",position);
			
			var top = $("#icon8").css("top");
			var left = $("#icon8").css("left");
			var position = top +","+left+",";
			$("input:hidden[name='icon8']").attr("value",position);
			
			var top = $("#icon9").css("top");
			var left = $("#icon9").css("left");
			var position = top +","+left+",";
			$("input:hidden[name='icon9']").attr("value",position);
			
			var top = $("#icon10").css("top");
			var left = $("#icon10").css("left");
			var position = top +","+left+",";
			$("input:hidden[name='icon10']").attr("value",position);
			
// 			var check= $("input:hidden[name='icon3']").attr("value");
//  			alert(check);
		});
	});
</script>
<body>

<form action="insert_write.jsp" method="post" enctype="multipart/form-data">
	<div id="wrap">
		<table id="writing">
			<thead><tr><td ><h4> 글 작성 </h4></td></tr></thead>
				<tbody>
					<tr>
						<td  id="title"><input type="text" name="post_title" placeholder="글제목"></td>
					</tr>
					<tr>
						<td id="preview">
							<img id="previewImg">
							<img src="img/community/png/green-button.png" class="draggable" id="icon1">
								<input type="hidden" name="icon1">
							<img src="img/community/png/green-button.png" class="draggable" id="icon2">
								<input type="hidden" name="icon2">
							<img src="img/community/png/green-button.png" class="draggable" id="icon3">
								<input type="hidden" name="icon3">
							<img src="img/community/png/green-button.png" class="draggable" id="icon4">
								<input type="hidden" name="icon4">
							<img src="img/community/png/green-button.png" class="draggable" id="icon5">
								<input type="hidden" name="icon5">	
							<img src="img/community/png/green-button.png" class="draggable" id="icon6">
								<input type="hidden" name="icon6">	
							<img src="img/community/png/green-button.png" class="draggable" id="icon7">
								<input type="hidden" name="icon7">	
							<img src="img/community/png/green-button.png" class="draggable" id="icon8">
								<input type="hidden" name="icon8">	
							<img src="img/community/png/green-button.png" class="draggable" id="icon9">
								<input type="hidden" name="icon9">	
							<img src="img/community/png/green-button.png" class="draggable" id="icon10">
								<input type="hidden" name="icon10">		
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<h5>가장 메인이 되는 사진을 올려주세요. 이 사진은 썸네일로 사용 될 예정입니다</h5> 
							<input type="file" onchange="readImage(this);" name="post_pics">
							<input type="file" name="post_pic1"> 
							<input type="file" name="post_pic2"> 
							<input type="file" name="post_pic3">
						</td>
					</tr>
					<tr>
						<td id="text">
							<textarea name="post_txt" id="textarea" placeholder="글내용을 입력해주세요"></textarea>
						</td>
					</tr>
				</tbody>
<!-- 				<tfoot>	<tr><td colspan="2" > <input type="submit" value="작성완료"> </td></tr>	</tfoot> -->
		</table>
	</div>
</form>
</body>
</html>