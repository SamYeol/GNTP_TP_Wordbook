<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="kr.or.gntp.db.DBConnection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function goAddWord() {
		document.home.action = "wWordBook.jsp";
		document.home.submit()
	}
</script>
</head>

<body>
<%
String id = request.getParameter("id");
String bookname=request.getParameter("bookname");
%>

	<form method="post" action="wWordBook.jsp">
		<input type="hidden" name ="bookname" value="<%=bookname%>"/>
 		<input type="hidden" name ="id" value="<%=id%>"/>
    
		<center>
        	<table style="width: 50%">
			<tr>
				<td colspan="3">
					<input name="text1" type="text" value=<%=bookname%> />
				</td>
			</tr>
			<tr>
				<td>일본어</td>
				<td>&nbsp;</td>
				<td>한글</td>
			</tr>
			<tr>
				<td>
					<input name="japan" type="text" />
				</td>
				<td>
					<button name="addword" onclick="goAddWord()">추가</button>
				</td>
				<td>
					<input name="korea" type="text" />
				</td>
			</tr>
			</table>
		
			<table border="3" bordercolor="skyblue" style="width: 50%">
        	<tr bgcolor="skyblue"><td>번호<td>일본어<td>한글</tr>
        
<%
	Connection con = DBConnection.getConnection();;
	PreparedStatement pstmt = null;
	ResultSet rs = null; 
	try{
		String sql="SELECT * FROM wordtotal WHERE id=? AND bookname =?;";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,bookname);
	    rs = pstmt.executeQuery();
     
	    int i=1;
    	while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+i+"</td>");
			out.println("<td>"+rs.getString("jword")+"</td>");
			out.println("<td>"+rs.getString("kword")+"</td>");
			out.println("</tr>");		
			i++;
		}
	}catch(SQLException e){
    	e.printStackTrace();
    }
%>
	
		</table>
	</center>
	</form>
</body>
</html>