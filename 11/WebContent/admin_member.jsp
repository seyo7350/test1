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

input {
	outline-style: none;
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
</style>



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
List<memberDTO> memberlist = dao.getMemberList();

String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);
memberDTO dto = dao.getMember(seq);

String sbirthday = dto.getMember_birthday();
String syear = sbirthday.substring(0,4);
String smonth = sbirthday.substring(4,6);
String sday = sbirthday.substring(6,8);
String birthday=syear+"-" + smonth+"-" + sday; 
%>

<h2 style="text-align: center;">회원 정보 보기/수정</h2>

<form name="form1">
<table align="left">
<col width="70"><col width="150"><col width="150"><col width="150">
<tr>
   <th>번호</th><th>회원아이디</th><th>회원이름</th><th>관리자여부</th>
</tr>

<%
   for(int i =0 ; i < memberlist.size(); i++){
	   memberDTO mdto = memberlist.get(i);
	   %>
	   <tr>
	   <td name="seq"><%=mdto.getMember_seq()%></td>
	   <td><a href = "admin_member.jsp?seq=<%=mdto.getMember_seq()%>"/> <%=mdto.getMember_id()%></td>
	   <td><%=mdto.getMember_name()%></td>
	   <td><% if(mdto.getMember_auth()==1){
	           %> 일반회원 <%
                    }else{
               %>관리자<%
               }%></td>
	   </tr>
	  <%
	   }
%>
</table>
</form>

<form action="admin_memberAF.jsp" name="form2">
<table align="center">
<col width="150"><col width="400">
<tr>
   <th>고객번호</th><td><%=seq %></td>
</tr>
<tr>
   <th>이름</th><td><%=dto.getMember_name() %></td>
</tr>
<tr>
   <th>아이디</th><td><%=dto.getMember_id()%></td>
</tr>
<tr>
   <th>비밀번호</th><td><%=dto.getMember_password()%></td>
</tr>
<tr>
   <th>생년월일</th><td><%=birthday %></td>
</tr>
<tr>
   <th>우편번호</th><td><%=dto.getMember_postcode()%></td>
</tr>
<tr>
   <th>집주소</th><td><%=dto.getMember_address()%></td>
</tr>
<tr>
   <th>상세주소</th><td><%=dto.getMember_addressDetail()%></td>
</tr>
<tr>
   <th>연락처</th><td><%=dto.getMember_phone()%></td>
</tr>
<tr>
   <th>이메일</th><td><%=dto.getMember_email()%></td>
</tr>
<tr>
   <th>가입일</th>
   <td><%=dto.getMember_regidate()%></td>
</tr>
<tr>
   <th>포인트 (수정가능)</th>
   <td><input type="text" name="point" value="<%=dto.getMember_point()%>" /></td>
</tr>
<tr>
   <th>관리자여부</th>
   <td><% if(dto.getMember_auth()==1){
	           %> 일반회원 <%
                    }else{
               %>관리자<%
               }%></td>
</tr>
<tr>
   <th>탈퇴여부 (수정가능)</th>
   <td>
   <%
   if(dto.getMember_del()==1){
	   %>
	   <input type="radio" name="del" value="1" checked="checked"> 탈퇴회원
	   <input type="radio" name="del" value="0">회원
	   <%
   }else{
   %>
   <input type="radio" name="del" value="1">탈퇴회원
   <input type="radio" name="del" value="0" checked="checked">회원
   <%
   }
   %>
   </td>
</tr>
<tr>
<td colspan="2">
<input type="hidden" name="seq" value="<%=seq %>"/>
<p align="center">
<input type="submit"  value="회원정보 수정"  /> 
</p></td>
</tr>
</table>

</form>

</body>
</html>