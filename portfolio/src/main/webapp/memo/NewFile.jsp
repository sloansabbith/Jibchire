<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
select * from post_house
left join post_bookmark on post_house.post_id=post_bookmark.post_id
where bookmark_time BETWEEN DATE_ADD(NOW(), INTERVAL -1 WEEK ) and now()  
group by post_house.post_id and post_bookmark.post_id order by count(post_bookmark.post_id) desc limit 0,3;

이거 왜 안될까
<img src="light03.jfif">
</body>
</html>