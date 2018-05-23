<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="db" class="kr.or.gntp.db.DBConnectionUseBean" scope="page"></jsp:useBean>
<jsp:useBean id="search" class="kr.or.gntp.db.ForSearch" scope="page">
<jsp:setProperty name="search" property="*"/>
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>단 어 검 색</title>
</head>
<body>
	<br>
	<%String id=request.getParameter("id"); %>
	<h1 align="center">단 &nbsp;어 &nbsp; &nbsp;검 &nbsp;색</h1>
	<br>
	<form name="searchword" method="get" action="SearchResult.jsp"
		align="center" >
		<input name="userID" type="hidden" value="<%=search.getUserID()%>">
		<input name="searchInput" type="text"
			style="width: 250px; height: 30px;"> <input value=검색
			type="submit"
			style='background-color: #FFFFFF; font-size: 16px; font-family: "Book Antiqua", "Times New Roman", Serif'>
		<p>
			<br>
			<br>
			<br>
	</form>

	<%
		db.getDBConnection();
		boolean exist=false;
		Vector<String> result = search.searchWord(db);
		if(result.size()>1){
			exist=true;
		}
			for(int i=0;i<result.size()-2;i+=3){
				
			%><P>
			<table align="center">
				<tr>
					<td style="width: 120px; height: 20px;">
						<%=result.elementAt(i)%>
					</td>
					<td style="width: 120px; height: 20px;">
						<%=result.elementAt(i+1)%>
					</td>
					<td style="width: 120px;">
						<%=result.elementAt(i+2)%>
					</td>
				</tr>
			</table>
			<%
			}
			if(!exist){
			out.println("저장된 단어가 없습니다.");
		}
		
		db.closeDBConnection();
	%>

</body>
</html>