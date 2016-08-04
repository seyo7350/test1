<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="order.orderDTO"%>
<%@page import="order.orderDAO"%>
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

String s_basketchks[] = request.getParameterValues("basketchks");

orderDAO odao = orderDAO.getInstance();
List<orderDTO> shoppingbag = (ArrayList<orderDTO>)session.getAttribute("shoppingbag");
List<orderDTO> orderList = new ArrayList<orderDTO>();

for(int i = 0; i < s_basketchks.length; i++){
	orderDTO odto = shoppingbag.get(Integer.parseInt(s_basketchks[i]));
	orderList.add(odto);
}

session.setAttribute("buyList", orderList);

response.sendRedirect("buy.jsp");

%>

</body>
</html>