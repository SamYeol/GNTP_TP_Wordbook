<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="kr.or.gntp.db.DBConnection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 정보 수정</title>
</head>
<body>

	<%
 	 String id = request.getParameter("check");
	
	Connection con = DBConnection.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null; 

	
      try {
         String sql = "SELECT * FROM member WHERE id = ?";
         
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, id);
         
         rs = pstmt.executeQuery();
         
         if(rs.next()){
         
	         String db_id = rs.getString("id");
	         String db_pw = rs.getString("pw");
	         String db_name = rs.getString("name");
	         String db_phone= rs.getString("phone");
	         String db_mail = rs.getString("mail");
         
 %>
	<form name="UpdateUser" action="Update.jsp" method="get">
		<table>
			<tr>
				<td colspan="2" align="center">사용자 정보 수정</td>
			</tr>
			<tr>
				<td>ID</td>
				<td><input name="id" value="<%=db_id %>"></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input name="pw" value="<%=db_pw %>"></td>
			</tr>
			<tr>
				<td>NAME</td>
				<td><input name="name" value="<%=db_name %>"></td>
			</tr>
			<tr>
				<td>PHONE</td>
				<td><input name="phone" value="<%=db_phone %>"></td>
			</tr>
			<tr>
				<td>MAIL ADDRESS</td>
				<td><input name="mail" value="<%=db_mail %>"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정"></td>
			</tr>
		</table>
	</form>
	<%   
	 	} else {
	 		out.println("자료가 없습니다.");
	 	}
      }catch (SQLException e) {
    	  e.printStackTrace();
         out.println("데이터 베이스 접속 실패");
      }     
%>
</body>
</html>