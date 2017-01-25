<%@ page import="Employee.EmployeeDAO"%>
<%@ page import="Employee.EmployeeDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String e_idennum = request.getParameter("e_idennum");
		String e_pass = request.getParameter("e_pass");

		EmployeeDAO edao = EmployeeDAO.getInstance();
		EmployeeDTO employee = edao.login(new EmployeeDTO(0, e_idennum, null, null, 0, 0, null, null, null, null, null, null, null, null, 0));

		//인사팀 인사팀 아닌 사람 나누어 줘야 합니다.
		if (employee != null && !employee.getE_idennum().equals("")) {
			session.setAttribute("login", employee);
	%>
	<script type="text/javascript">
		alert("로그인 성공");
		location.href = "Main2.jsp"
	</script>
	<%
		} else if (employee != null && !employee.getE_idennum().equals("")) {
	%>
	<script type="text/javascript">
		alert("관리자 로그인 성공!");
		location.href = "Main1.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("잘못된 사원번호와 비밀번호 입니다.");
		location.href = "login.jsp";
	</script>
	<%
		}
	%>
</body>
</html>