<%@ page import="member.memberDAO" %>
<%@ page import="member.memberDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 변경 완료</title>

</head>
<body>
  

<%
String password = request.getParameter("password");
String id = request.getParameter("id");



memberDAO mdao = memberDAO.getInstance();
boolean isS  = mdao.changePW(password, id);

if(isS){
	session.invalidate();
	%>
	<script type="text/javascript">
	alert("비밀번호 변경이 완료되었습니다.");
	location.href="login.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("오류가 발생하였습니다. 비밀번호 변경이 계속 안되면 관리자에게 문의하세요.");
	location.href="findPW.jsp";
	</script>
	<%
}
%>
		
</body>
</html>