<%@ page import="member.memberDAO" %>
<%@ page import="member.memberDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 계정 추가</title>
</head>
<body>

<%
String name1 = request.getParameter("name");
String name = "관리자_"+name1;
String id = request.getParameter("id");
String password = request.getParameter("password");
String email = request.getParameter("email");

memberDAO mdao = memberDAO.getInstance();

boolean isS = mdao.addAdmin(new memberDTO(name, id, password, email));
 if(isS){
	%>
	<script type="text/javascript">
	alert("관리자 계정 추가가 완료되었습니다.");
	location.href="admin_index.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("계정 추가중 오류가 발생했습니다. 정보를 제대로 기입했는지 확인해주세요.");
	location.href="admin_join.jsp";
	</script>
	<%
}
%>     

</body>
</html>