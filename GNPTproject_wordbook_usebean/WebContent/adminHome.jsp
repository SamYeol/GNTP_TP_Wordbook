<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AdminHome</title>
</head>
<body>

	<table style="text-align: left; width: 382px; height: 92px;" border="1"
		cellpadding="2" cellspacing="2">
		<tbody>
			<tr align="center">
				<td colspan="2" rowspan="1">관리자 모드</td>
			</tr>
			<tr>
				<td style="text-align: left;">사용자 개인정보</td>

				<td>
					<form name="UserList" action="UserList.jsp" method="get">
						<input value="바로가기" type="submit">
					</form>
				</td>

			</tr>
			<tr>
				<td>단어장 목록</td>
				
				<td>
					<form name="WordBookList" action="WordBookList" method="get">
						<input value="바로가기" type="submit">
					</form>
				</td>
			</tr>
		</tbody>
	</table>
	<br>
</body>
</html>
