<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="member.memberDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID 중복체크</title>
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
	memberDAO dao = memberDAO.getInstance();
	int check = dao.confirmId(id);
	if(check == 1){ //사용 중인 아이디가 존재
%>
	<%=id %>은(는) 이미 사용 중인 아이디입니다.<br><br>
	다른 아이디를 선택하세요.<br><br>
	<form action="confirmId.jsp" method="post">
		아이디<input type="text" name="id" size="10" maxlength="12">
		<input type="submit" value="ID중복확인">
	</form>
<%	
	}else{ //아이디가 미존재
%>
	<script type="text/javascript">
	function setId(){
		opener.document.form.id.value='<%=id%>';
		opener.document.form.id_check_confirm.value = true ;
		opener.document.form.id.readOnly = true;
		//팝업창을 닫음
		self.close();
	}
	</script>
	입력하신 <%=id %>은(는) 사용할 수 있는 ID입니다.<br><br>
	<input type="button" value="ID 사용하기" onclick="setId()" align="center">
	
	<br><br>다른 아이디 검색<br>
	<form action="confirmId.jsp" method="post">
		<input type="text" name="id" size="10" maxlength="12">
		<input type="submit" value="다시 검색">
	</form>
	
<%
	}
%>
</body>
</html>