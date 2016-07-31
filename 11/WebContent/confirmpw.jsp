<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="member.memberDAO" %>
    <%@ page import="member.memberDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>확인</title>
<style type="text/css">
input[type=button]  {
   color: white;
   background-color:gray;
   border: none;
   font-size:8pt;
   height:20px;'
   }
   
   input[type=submit]  {
   color: white;
   background-color:gray;
   border: none;
   font-size:8pt;
   height:20px;'
   }
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("password");
	
	memberDAO dao = memberDAO.getInstance();
	memberDTO mem = dao.login(new memberDTO(0, null, id, pwd, null, null, null, null, null, null, null, 0, 0, 0));

	if(mem != null && !mem.getMember_id().equals("")){
		session.setAttribute("login", mem);
		%>
		<script type="text/javascript">
		alert("회원정보를 수정합니다.");
		location.href="member_Update2.jsp";
		self.close();
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("패스워드가 틀립니다. 확인해주세요");
		location.href="member_Update.jsp";
		self.close();
		</script>
		<%
	}
	%>

</body>
</html>