<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<jsp:useBean id="db" class="kr.or.gntp.db.DBConnectionUseBean" scope="page"></jsp:useBean>
<jsp:useBean id="home" class="kr.or.gntp.db.TBL_WordTotal" scope="page"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>H&nbsp;&nbsp;&nbsp;O&nbsp;&nbsp;&nbsp;M&nbsp;&nbsp;&nbsp;E</title>

<script type="text/javascript">
	function goSearch() {
		document.home.action = "SearchWord.jsp";
		document.home.submit()
	}
	function goAddBook() {
		document.home.action = "AddWordBook.jsp";
		document.home.submit()
	}
</script>

</head>
<body align="center">
	<%
	String userID=request.getParameter("userID");
	%>
	<h1 align="center">암&nbsp;&nbsp;&nbsp;기&nbsp;&nbsp;&nbsp;상&nbsp;&nbsp;&nbsp;어</h1>
	<table align="center">
		<tr>
			<td style="text-align: right; width: 978px; height: 10px">
				 <%=userID%> 님로그인중입니다.
			</td>
			<td style="width: 128px;"><input name="logout" type="button"
				value="로그아웃" onclick="location.href='login.jsp'"
				style="height: 28px;"></td>
		</tr>
		<tr>
			<td colspan="2"><img id=main src="main.jpg" height=250
				width=1100 alt="main"></td>
		</tr>
	</table>

	<form method="post" name="home">
		<input type="hidden" name="userID" value="<%=userID%>" />
		<table style="text-align: center;" width="1100px" border="0"
			cellpadding="2" cellspacing="2" align="center">
			<tr align="center" height="10"
					style="height: 100px; vertical-align: top;">
				<td style="width: 242px;">
					<button name="addwordlist" onclick="goAddBook()">NEW단어장</button>
				</td>
				<td style="width: 236px; height: 20px">
				<input name="updatewordlist" value="단어장 수정" type="button"></td>
					<td style="width: 600px; text-align: right;">
						<button name="search" onclick="goSearch()">검색</button>
					</td>
			</tr>
		</table>
	</form>
				
	<table>
		<tr align="center">
			<td style="width: 250px;">
			<%
			db.getDBConnection();
			
			home.setUserID(userID);
			Vector<String> bookname= home.showBookName(db);
			for(int i=0;i<bookname.size();i++){
				%> 			
				<form method="get" action="WordBook.jsp">
					<input type="hidden" name="userID" value="<%=userID%>" />
					<input type="hidden" name = "bookname" value="<%=bookname.elementAt(i)%>"/>
					<input name="gobookbtn" value="<%=bookname.elementAt(i)%>" type="submit">
				</form>
			</td>
				<%
			}
			db.closeDBConnection();
			%>
		</tr>
	</table>
	<br>
</body>
</html>