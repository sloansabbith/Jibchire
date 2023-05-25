<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="result">
<%
	JSONArray array = (JSONArray) request.getAttribute("array");
	String text = request.getParameter("text");
	for(int i=0; i<array.size(); i++){

	    //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
	    JSONObject object = (JSONObject) array.get(i);
	    
	    if(object.get("CENTER_ADDRES").toString().contains(text)){
		    //JSON name으로 추출
// 	   	    out.println("row_"+i+" ===========================================");
// 		    out.println("<br>");
// 		    out.println("CENTER_NAME ==> "+object.get("CENTER_NAME"));
// 		    out.println("<br>");
// 		    out.println("CENTER_ADDRES ==> "+object.get("CENTER_ADDRES"));
// 		    out.println("<br>");
// 		    out.println("CENTER_TEL_NO ==> "+object.get("CENTER_TEL_NO"));
// 		    out.println("<br>");
%>
			<ul class="resultset" id="<%=object.get("CENTER_ADDRES")%>" onclick='showmap(this)'>
				<li><%=object.get("CENTER_NAME")%></li>
				<li><%=object.get("CENTER_ADDRES")%></li>
				<li><%=object.get("CENTER_TEL_NO")%></li>
			</ul>
<%
	    }
	}
%>
<!-- 지도크기 -->
<div id="map" style="width:450px;height:350px;"></div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7c3c7195a7bc32c881f7cd628d1975e&libraries=services"></script>
<script>

	var address = "서울시 송파구 삼전동 61-5";
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch("서울시 송파구 삼전동 61-5", function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	        });
	        infowindow.open(map, marker);
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	}); 
	
</script>
</body>
</html>