<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="order.orderDTO" %>
<%@page import="order.orderDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin_purchase_listAf</title>
</head>
<body>
<%
String order_seq_string = request.getParameter("order_seq");
int order_seq = Integer.parseInt(order_seq_string);

orderDAO odao = orderDAO.getInstance();

boolean isS = odao.updateorder_confirm(order_seq);
if(isS){
	%>
	<script type="text/javascript">
	alert("배송완료 되었습니다.");
	location.href="admin_purchase_list.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("정보 수정 중 오류가 발생하였습니다. 정보를 제대로 기입하셨는지 확인하세요.");
	location.href="admin_purchase_list.jsp";
	</script>
	<%
}
%>
</body>
</html>