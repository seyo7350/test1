<%@ page import="member.memberDAO" %>
<%@ page import="member.memberDTO" %>

<%@page import="notice.NoticeReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");

String sseq = request.getParameter("seq");
String noticeAnswer_author = request.getParameter("cname");
String noticeAnswer_pwd = request.getParameter("cpass");
String noticeAnswer_content = request.getParameter("comment");

int notice_num = Integer.parseInt(sseq);


System.out.println(notice_num);
System.out.println(noticeAnswer_author);
System.out.println(noticeAnswer_pwd);
System.out.println(noticeAnswer_content);


NoticeReplyDAO noDAO = new NoticeReplyDAO();
noDAO.writeNoticeReply(notice_num, noticeAnswer_author, noticeAnswer_pwd, noticeAnswer_content);



%>


<jsp:forward page="noticeDetail.jsp?seq=<%=notice_num %>"></jsp:forward>

</body>
</html>