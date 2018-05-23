<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="kr.or.gntp.db.DBConnection"%>
<%@ page import="javax.naming.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 수정</title>
</head>
<body>
	<%
	  request.setCharacterEncoding("UTF-8");
   	  String id = request.getParameter("id");
	  String pw = request.getParameter("pw");
	  String name = request.getParameter("name");
	  String phone = request.getParameter("phone");
	  String mail = request.getParameter("mail");
	 
      
      Connection          con     = null;
      PreparedStatement   pstmt   = null;

      try {
    	 con = DBConnection.getConnection();
         
         String sql = "UPDATE member SET pw = ?, name = ?,phone=?,mail=? WHERE id = ?";
         
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, pw);
         pstmt.setString(2, name);
         pstmt.setString(3, phone);
         pstmt.setString(4, mail);
         pstmt.setString(5, id);
         
        
         int count = pstmt.executeUpdate();
         
         if(count > 0)
        	 out.print("수정 완료");
         else
        	 out.print("수정 실패");
        
      } catch (ClassNotFoundException e) {
         out.println("드라이버 로드 실패");
      } catch (SQLException e) {
    	  e.printStackTrace();
         out.println("데이터 베이스 접속 실패");
      } catch (NamingException e) {
    	  out.println("자원 이름 오류");
      }
                  
%>
	<script type="text/javascript">
            location.href="UserList.jsp";
            </script>

</body>
</html>