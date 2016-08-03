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
</head>
<body>
<%
productDAO pdao = productDAO.getInstance();
memberDAO mdao = memberDAO.getInstance();
orderDAO odao = orderDAO.getInstance();

List<orderDTO> olist = odao.getadminOrderList();

%>
<h1>고객 구매 리스트</h1>

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
	<tr>
		<!-- 번호 -->
		<td>
		<%
		for(int i=0; i<olist.size();i++){
		%>
			<%=i %>
		<%	
		}
		%>
		</td>
		<!-- 회원ID -->
		<td>
		<%
		for(int i=0; i<olist.size();i++){
			memberDTO mdto = mdao.getMember(olist.get(i).getOrder_member_seq());
		%>
			<%=mdto.getMember_id() %>
		<%	
		}
		%>
		</td>
		<!-- 이름 -->
		<td>
		<%
		for(int i=0; i<olist.size();i++){
			memberDTO mdto = mdao.getMember(olist.get(i).getOrder_member_seq());
		%>
			<%=mdto.getMember_name() %>
		<%	
		}
		%>
		</td>
		<!-- 상품명 -->
		<td>
		<%
		for(int i=0; i<olist.size();i++){
			productDTO pdto = pdao.getProduct(olist.get(i).getOrder_product_seq());
		%>
			<%=pdto.getProduct_name() %>
		<%	
		}
		%>
		</td>
		<!-- 옵션 -->
		<td>
		<%
		for(int i=0; i<olist.size();i++){
			productOptionDTO podto = pdao.getProductOption(olist.get(i).getOrder_product_seq(), olist.get(i).getOrder_productOption_seq());
		%>
			<%=podto.getProductOption_color() %>
		<%	
		}
		%>
		</td>
		<!-- 수량 -->
		<td>
		<%
		for(int i=0; i<olist.size();i++){	
			int order_amount = olist.get(i).getOrder_amount();
		%>
			<%=order_amount %>
		<%	
		}
		%>
		</td>
		<!-- 주소 -->
		<td>
		<%
		for(int i=0; i<olist.size();i++){
			memberDTO mdto = mdao.getMember(olist.get(i).getOrder_member_seq());
		%>
			[<%=mdto.getMember_address() %>]&nbsp;<%=mdto.getMember_addressDetail() %>
		<%	
		}
		%>
		</td>
		<!-- 핸드폰 번호 -->
		<td>
		<%
		for(int i=0; i<olist.size();i++){
			memberDTO mdto = mdao.getMember(olist.get(i).getOrder_member_seq());
		%>
			<%=mdto.getMember_phone() %>
		<%	
		}
		%>
		</td>
		<!-- 회원상태 -->
		<td>
		<%
		for(int i=0; i<olist.size();i++){
			int order_confirm = olist.get(i).getOrder_confirm();
		%>
			<%=order_confirm %>
		<%	
		}
		%>
		</td>
		<td>
		<%
			if(olist.size()!=0){
		%>
			<input type="button" value="배송완료"> <!-- 버튼 눌렀을 때  DB에 바뀌도록  script로  만들어야함 -->
		<%
			}
		%>
		</td>
	</tr>
</table>

</body>
</html>