<%@ page import="member.memberDTO" %>
<%@ page import="member.memberDAO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 모드</title>
</head>
<body>

<%-- <%
Object ologin = session.getAttribute("login");
memberDTO mem = null;

if(ologin == null && mem.getMember_auth()==1){
	%>
	<script>
	  alert("로그인을 해주세요");
	  location.href="login.jsp";
	</script>
	<%
	return;
}
 mem = (memberDTO)ologin;
%> --%>
 

<h1 style="text-align: center;">관리자 메뉴</h1>
<table border="1" align="center">
	<tr>
		<td align="center"><button onclick="location.href='admin_product_add.jsp'">상품 등록</button></td>
	</tr>
	<tr>
		<td align="center"><button onclick="location.href='admin_purchase_list.jsp'">결제 목록</button></td>
	</tr>
	<tr>
		<%-- <td align="center"><button onclick="location.href='admin_member.jsp?seq=<%=mem.getMember_seq()%>'">회원정보 보기</button></td> --%>
	</tr>
	<tr>
		<td align="center"><button onclick="location.href='admin_join.jsp'">관리자 계정 추가</button></td>
	</tr>
	<tr>
		<td align="center"><button onclick="location.href='admin_delete.jsp'">탈퇴 회원 DB 삭제</button></td>
	</tr>
</table>
</body>
</html>