<%@ page import="member.memberDAO" %>
<%@ page import="member.memberDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("utf-8"); %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%! //메소드 모음 
//1분을 01분으로 나타나게 만드는 메소드
public String two(String msg){
	return msg.trim().length()<2 ? "0"+msg : msg.trim();
}
%>

<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

String name = request.getParameter("name");
String id = request.getParameter("id");
String password = request.getParameter("password");

String year = request.getParameter("year");
String smonth = request.getParameter("month");
int month = Integer.parseInt(smonth);
String sday = request.getParameter("day");
int day = Integer.parseInt(sday);
String birthday = year+two(month+"")+two(day+"");

String postcode = request.getParameter("postcode");
String address = request.getParameter("address1");
String addressDetail = request.getParameter("address2");

String phone = request.getParameter("phone");
String email = request.getParameter("email");

memberDAO mdao = memberDAO.getInstance();

boolean isS = mdao.updateMember(password, postcode, address, addressDetail, email, phone, birthday, seq);
 if(isS){
	%>
	<script type="text/javascript">
	alert("회원정보 수정이 완료되었습니다.");
	location.href="index.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("처리 중 오류가 발생하였습니다. 정보를 제대로 기입하셨는지 확인하시고 이상이 있으면 관리자에게 문의하세요.");
	location.href="member_Update.jsp";
	</script>
	<%
}
%> 
</body>
</html>