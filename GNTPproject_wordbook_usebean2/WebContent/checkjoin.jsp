<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="kr.or.gntp.db.DBConnectionUseBean" scope="page"></jsp:useBean>
<jsp:useBean id="join" class="kr.or.gntp.db.TBL_Member" scope="page">
<jsp:setProperty name="join" property="*"/>
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	db.getDBConnection();
		
		if(join.joinMember(db)){
			%><script type="text/javascript">
				alert('정상적으로 회원가입하셨습니다.');
				location.href = "login.jsp";
			</script><%
		}else{
			%><script type="text/javascript">
			alert('회원가입을 실패하셨습니다.');
			location.href = "join.jsp";
			</script><%
		}
	
		db.closeDBConnection();
		
	%>	


</body>
</html>