<%@ page import="member.memberDAO" %>
<%@ page import="member.memberDTO" %>

<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	font-family:Arial, Helvetica, sans-serif;
	color:#666;
	font-size:12px;
	text-shadow: 1px 1px 0px #fff;
	background:#eaebec;
	margin:20px;
	border:#ccc 1px solid;

	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;

	-moz-box-shadow: 0 1px 2px #d1d1d1;
	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}
table th {
	padding:15px;
	border-top:1px solid #fafafa;
	border-bottom:1px solid #e0e0e0;

	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
	background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
}
table th:first-child{
	text-align: left;
	padding-left:20px;
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
	padding-left:20px;
}
table tr td:first-child{
	text-align: left;
	padding-left:20px;
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
</style>

</head>
<body>
<%
memberDAO dao = memberDAO.getInstance();
List<memberDTO> memberlist = dao.getMemberList();

String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

memberDAO mdao = memberDAO.getInstance();
memberDTO mdto = mdao.getMember(seq);
%>
	

<table border="1" align="center" >
<col width="150"><col width="400">
<tr>
   <th>고객번호</th><td><%=mdto.getMember_seq()%></td>
</tr>
<tr>
   <th>이름</th><td><%=mdto.getMember_name()%></td>
</tr>
<tr>
   <th>아이디</th><td><%=mdto.getMember_id()%></td>
</tr>
<tr>
   <th>비밀번호</th><td><%=mdto.getMember_password()%></td>
</tr>
<tr>
   <th>생년월일</th><td><%=mdto.getMember_birthday()%></td>
</tr>
<tr>
   <th>우편번호</th><td><%=mdto.getMember_postcode()%></td>
</tr>
<tr>
   <th>집주소</th><td><%=mdto.getMember_address()%></td>
</tr>
<tr>
   <th>상세주소</th><td><%=mdto.getMember_addressDetail()%></td>
</tr>
<tr>
   <th>연락처</th><td><%=mdto.getMember_phone()%></td>
</tr>
<tr>
   <th>이메일</th><td><%=mdto.getMember_email()%></td>
</tr>
<tr>
   <th>포인트</th>
   <td><input type="text" name="point" value="<%=mdto.getMember_point()%>" /></td>
</tr>
<tr>
   <th>관리자여부</th>
   <td><input type="text" name="point" value="<%=mdto.getMember_auth()%>" /></td>
</tr>
<tr>
   <th>탈퇴여부</th>
   <td><input type="text" name="point" value="<%=mdto.getMember_del()%>" /></td>
</tr>
</table>

</body>
</html>