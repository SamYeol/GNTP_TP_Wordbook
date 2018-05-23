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
		Connection con = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String id = request.getParameter("id");
		String bookname = request.getParameter("Text1");

		String[] kword = new String[10];
		String[] jword = new String[10];

		for (int i = 0; i < 10; i++) {
			kword[i] = request.getParameter("korea" + String.valueOf(i + 1));
			jword[i] = request.getParameter("japan" + String.valueOf(i + 1));
		}
		
		try {
			String sql = "SELECT userno FROM member WHERE id =?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			rs.next();
			int userno=rs.getInt("userno");
			int bookno=0;
			
			sql = "SELECT MAX(bookno) AS bookno FROM wordtotal WHERE id =?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bookno=rs.getInt("bookno")+1;
			}

			for (int i = 0; i < jword.length; i++) {
				if(!(jword[i].equals("") && kword[i].equals(""))){
					sql = "INSERT INTO wordtotal(userno,id,bookno,bookname,jword, kword) VALUES(?,?,?,?,?,?);";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1,userno);
					pstmt.setString(2,id);
					pstmt.setInt(3,bookno);
					pstmt.setString(4,bookname);
					pstmt.setString(5,jword[i]);
					pstmt.setString(6,kword[i]);
					pstmt.executeUpdate();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
	<jsp:forward page="home.jsp">
		<jsp:param name="id" value="<%=id%>" />
	</jsp:forward>
</body>
</html>