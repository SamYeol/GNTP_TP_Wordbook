<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.or.gntp.db.DBConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>단 어 검 색</title>
</head>

<body align="center">
	<h1 align="center">단 &nbsp;어 &nbsp; &nbsp;검 &nbsp;색</h1>
	<%String userID=request.getParameter("userID"); %>
	<form name="searchword" method="get" action="SearchResult.jsp"
		align="center" >
		<input name="userID" type="hidden" value="<%=userID %>">
		<input name="searchInput" type="text"
			style="width: 250px; height: 30px;">
		<input value=검색 type="submit"
			style='background-color: #FFFFFF; font-size: 16px; font-family: "Book Antiqua", "Times New Roman", Serif'>
		<p>
	</form><p><br>
	<br><br><br><br><br><br><br><br><br>	
	<img src="main.jpg" height="350" width="1004"  >

</body>
</html>