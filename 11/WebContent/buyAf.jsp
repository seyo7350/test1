<%@page import="order.orderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="order.orderDTO"%>
<%@page import="java.util.List"%>
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

List<orderDTO> orderList;

orderList = (ArrayList<orderDTO>)session.getAttribute("buyList");
orderDAO odao = orderDAO.getInstance();

for(int i = 0; i < orderList.size(); i++){
	odao.insertOrder(orderList.get(i));
}

session.setAttribute("buyList", null);

response.sendRedirect("myorder.jsp");
%>

</body>
</html>