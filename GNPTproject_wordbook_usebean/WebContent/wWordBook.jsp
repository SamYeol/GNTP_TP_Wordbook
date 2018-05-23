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

String bookname = request.getParameter("bookname"); 
String id = request.getParameter("id");

try{

Connection con = DBConnection.getConnection();
PreparedStatement pstmt=null;
ResultSet rs = null; 

String sql = "SELECT userno FROM member WHERE id =?";
pstmt=con.prepareStatement(sql);
pstmt.setString(1,id);
rs=pstmt.executeQuery();
rs.next();
int userno=rs.getInt("userno");

sql = "SELECT bookno FROM wordtotal WHERE id =? AND bookname=?";
pstmt=con.prepareStatement(sql);
pstmt.setString(1,id);
pstmt.setString(2,bookname);
rs=pstmt.executeQuery();
rs.next();
int bookno=rs.getInt("bookno");

sql = "INSERT INTO wordtotal(userno,id,bookno,bookname,jword, kword) "
	+"VALUES (?,?,?,?,'"+ request.getParameter("japan") +"' , '" + request.getParameter("korea") +"' );";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1,userno);
pstmt.setString(2,id);
pstmt.setInt(3,bookno);
pstmt.setString(4,bookname);
pstmt.executeUpdate();

}catch(SQLException e){
	e.printStackTrace();
}
	
	 %><jsp:forward page="WordBook.jsp">
		<jsp:param value="<%=bookname %>" name="bookname" />
		<jsp:param value="<%=id %>" name="id" />
	</jsp:forward>

	<script type="text/javascript">
	 location.href="WordBook.jsp"
	 </script>
</body>
</html>