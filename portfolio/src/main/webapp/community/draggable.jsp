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
			var position = top +","+left;
			$("input:hidden[name='icon1']").attr("value",position);
			
			var top = $("#icon2").css("top");
			var left = $("#icon2").css("left");
			var position = top +","+left;
			$("input:hidden[name='icon2']").attr("value",position);
			
			var top = $("#icon3").css("top");
			var left = $("#icon3").css("left");
			var position = top +","+left;
			$("input:hidden[name='icon3']").attr("value",position);
			var check= $("input:hidden[name='icon3']").attr("value");
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
				<tfoot>	<tr><td colspan="2" > <input type="submit" value="작성완료"> </td></tr>	</tfoot>
		</table>
	</div>
</form>
</body>
</html>