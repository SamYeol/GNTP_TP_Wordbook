<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.or.gntp.db.DBConnection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>
</head>
<body>
	<span style="font-family: Gulim;"></span>
	<form method="post" action="checklogin.jsp">
		<table style="text-align: center; width: 393px; height: 208px;"
			border="0" cellpadding="2" cellspacing="2" align="center">
			<tbody>
				<tr>
					<td style="text-align: center;">I &nbsp; D</td>
					<td style="text-align: center;"><input name="userID" type="text"></td>
					<td style="text-align: center;"><input name="login"
						value="로그인" type="submit"></td>
				</tr>
				<tr>
					<td style="text-align: center;">P/W</td>
					<td style="text-align: center;"><input name="userPW"
						type="password"></td>
					<td style="text-align: center;">
						<button type="button" onclick="location.href='join.jsp' ">회원가입</button>

					</td>
				</tr>
				</form>
</body>
</html>                                                          