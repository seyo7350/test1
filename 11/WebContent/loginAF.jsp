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

if(mem != null && !mem.getMember_id().equals("")&&mem.getMember_del()==0&&mem.getMember_auth()==1){
	session.setAttribute("login", mem);
	%>
	<script type="text/javascript">
	alert("로그인 되었습니다. 환영합니다.");
	location.href="index.jsp";
	</script>
	<%
}else if(mem != null && !mem.getMember_id().equals("")&&mem.getMember_del()==1&&mem.getMember_auth()==1){
	%>
	<script type="text/javascript">
	alert("탈퇴한 회원입니다. 탈퇴 취소를 원하시면 관리자에게 문의해주세요");
	location.href="index.jsp";
	</script>
<%
}else if(mem != null && !mem.getMember_id().equals("")&&mem.getMember_auth()==0&&mem.getMember_del()==0){
	session.setAttribute("login", mem);
	%>
	<script type="text/javascript">
	alert("관리자님 안녕하세요");
	location.href="index_admin.jsp";
	</script>
	<%
}else if(mem != null && !mem.getMember_id().equals("")&&mem.getMember_auth()==0&&mem.getMember_del()==1){
%>
	<script type="text/javascript">
	alert("삭제된 관리자계정입니다.");
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