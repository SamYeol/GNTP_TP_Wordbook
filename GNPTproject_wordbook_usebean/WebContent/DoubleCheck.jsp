<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="kr.or.gntp.db.DBConnectionUseBean" scope="page"></jsp:useBean>
<jsp:useBean id="doublecheck" class="kr.or.gntp.db.ForJoin" scope="page">
<jsp:setProperty name="doublecheck" property="inputID" />
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	db.getDBConnection();
				
	if(doublecheck.checkDouble(db)) {
	%>
	
	<script type="text/javascript">
		alert('아이디가 있네요.');
		location.href="join.jsp";
	</script>
	<%
	}else {
	%>
	<script type="text/javascript">
		alert('아이디쓰세요.');
		location.href="join.jsp";
	</script>
	<%
	} 
	db.closeDBConnection();
	%>
</body>
</html>