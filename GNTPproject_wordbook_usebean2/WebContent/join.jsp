<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html><head><meta content="text/html; charset=UTF-8" http-equiv="content-type"><title>join.jsp</title>
<script type="text/javascript">
function doublecheck() {
	document.regform.action = "DoubleCheck.jsp";
	document.regform.submit()
}
function checkjoin() {
	document.regform.action = "checkjoin.jsp";
	document.regform.submit()
		   }
</script>

<style type="text/css">
.auto-style2 {
	text-align: center;
}
.auto-style3 {
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
	font-size: large;
}
.auto-style4 {
	font-size: medium;
	font-family: Arial, Helvetica, sans-serif;
}
</style>
</head><body>
<form name="regform" method="post" >
<table style="text-align: left; width: 618px; height: 334px;" border="0" cellpadding="2" cellspacing="2" align="center"><tbody><tr>
	<td class="auto-style2">회원가입</td>
	<td class="auto-style2" colspan="3"></td></tr><tr>
		<td class="auto-style2" rowspan="7"></td><td class="auto-style3">I&nbsp;&nbsp;&nbsp;&nbsp; 
		D</td>
		<td class="auto-style2"><em><input name="userID" class="auto-style1"></em></td>
		<td class="auto-style2">
		<input name="againId" value="중복확인" type="submit" onclick="doublecheck()" class="auto-style4" style="width: 95px; height: 26px"></td></tr><tr>
		<td class="auto-style3">P / W</td><td class="auto-style2"><em>
		<input name="userPW" type="password" class="auto-style1"></em></td>
		<td rowspan="5"></td></tr><tr><td class="auto-style3">P/W확인</td>
		<td class="auto-style2"><em>
		<input name="pwagain" type="password" class="auto-style1"></em></td></tr><tr>
		<td class="auto-style3">이&nbsp;&nbsp; 름</td>
		<td class="auto-style2"><em><input name="userName" class="auto-style1"></em></td></tr><tr>
		<td class="auto-style3">전화번호</td>
		<td class="auto-style2"><em><input name="Phone" class="auto-style1"></em></td></tr><tr>
		<td class="auto-style3">e-mail</td>
		<td class="auto-style2"><em><input name="Mail" class="auto-style1"></em></td></tr><tr>
		<td class="auto-style2" colspan="2"></td><td class="auto-style2">
		<input name="addmember" value="가입" type="submit" onclick="checkjoin()" class="auto-style4"></td></tr></tbody></table>
</form>
<em><br></em></body></html>