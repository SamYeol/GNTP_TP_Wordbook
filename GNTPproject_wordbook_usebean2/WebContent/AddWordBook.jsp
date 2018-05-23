<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="NewWordBook.jsp">
	<%String id=request.getParameter("id"); %>
	<input name="id" type="hidden" value="<%=id %>">
		<table style="width: 700px" align="center">
			<tr>
				<td>&nbsp;</td>
				<td class="auto-style1" align="center"><input name="Text1"
					type="text" style="width: 128px" value="제목을 입력하세요"/> &nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style1" align="center">일본어</td>
				<td>&nbsp;</td>
				<td class="auto-style1" align="center">한국어</td>
			</tr>
			<tr>
				<td class="auto-style1"><input name="japan1" type="text"
					style="width: 128px" /></td>
				<td class="auto-style1">&nbsp;</td>
				<td class="auto-style1"><input name="korea1" type="text"
					style="width: 128px" /></td>
			</tr>
			<tr>
				<td class="auto-style1"><input name="japan2" type="text"
					style="width: 128px" /></td>
				<td class="auto-style1">&nbsp;</td>
				<td class="auto-style1"><input name="korea2" type="text"
					style="width: 128px" /></td>
			</tr>
			<tr>
				<td class="auto-style1"><input name="japan3" type="text"
					style="width: 128px" /></td>
				<td class="auto-style1">&nbsp;</td>
				<td class="auto-style1"><input name="korea3" type="text"
					style="width: 128px" /></td>
			</tr>
			<tr>
				<td class="auto-style1"><input name="japan4" type="text"
					style="width: 128px" /></td>
				<td class="auto-style1">&nbsp;</td>
				<td class="auto-style1"><input name="korea4" type="text"
					style="width: 128px" /></td>
			</tr>
			<tr>
				<td class="auto-style1"><input name="japan5" type="text"
					style="width: 128px" /></td>
				<td class="auto-style1">&nbsp;</td>
				<td class="auto-style1"><input name="korea5" type="text"
					style="width: 128px" /></td>
			</tr>
			<tr>
				<td class="auto-style1"><input name="japan6" type="text"
					style="width: 128px" /></td>
				<td class="auto-style1">&nbsp;</td>
				<td class="auto-style1"><input name="korea6" type="text"
					style="width: 128px" /></td>
			</tr>
			<tr>
				<td class="auto-style1"><input name="japan7" type="text"
					style="width: 128px" /></td>
				<td class="auto-style1">&nbsp;</td>
				<td class="auto-style1"><input name="korea7" type="text"
					style="width: 128px" /></td>
			</tr>
			<tr>
				<td class="auto-style1"><input name="japan8" type="text"
					style="width: 128px" /></td>
				<td class="auto-style1">&nbsp;</td>
				<td class="auto-style1"><input name="korea8" type="text"
					style="width: 128px" /></td>
			</tr>
			<tr>
				<td class="auto-style1"><input name="japan9" type="text"
					style="width: 128px" /></td>
				<td class="auto-style1">&nbsp;</td>
				<td class="auto-style1"><input name="korea9" type="text"
					style="width: 128px" /></td>
			</tr>
			<tr>
				<td class="auto-style1"><input name="japan10" type="text"
					style="width: 128px" /></td>
				<td class="auto-style1">&nbsp;</td>
				<td class="auto-style1"><input name="korea10" type="text"
					style="width: 128px" /></td>
			</tr>
			<tr>
				<td class="auto-style1">&nbsp;</td>
				<td class="auto-style1"><input name="Button1" type="submit"
					value="저장" /> &nbsp;</td>
				<td class="auto-style1">&nbsp;</td>
			</tr>

		</table>
	</form>

</body>
</html>