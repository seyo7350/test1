<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.memberDAO" %>
<%@ page import="member.memberDTO" %>
<%@page import="product.productDTO"%>
<%@page import="product.productOptionDTO"%>
<%@page import="product.productDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index_new_content</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/contentstyle.css">
</head>
<body>
<%
int outer_style_code = 101;
int top_style_code = 102;
int bottom_style_code = 103;
int onepice_style_code = 104;

productDAO pdao = productDAO.getInstance();

List<productDTO> outerList = pdao.getProductList(outer_style_code);
List<productDTO> topList = pdao.getProductList(top_style_code);
List<productDTO> bottomList = pdao.getProductList(bottom_style_code);
List<productDTO> onepiceList = pdao.getProductList(onepice_style_code);


%>
<!-- new content -->
				<div class="new_content_image">
					<img height="200" src="image/aaa.jpg"><br>
					<h2><img src="image/main_new_title.png"></h2>
				<div class="new_outer">
					<ul class="outer_new_content">
					<%
					for(int i=0; i<4 ;i++){
						productDTO pdto = outerList.get(i);
						if(pdto==null){
							break;
						}
						System.out.println(pdto.toString());
						List<productOptionDTO> outer_option_List = pdao.getProductOptionList(pdto.getProduct_seq());
					%>
						<li class="item">
                  		<div class="box">
                    		<a href="product_detail.jsp?product_seq=<%=pdto.getProduct_seq()%>&product_style_code=<%=outer_style_code %>" class="prdimg">
                    			<img src="upload/product/<%=pdto.getProduct_seq()%>/<%=pdto.getProduct_photo_gif()%>" alt="이미지 없음" onmouseover='src="upload/product/<%=pdto.getProduct_seq()%>/<%=pdto.getProduct_photo_main()%>"' onmouseout="src='upload/product/<%=pdto.getProduct_seq()%>/<%=pdto.getProduct_photo_gif()%>'"/>
                    		</a>
                  			<div class="product_contents_info">
                  				<p class="name">
                        			<a href="product_detail?product_seq=<%=pdto.getProduct_seq()%>"><%=pdto.getProduct_name()%></a>
                     			</p>
                     			<ul class="product_list_item">
                        			<li>
                           				<strong class="title title_price">판매가:</strong>
                           				<span class="product_price" style="text-align: center;">
                           				<%
                           				int price = pdto.getProduct_price();
                           				DecimalFormat df = new DecimalFormat("###,###,###");                           				
                           				%>
                           				<%=df.format(price)%>원
                           				</span>
                        			</li>
                        			<br>
                        			<li class="color_type">
                           				<strong class="title title_color">색상 :</strong>
                           				<%
                           				System.out.println("outer_option_List= "+outer_option_List.size());
                           				for(int j = 0; j < outer_option_List.size(); j++){
                           					productOptionDTO podto = outer_option_List.get(j);
                           					%>
                           					<span style="display: inline-block; *margin:0 2px; width: 10px; height: 10px; background: <%=podto.getProductOption_colorCode()%>; border:1px solid #c3c3c3;"></span>
                           					<%
                           				}
                           				%>
                        			</li>
                     			</ul>
                  			</div>
                  		</div>
               		</li>
					<%
					}
					%>
					</ul>
				</div>
				<div class="new_top">
					<ul class="top_new_content">
					<%
					for(int i=0; i<4 ;i++){
						productDTO pdto = topList.get(i);
						if(pdto==null){
							break;
						}
						System.out.println(pdto.toString());
						List<productOptionDTO> top_option_List = pdao.getProductOptionList(pdto.getProduct_seq());
					%>
						<li class="item">
                  		<div class="box">
                    		<a href="product_detail.jsp?product_seq=<%=pdto.getProduct_seq()%>&product_style_code=<%=top_style_code %>" class="prdimg">
                    			<img src="upload/product/<%=pdto.getProduct_seq()%>/<%=pdto.getProduct_photo_gif()%>" alt="이미지 없음" onmouseover='src="upload/product/<%=pdto.getProduct_seq()%>/<%=pdto.getProduct_photo_main()%>"' onmouseout="src='upload/product/<%=pdto.getProduct_seq()%>/<%=pdto.getProduct_photo_gif()%>'"/>
                    		</a>
                  			<div class="product_contents_info">
                  				<p class="name">
                        			<a href="product_detail?product_seq=<%=pdto.getProduct_seq()%>"><%=pdto.getProduct_name()%></a>
                     			</p>
                     			<ul class="product_list_item">
                        			<li>
                           				<strong class="title title_price">판매가:</strong>
                           				<span class="product_price" style="text-align: center;">
                           				<%
                           				int price = pdto.getProduct_price();
                           				DecimalFormat df = new DecimalFormat("###,###,###");                           				
                           				%>
                           				<%=df.format(price)%>원
                           				</span>
                        			</li>
                        			<br>
                        			<li class="color_type">
                           				<strong class="title title_color">색상 :</strong>
                           				<%
                           				System.out.println("outer_option_List= "+top_option_List.size());
                           				for(int j = 0; j < top_option_List.size(); j++){
                           					productOptionDTO podto = top_option_List.get(j);
                           					%>
                           					<span style="display: inline-block; *margin:0 2px; width: 10px; height: 10px; background: <%=podto.getProductOption_colorCode()%>; border:1px solid #c3c3c3;"></span>
                           					<%
                           				}
                           				%>
                        			</li>
                     			</ul>
                  			</div>
                  		</div>
               		</li>
					<%
					}
					%>
					</ul>
				</div>
				<div class="new_bottom">
					<ul class="bottom_new_content">
					<%
					for(int i=0; i<4 ;i++){
						productDTO pdto = bottomList.get(i);
						if(pdto==null){
							break;
						}
						System.out.println(pdto.toString());
						List<productOptionDTO> bottom_option_List = pdao.getProductOptionList(pdto.getProduct_seq());
					%>
						<li class="item">
                  		<div class="box">
                    		<a href="product_detail.jsp?product_seq=<%=pdto.getProduct_seq()%>&product_style_code=<%=bottom_style_code %>" class="prdimg">
                    			<img src="upload/product/<%=pdto.getProduct_seq()%>/<%=pdto.getProduct_photo_gif()%>" alt="이미지 없음" onmouseover='src="upload/product/<%=pdto.getProduct_seq()%>/<%=pdto.getProduct_photo_main()%>"' onmouseout="src='upload/product/<%=pdto.getProduct_seq()%>/<%=pdto.getProduct_photo_gif()%>'"/>
                    		</a>
                  			<div class="product_contents_info">
                  				<p class="name">
                        			<a href="product_detail?product_seq=<%=pdto.getProduct_seq()%>"><%=pdto.getProduct_name()%></a>
                     			</p>
                     			<ul class="product_list_item">
                        			<li>
                           				<strong class="title title_price">판매가:</strong>
                           				<span class="product_price" style="text-align: center;">
                           				<%
                           				int price = pdto.getProduct_price();
                           				DecimalFormat df = new DecimalFormat("###,###,###");                           				
                           				%>
                           				<%=df.format(price)%>원
                           				</span>
                        			</li>
                        			<br>
                        			<li class="color_type">
                           				<strong class="title title_color">색상 :</strong>
                           				<%
                           				System.out.println("outer_option_List= "+bottom_option_List.size());
                           				for(int j = 0; j < bottom_option_List.size(); j++){
                           					productOptionDTO podto = bottom_option_List.get(j);
                           					%>
                           					<span style="display: inline-block; *margin:0 2px; width: 10px; height: 10px; background: <%=podto.getProductOption_colorCode()%>; border:1px solid #c3c3c3;"></span>
                           					<%
                           				}
                           				%>
                        			</li>
                     			</ul>
                  			</div>
                  		</div>
               		</li>
					<%
					}
					%>
					</ul>
				</div>
				<div class="new_onepice">
					<ul class="onepice_new_content">
					<%
					for(int i=0; i<4 ;i++){
						productDTO pdto = onepiceList.get(i);
						if(pdto==null){
							break;
						}
						System.out.println(pdto.toString());
						List<productOptionDTO> onepice_option_List = pdao.getProductOptionList(pdto.getProduct_seq());
					%>
						<li class="item">
                  		<div class="box">
                    		<a href="product_detail.jsp?product_seq=<%=pdto.getProduct_seq()%>&product_style_code=<%=onepice_style_code %>" class="prdimg">
                    			<img src="upload/product/<%=pdto.getProduct_seq()%>/<%=pdto.getProduct_photo_gif()%>" alt="이미지 없음" onmouseover='src="upload/product/<%=pdto.getProduct_seq()%>/<%=pdto.getProduct_photo_main()%>"' onmouseout="src='upload/product/<%=pdto.getProduct_seq()%>/<%=pdto.getProduct_photo_gif()%>'"/>
                    		</a>
                  			<div class="product_contents_info">
                  				<p class="name">
                        			<a href="product_detail?product_seq=<%=pdto.getProduct_seq()%>"><%=pdto.getProduct_name()%></a>
                     			</p>
                     			<ul class="product_list_item">
                        			<li>
                           				<strong class="title title_price">판매가:</strong>
                           				<span class="product_price" style="text-align: center;">
                           				<%
                           				int price = pdto.getProduct_price();
                           				DecimalFormat df = new DecimalFormat("###,###,###");                           				
                           				%>
                           				<%=df.format(price)%>원
                           				</span>
                        			</li>
                        			<br>
                        			<li class="color_type">
                           				<strong class="title title_color">색상 :</strong>
                           				<%
                           				System.out.println("outer_option_List= "+onepice_option_List.size());
                           				for(int j = 0; j < onepice_option_List.size(); j++){
                           					productOptionDTO podto = onepice_option_List.get(j);
                           					%>
                           					<span style="display: inline-block; *margin:0 2px; width: 10px; height: 10px; background: <%=podto.getProductOption_colorCode()%>; border:1px solid #c3c3c3;"></span>
                           					<%
                           				}
                           				%>
                        			</li>
                     			</ul>
                  			</div>
                  		</div>
               		</li>
					<%
					}
					%>
					</ul>
			</div>
			</div>

</body>
</html>