<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="kr.or.gntp.db.DBConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<%
 String name = "한글테스트"; 
 %>
       <table style="width: 50%">
			<tr>
				<td colspan="3">
					<input name="text1" type="text" value=<%=name%> />
				</td>
			</tr>
			<tr>
				</tr><tr>
			</tr>
		</table>
		<form method = "post" action = "delete.jsp">
		<table border="3" bordercolor="skyblue" style="width: 50%">
        <tr bgcolor="skyblue"><td>번호<td>일본어<td><td>번호<td>한글<td></tr>
        
	<%
	
	try{
	String query="SELECT * FROM " + name + ";";
	// 커넥션 연결
    Connection conn = DBConnection.getConnection();
    
    // DB에 쿼리문을 보낸다.
    PreparedStatement pstmt = conn.prepareStatement(query);
    ResultSet rs = pstmt.executeQuery();
    while(rs.next()){
        out.println("<tr>");
        out.println("<td>"+rs.getString("NUMBER"));
        out.println("<td>"+rs.getString("japan"));
        out.println("<td>"+"&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;");
        out.println("<td>"+rs.getString("NUMBER"));
        out.println("<td>"+rs.getString("korea"));
%>
        <td> <input type= "checkbox" name = "check" value = "<%=rs.getString("NUMBER") %>" ></td>
<%		
        out.println("</tr>");
	}
    
	}catch(SQLException e){
    	e.printStackTrace();
    }
	%>
	
</table>
		<input type="submit" value = "삭제">
	</form>
</body>
</html>