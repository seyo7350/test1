    <%@ page import="member.memberDAO" %>
    <%@ page import="member.memberDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 DB정리</title>
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
		alert("DB정리를 시작합니다.");
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("패스워드가 틀립니다. 확인해주세요");
		location.href="admin_delete.jsp";
		self.close();
		</script>
		<%
	}
	%>
	<%
	
	memberDAO mdao = memberDAO.getInstance();
    boolean isS = mdao.deleteDB();

    if(isS){
    %>
    <script type="text/javascript">
    alert("DB정리가 완료되었습니다.");
    location.href = "admin_index.jsp";
    </script>
    <%
    }else{
	%>
    <script type="text/javascript">
    alert("DB정리중 오류가 발생했습니다. 정보를 제대로 기입했는지 확인해주세요.");
    location.href = "admin_deleteAF.jsp";
    </script>
    <%
    }
    %>

</body>
</html>