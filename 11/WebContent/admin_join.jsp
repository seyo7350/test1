<%@ page import="member.memberDAO" %>
<%@ page import="member.memberDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 계정 추가</title>

<link rel="stylesheet" href="css/admin.css">

<script>
	function noSpaceForm(obj) { // 공백사용못하게
		var str_space = /\s/; // 공백체크
		if (str_space.exec(obj.value)) { //공백 체크
			alert("해당 항목에는 공백을 사용할수 없습니다.");
			obj.focus();
			obj.value = obj.value.replace(' ', ''); // 공백제거
			return false;
		}
	}
	
	function email_check(email) {
		var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    return (email != '' && email != 'undefined' && regex.test(email) === true);
	}
	
	function pwd_check(password){
		
	}
</script>
<script type="text/javascript">
//아이디 중복 여부를 판단
function openConfirmId(user){
	//아이디를 입력했는지 검사
	if(user.id.value==''){
		alert('아이디를 입력하세요!!');
		return;
	}

	//url과 사용자 입력 id를 조합
	var url = 'confirmId.jsp?id=' + user.id.value;
	
	//새로운 윈도우를 열기
	open(url, 'confirm', 'toolbar=no,scrollbars=no,resizable=no,width=300,height=200');
}

//이메일 중복 여부를 판단
function openConfirmEmail(user){
	//이메일을 입력했는지 검사
	if(user.email.value==''){
		alert('email을 입력하세요!!');
		return;
	}
	
	if ( !email_check(user.email.value) ) {
		alert('	올바른 이메일 형식이 아닙니다.');
		user.email.focus();
		return ;
	}	
	//url과 사용자 입력 id를 조합
	var url = 'confirmEmail.jsp?email=' + user.email.value;
	
	//새로운 윈도우를 열기
	open(url, 'confirm', 'toolbar=no,scrollbars=no,resizable=no,width=300,height=200');
}

	
//회원 가입시 예외처리 확인
function checkIt() {
	var user = document.form;
	
	if (user.name.value == '') {
		alert('이름을 입력하세요!');
		user.name.focus();
		return false;
	}
	
	if (user.id.value == '') {
		alert('아이디를 입력하세요!');
		user.id.focus();
		return false;
	}
	
	// 폼 전송시 아이디 중복체크 확인
	if (user.id_check_confirm.value == "false") // 기본값은 false
	{
	alert("아이디 중복 체크를 하지 않았습니다");
	return false;
	}
	
	if (user.password.value == '') {
		alert('	비밀번호를 입력하세요!');
		user.password.focus();
		return false;
	}

	var check = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;

	if (!check.test(user.password.value)) {    
		alert("비밀번호는 문자, 숫자, 특수문자의 조합으로 8~20자리로 입력해주세요.");
        return false;
	} 
		
	if (user.password.value == user.id.value) {
		alert('	비밀번호는 아이디와 똑같이 설정할 수 없습니다!');
		user.password.focus();
		return false;
	}
	
	if (user.Chk_password.value == '') {
		alert('	비밀번호 확인을 입력하세요!');
		user.Chk_password.focus();
		return false;
	}
	
	if (user.Chk_password.value != user.password.value) {
		alert('	비밀번호와 비밀번호 확인이 다릅니다. 확인하세요!');
		user.Chk_password.focus();
		return false;
	}
			
	if (user.email.value =="") {
		alert('	이메일 계정을 입력하세요!');
		user.email.focus();
		return false;
	}
	
	if ( !email_check(user.email.value) ) {
		alert('	올바른 이메일 형식이 아닙니다.');
		user.email.focus();
		return false;
	}	
	
	// 폼 전송시 이메일 중복체크 확인
	if (user.email_check_confirm.value == "false") // 기본값은 false
	{
	alert("이메일 중복 체크를 하지 않았습니다");
	return false;
	}
}
</script>
</head>
<body>
<%
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
%>
<h2 style="text-align: center;">관리자 계정 추가</h2>
<form action="admin_joinAF.jsp" name='form' onsubmit="return checkIt()" >
<table  style="margin-left: auto; margin-right: auto;">
<col width="150"><col width="400">
<tr>
   <th>이름</th>
   <td colspan="2">관리자_<input type="text" name="name" onkeyup="noSpaceForm(this)"/></td>
</tr>
<tr>
   <th>아이디</th>
   <td><input type="text" name="id" onkeyup="noSpaceForm(this)"/></td>
    <td><input type="button" name="confirm_id" value="ID 중복확인" onclick="openConfirmId(this.form)"></td>
	<input type="hidden" name="id_check_confirm" value="false">
</tr>
<tr>
   <th>비밀번호</th>
   <td colspan="2"><input type="text" name="password" onkeyup="noSpaceForm(this)" maxlength="20"/></td>
</tr>
<tr>
   <th>비밀번호 확인</th>
   <td colspan="2"><input type="text" name="Chk_password" onkeyup="noSpaceForm(this)" maxlength="20"/></td>
</tr>
<tr>
   <th>이메일</th>
   <td><input type="text" name="email" onkeyup="noSpaceForm(this)"/></td>
   <td><input type="button" name="confirm_email" value="email 중복확인" onclick="openConfirmEmail(this.form)"/></td>
	<input type="hidden" name="email_check_confirm" value="false">
</tr>


<tr><td colspan="3">
<p align="center">
<input type="submit"  value="관리자 추가"  /> 
</p></td>
</tr>
</table>

</form>
<p align="center"><a href='admin_index.jsp'><img src="image/cancel_btn.jpg" width="90px" /></a></p>
</body>
</html>