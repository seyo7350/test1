<%@ page import="member.memberDAO" %>
<%@ page import="member.memberDTO" %>

<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 보기/수정</title>
<style type="text/css">
table {
	font-family:Arial, Helvetica, sans-serif;
	color:#666;
	font-size:12px;
	text-shadow: 1px 1px 0px #fff;
	background:#eaebec;
	margin:10px;
	border:#ccc 1px solid;
	vertical-align:top;

	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;

	-moz-box-shadow: 0 1px 2px #d1d1d1;
	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}
table th {
	padding:10px;
	border-top:1px solid #fafafa;
	border-bottom:1px solid #e0e0e0;

	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
	background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
}
table th:first-child{
	text-align: left;
	padding-left:10px;
}
table tr:first-child th:first-child{
	-moz-border-radius-topleft:3px;
	-webkit-border-top-left-radius:3px;
	border-top-left-radius:3px;
}
table tr:first-child th:last-child{
	-moz-border-radius-topright:3px;
	-webkit-border-top-right-radius:3px;
	border-top-right-radius:3px;
}
table tr{
	text-align: center;
	padding-left:10px;
}
table tr td:first-child{
	text-align: left;
	padding-left:10px;
	border-left: 0;
}
table tr td {
	padding:12px;
	border-top: 1px solid #ffffff;
	border-bottom:1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;
	
	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
	background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
}
table tr.even td{
	background: #f6f6f6;
	background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
	background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
}
table tr:last-child td{
	border-bottom:0;
}
table tr:last-child td:first-child{
	-moz-border-radius-bottomleft:3px;
	-webkit-border-bottom-left-radius:3px;
	border-bottom-left-radius:3px;
}
table tr:last-child td:last-child{
	-moz-border-radius-bottomright:3px;
	-webkit-border-bottom-right-radius:3px;
	border-bottom-right-radius:3px;
}
table tr:hover td{
	background: #f2f2f2;
	background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));
	background: -moz-linear-gradient(top,  #f2f2f2,  #f0f0f0);	
}
input[type=text] {
	size: 30;
	font-size: 12px;
	border-left: 0px;
	border-right: 0px;
	border-top: 0px;
	border-bottom: 1px soild gray;
}

input[type=submit]  {
   color: white;
   background-color:lightgray;
   border: none;
   font-size:15px;
   }
   input[type=button]  {
   color: white;
   background-color:lightgray;
   border: none;
   font-size:8pt;
   height:20px;'
   }
</style>
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
<%
memberDAO dao = memberDAO.getInstance();
List<memberDTO> delete_memberlist = dao.getdeleteMember();
%>

<h2 style="text-align: center;">탈퇴 신청 회원 정보 보기/수정</h2>

<form name="form1" action = "admin_deleteAF.jsp">
<table align="left">
<col width="35"><col width="120"><col width="120"><col width="120">
<col width="75"><col width="30"><col width="400"><col width="300">
<col width="100"><col width="200"><col width="200"><col width="100"><col width="100">
<tr>
   <th>고객번호</th><th>이름</th><th>아이디</th><th>비밀번호</th>
   <th>생년월일</th><th>우편번호</th><th>집주소</th><th>상세주소</th>
   <th>연락처</th><th>이메일</th><th>가입일</th><th>포인트</th><th>관리자여부</th>
</tr>

<%
   if(delete_memberlist ==null || delete_memberlist.size()==0){
    	%>
	  <script>
	  alert("탈퇴 신청 회원이 없습니다.");
	  location.href="index_admin.jsp";
	</script>
	   <%
   }
   for(int i =0 ; i < delete_memberlist.size(); i++){
	   memberDTO mdto = delete_memberlist.get(i);
	   %>
	   <tr>
	   <td><%=mdto.getMember_seq()%></td>
	   <td><%=mdto.getMember_name()%></td>
	   <td><a href = "admin_member.jsp?seq=<%=mdto.getMember_seq()%>"/><%=mdto.getMember_id()%></td>
	   <td><%=mdto.getMember_password()%></td>
	   <td><%=mdto.getMember_birthday()%></td>
	   <td><%=mdto.getMember_postcode()%></td>
	   <td><%=mdto.getMember_address()%></td>
	   <td><%=mdto.getMember_addressDetail()%></td>
	   <td><%=mdto.getMember_phone()%></td>
	   <td><%=mdto.getMember_email()%></td>
	   <td><%=mdto.getMember_regidate()%></td>
	   <td><%=mdto.getMember_point()%></td>
	   <td><% if(mdto.getMember_auth()==1){
	           %> 일반회원 <%
                    }else{
               %>관리자<%
               }%></td>
	   </tr>
	  <%
	   }
%>
<tr><td colspan="13">
<p align="center">
DB정리를 원하시면 비밀번호를 입력하신 후 ok버튼을 클릭하세요 &nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name ="password" onkeyup="noSpaceForm(this)" placeholder="비밀번호 입력"/><br><br>

<input type="hidden" name ="id" value="<%=mem.getMember_id() %>"/>
<input TYPE="IMAGE" src="image/ok_btn.jpg" name="submit"	value="submit" width="90px" /> &nbsp;&nbsp;
<a href='index_admin.jsp'><img src="image/cancel_btn.jpg" width="90px" style="vertical-align: top;"/></a>
</p></td></tr>

</table>
</form>

</body>
</html>