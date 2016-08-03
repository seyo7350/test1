<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="member.memberDTO" %>
<%@ page import="member.memberDAO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>email 중복체크</title>
<link rel="stylesheet" href="css/confirm.css">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	memberDAO dao = memberDAO.getInstance();
	
	Object ologin = session.getAttribute("login");
	memberDTO mem = (memberDTO)ologin;
	
	int check = dao.confirmEmail(email);
	
	if(check == 1&& mem.getMember_email().equals(email)){
		%>
		<script type="text/javascript">
	function setId(){
		opener.document.form.email.value='<%=email%>';
		opener.document.form.email_check_confirm.value = true ;
		//팝업창을 닫음
		self.close();
	}
	</script>
	<%=email %>이미 <%=mem.getMember_name() %>님이 쓰고 있는 이메일입니다.<br><br>
	<input type="button" value="이메일 사용하기" onclick="setId()" align="center">
	
	<br><br>다른 이메일 검색<br>
	<form action="confirmEmail.jsp" method="post">
		<input type="text" name="email" size="30" >
		<input type="submit" value="다시 검색">
	</form>
<%
}else if(check == 1&& !mem.getMember_email().equals(email) ){ //사용 중인 이메일이 존재
%>
	<%=email %>은(는) 이미 사용 중인 이메일입니다.<br><br>
	다른 아이디를 선택하세요.<br><br>
	<form action="confirmEmail2.jsp" method="post">
		이메일<input type="text" name="email" size="30" >
		<input type="submit" value="email 중복확인">
	</form>
<%	
	}else{ //이메일이 미존재
%>
	<script type="text/javascript">
	function setId(){
		opener.document.form.email.value='<%=email%>';
		opener.document.form.email_check_confirm.value = true ;
		//팝업창을 닫음
		self.close();
	}
	</script>
	입력하신 <%=email %>은(는) 사용할 수 있는 이메일입니다.<br><br>
	<input type="button" value="이메일 사용하기" onclick="setId()" align="center">
	
	<br><br>다른 이메일 검색<br>
	<form action="confirmEmail2.jsp" method="post">
		<input type="text" name="email" size="30" >
		<input type="submit" value="다시 검색">
	</form>
	
<%
	}
%>
</body>
</html>