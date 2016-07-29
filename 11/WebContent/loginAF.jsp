<%@ page import="member.memberDAO" %>
<%@ page import="member.memberDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>koko</title>

</head>
<body>

<%
String id = request.getParameter("id");
String password = request.getParameter("password");

memberDAO mdao = memberDAO.getInstance();
memberDTO mem = mdao.login(new memberDTO(0, null, id, password, null, null, null, null, null, null, null, 0, 0, 0));

if(mem != null && !mem.getMember_id().equals("")){
	session.setAttribute("login", mem);
	%>
	<script type="text/javascript">
	alert("로그인 되었습니다. 환영합니다.");
	location.href="index.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("없는 아이디 이거나 패스워드가 틀립니다. 확인해주세요");
	location.href="login.jsp";
	</script>
	<%
}
%>

</body>
</html>