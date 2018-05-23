<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="kr.or.gntp.db.DBConnection"%>
<%@ page import="javax.naming.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 삭제</title>
</head>
<body>
	<%
   	  String id = request.getParameter("check");
      
      Connection          con     = DBConnection.getConnection();
      PreparedStatement   pstmt   = null;

      try {
         String sql = "DELETE FROM member WHERE id = ?";
         
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, id);
        
         int count = pstmt.executeUpdate();
         
         if(count > 0)
        	 out.print("삭제 완료");
         else
        	 out.print("삭제 실패");
        
      } catch (SQLException e) {
    	  e.printStackTrace();
         out.println("데이터 베이스 접속 실패");
      }           
%>
	<script type="text/javascript">
            location.href="adminHome.jsp";
            </script>

</body>
</html>