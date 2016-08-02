<%@ page import="member.memberDAO" %>
<%@ page import="member.memberDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <% request.setCharacterEncoding("utf-8"); %>
      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
</head>
<body>
<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

String spoint =request.getParameter("point");
int point = Integer.parseInt(spoint);

String sdel=request.getParameter("del");
int del = Integer.parseInt(sdel);

memberDAO mdao = memberDAO.getInstance();

boolean isS = mdao.adminUpdate(point, del, seq);
if(isS){
	%>
	<script type="text/javascript">
	alert("정보수정이 완료되었습니다.");
	location.href="admin_member.jsp?seq=<%=seq%>";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("정보 수정 중 오류가 발생하였습니다. 정보를 제대로 기입하셨는지 확인하세요.");
	location.href="admin_member.jsp?seq=<%=seq%>";
	</script>
	<%
}
%>


</body>
</html>