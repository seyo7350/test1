<%@ page import="member.memberDAO" %>
<%@ page import="member.memberDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그아웃</title>
</head>
<body>
<%
Object ologin = session.getAttribute("login");
memberDTO mem = null;

if(ologin == null){
	%>
	<script>
	  alert("로그인을 해주세요");
	  history.go(-1);
	</script>
	<%
	return;
}
 mem = (memberDTO)ologin;
%>

<%
//세션 정보 삭제
session.invalidate();
%>
<script type="text/javascript">
alert("로그아웃되었습니다. 다시 방문해주세요");
location.href="index.jsp"
</script>

</body>
</html>