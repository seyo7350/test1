<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="product.productDTO" %>
<%@page import="product.productOptionDTO" %>
<%@page import="product.productDAO" %>
<%@page import="member.memberDTO" %>
<%@page import="member.memberDAO" %>
<%@page import="order.orderDTO" %>
<%@page import="order.orderDAO" %>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin_purchase_list</title>
<%-- <script type="text/javascript">
function send(){
	alert("버튼 클릭");
	location.href="admin_purchase_listAf.jsp?order_seq=<%=order_seq %>"
}
</script>  --%>
</head>
<body>
<%
productDAO pdao = productDAO.getInstance();
memberDAO mdao = memberDAO.getInstance();
orderDAO odao = orderDAO.getInstance();

List<orderDTO> olist = odao.getadminOrderList();

%>
<h1>고객 구매 리스트</h1>

<%-- <input type="hidden" value="<%=order_seq%>" name="order_seq"> --%>
	<table border="1">
	<col width="100"/><col width="200"/><col width="200"/><col width="500"/>
	<col width="300"/><col width="50"/><col width="1000"/><col width="300"/>
	<col width="150"/><col width="150"/>
		<tr>
			<th>번호</th>
			<th>ID</th>
			<th>이름</th>
			<th>상품명</th>
			<th>옵션</th>
			<th>수량</th>
			<th>주소</th>
			<th>핸드폰 번호</th>
			<th>결제상태</th>
			<th>배송상태</th>
		</tr>
			<%
			if(olist.size()!=0){
				for(int i=0; i<olist.size();i++){
					memberDTO mdto = mdao.getMember(olist.get(i).getOrder_member_seq());
					productDTO pdto = pdao.getProduct(olist.get(i).getOrder_product_seq());
					productOptionDTO podto = pdao.getProductOption(olist.get(i).getOrder_product_seq(), olist.get(i).getOrder_productOption_seq());
					int order_amount = olist.get(i).getOrder_amount();
					int order_confirm = olist.get(i).getOrder_confirm();
					int order_seq = olist.get(i).getOrder_seq();
			%>
				<tr>
				<td><%=i %>
				<%-- <input type="hidden" value="<%=order_seq%>" name="order_seq"></td> --%>
				<td><%=mdto.getMember_id() %><%System.out.println("order_seq="+order_seq); %></td>
				<td><%=mdto.getMember_name() %></td>
				<td><%=pdto.getProduct_name() %></td>
				<td><%=podto.getProductOption_color() %></td>
				<td><%=order_amount %></td>
				<td>[<%=mdto.getMember_address() %>]&nbsp;<%=mdto.getMember_addressDetail() %></td>
				<td><%=mdto.getMember_phone() %></td>
				<td><%=order_confirm %></td>
				<td><button onclick="location.href='admin_purchase_listAf.jsp?order_seq=<%=order_seq %>'" value="<%=order_seq%>">배송완료</button></td>
				</tr>
			<%
					}
						
				}
			%>
	</table>




</body>
</html>