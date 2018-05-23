<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="kr.or.gntp.db.DBConnection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


<head>
<meta content="ko" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />


<title>UserList</title>
<script type="text/javascript">
    function goUpdate() {
    		document.UpdateUser.action="UpdateUserList.jsp";
    		document.UpdateUser.submit()
    	}
    function goDelete(){
    		document.UpdateUser.action="Delete.jsp";
    		document.UpdateUser.submit()
    	}
</script>
<style type="text/css">
.auto-style1 {
	border-width: 0px;
	margin-bottom: 0px;
}

.auto-style2 {
	border: 1px solid #FFFFFF;
	background-color: #FFCCCC;
	text-align: center;
}

.auto-style3 {
	text-align: right;
}
</style>

</head>

<body>
	<form name="UpdateUser" method="get">

		<table class="auto-style1" style="width: 1000px">
			<%
			Connection con = DBConnection.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
	   
	    try {
			String sql = "SELECT * FROM member";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			%>

			<tr>
				<td class="auto-style2" style="height: 20px; width: 72px">ID</td>
				<td class="auto-style2" style="height: 20px; width: 107px">PW</td>
				<td class="auto-style2" style="height: 20px; width: 195px">NAME</td>
				<td class="auto-style2" style="height: 20px; width: 211px">PHONE</td>
				<td class="auto-style2" style="height: 20px">MAIL ADDRESS</td>
				<td class="auto-style2" style="height: 20px; width: 104px">SELECT</td>
			</tr>


			<%
			
			while(rs.next()) {
				String id =rs.getString("id");
				String pw =rs.getString("pw");
				String name =rs.getString("name");
				String phone =rs.getString("phone");
				String mail =rs.getString("mail");
	%>
   
			<tr>
				<td>&nbsp;<%=id%></td>
				<td>&nbsp;<%=pw%></td>
				<td>&nbsp;<%=name%></td>
				<td>&nbsp;<%=phone%></td>
				<td>&nbsp;<%=mail%></td>
				<td><input name="check" type="radio" value="<%=id%>"> </input></td>
			</tr>
			<%
			}
				%>

			<tr>
				<td colspan="6" style="height: 20px" class="auto-style3">
				<button name="button1" onclick='goUpdate()'>수정</button>&nbsp;
				
				<button name="button2" onclick='goDelete()'>삭제</button>&nbsp;</td>





			</tr>
			<%

				
			
		} catch (SQLException e) {
			e.printStackTrace();					
	    } 
		
	%>
		</table>
	</form>

</body>

</html>
