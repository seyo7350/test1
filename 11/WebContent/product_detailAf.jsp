<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="member.memberDTO"%>
<%@page import="order.orderDTO"%>
<%@page import="order.orderDAO"%>
<%@page import="product.productDAO"%>
<%@page import="product.productOptionDTO"%>
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
Object ologin = session.getAttribute("login");
memberDTO mdto = null;
if(ologin == null){
	%>
	<script type="text/javascript">
	alert('로그인 하십시오');
	location.href = 'login.jsp';
	</script>
	<%
	return;
}
mdto = (memberDTO)ologin;
%>

<%
request.setCharacterEncoding("utf-8");
int product_seq = Integer.parseInt(request.getParameter("product_seq"));

productDAO pdao = productDAO.getInstance();
orderDAO odao = orderDAO.getInstance();

String productOption_seq_arr[] = request.getParameterValues("productOption_seq");

List<orderDTO> orderList = new ArrayList<orderDTO>();

for(int i = 0; i < productOption_seq_arr.length; i++){
	int productOption_seq = Integer.parseInt(productOption_seq_arr[i]);
	
	productOptionDTO podto = pdao.getProductOption(product_seq, productOption_seq);
	int amount = Integer.parseInt(request.getParameter("MK_p_cnt_"+productOption_seq));
	
	orderDTO odto = new orderDTO(mdto.getMember_seq(), product_seq, podto.getProductOption_seq(), amount);
	orderList.add(odto);
}

if(request.getParameter("select").equals("0")){
	session.setAttribute("buyList", orderList);
	%>
	<script type="text/javascript">
		location.href="buy.jsp";
	</script>
	<%
}else{
	Object oshoppingbag = session.getAttribute("shoppingbag");
	if(oshoppingbag != null){
		List<orderDTO> shoppingbag = (ArrayList<orderDTO>)oshoppingbag;
		for(int i = 0; i < orderList.size(); i++){
			shoppingbag.add(orderList.get(i));
		}
		session.setAttribute("shoppingbag", shoppingbag);		
	}else{
		session.setAttribute("shoppingbag", orderList);		
	}
	%>
	<script type="text/javascript">
		location.href="shoppingbag.jsp";
	</script>
	<%
}

%>



</body>
</html>