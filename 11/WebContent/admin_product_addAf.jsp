<%@page import="product.productDAO"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="product.productOptionDTO" %>
<%@page import="product.productDTO" %>
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
	/*-------------------------------------------------------------------*/
// upload

request.setCharacterEncoding("utf-8");
String seq = request.getParameter("seq");

//파일이 저장될 서버의 경로. 되도록이면 getRealPath를 이용하자.
String savePath = "C:/Users/John/git/test1/11/WebContent/upload/product"; 
/* String savePath = "C:/Users/user/Desktop/git/2/11/WebContent/upload/product"; */
savePath += "/" + seq;

File file = new File(savePath);

if(!file.exists()) {
  file.mkdirs();
}

//파일 크기 15MB로 제한
int sizeLimit = 1024*1024*15;

ArrayList<String> saveFiles = new ArrayList<String>();
ArrayList origFiles = new ArrayList();

//↓ request 객체,               ↓ 저장될 서버 경로,       ↓ 파일 최대 크기,    ↓ 인코딩 방식,       ↓ 같은 이름의 파일명 방지 처리
//(HttpServletRequest request, String saveDirectory, int maxPostSize, String encoding, FileRenamePolicy policy)
//아래와 같이 MultipartRequest를 생성만 해주면 파일이 업로드 된다.(파일 자체의 업로드 완료)
MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
Enumeration files = multi.getFileNames();
while(files.hasMoreElements()){
	String name = (String)files.nextElement();
	saveFiles.add(multi.getFilesystemName(name));
	origFiles.add(multi.getOriginalFileName(name));
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
List<productOptionDTO> product_list = new ArrayList<productOptionDTO>();
/*
String f_ext = "";

int j = 1;

for(int i = 3; i < saveFiles.size(); i++){
	File file1 = new File(savePath+"/"+saveFiles.get(i));
	File file2 = new File(savePath+"/"+(j++)+saveFiles.get(i).substring(saveFiles.get(i).lastIndexOf(".")));
	
	file1.renameTo(file2);
}
 */
String product_name = multi.getParameter("product_name");
String s_product_price = multi.getParameter("product_price");
int product_price = Integer.parseInt(s_product_price);

String s_product_point = multi.getParameter("product_point");
int product_point = Integer.parseInt(s_product_point);


String product_info_about ="";
for(int i=1; i<=5; i++){
	product_info_about += multi.getParameter("product_info_about"+i);
	if(i!=5){
		product_info_about += "|";
	}
}

String product_info_detail_tip ="";
for(int i=1; i<=5; i++){
	product_info_detail_tip += multi.getParameter("product_info_detail_tip"+i);
	if(i!=5){
		product_info_detail_tip += "|";
	}
}

String product_info_size_tip ="";
for(int i=1; i<=5; i++){
	product_info_size_tip += multi.getParameter("product_info_size_tip"+i);
	if(i!=5){
		product_info_size_tip += "|";
	}
}

String product_info_washing_tip ="";
for(int i=1; i<=5; i++){
	product_info_washing_tip += multi.getParameter("product_info_washing_tip"+i);
	if(i!=5){
		product_info_washing_tip += "|";
	}
}

System.out.println("product_info_about="+product_info_about+"product_info_detail_tip="+product_info_detail_tip
					+"product_info_size_tip="+product_info_size_tip+"product_info_washing_tip"+product_info_washing_tip);

String s_product_option_count = multi.getParameter("option_count");
int product_option_count = Integer.parseInt(s_product_option_count);
//System.out.println("product_option_count=" + product_option_count);
String productOption_color = "";
String productOption_colorCode = "";
String s_productOption_amount = "";

for(int i=1; i<=product_option_count; i++){
	productOptionDTO poodto = new productOptionDTO();
	
	productOption_color = multi.getParameter("productOption_color"+i);
 	productOption_colorCode = multi.getParameter("productOption_colorCode"+i);
	s_productOption_amount = multi.getParameter("productOption_amount"+i);
	int productOption_amount=Integer.parseInt(s_productOption_amount);
	
	poodto.setProductOption_color(productOption_color);
	poodto.setProductOption_colorCode(productOption_colorCode);
	poodto.setProductOption_amount(productOption_amount);
	
	product_list.add(poodto);
	System.out.println(product_list.toString());
}

String product_photo_gif = multi.getFilesystemName("product_photo_gif");
String product_photo_main = multi.getFilesystemName("product_photo_main");
String product_photo_detail_main = multi.getFilesystemName("product_photo_detail_main");

String s_product_photo_detail_count = multi.getParameter("image_count");
int product_photo_detail_count = Integer.parseInt(s_product_photo_detail_count);
System.out.println("product_photo_detail_count=" + product_photo_detail_count);

String product_photo_detail = "";

for(int i=1; i<=product_photo_detail_count; i++){
	product_photo_detail += multi.getFilesystemName("product_photo_detail"+i);
	if(i!=product_photo_detail_count){
		product_photo_detail += "|";
	} 
} 
System.out.println(product_photo_detail); 

String s_product_style_code = multi.getParameter("product_style_code");
int product_style_code = Integer.parseInt(s_product_style_code);

productDAO dao = productDAO.getInstance();
	boolean isS = dao.insertProduct(new productDTO(0, product_name, product_price, product_point,
			product_option_count, product_info_about, product_info_detail_tip, product_info_size_tip,
			product_info_washing_tip, product_photo_gif, product_photo_main, product_photo_detail_main,
			product_photo_detail, product_style_code, null, 0), product_list);


if(isS){
%>
	<script type="text/javascript">
		alert("상품등록이 되었습니다.");
		location.href = "index_admin.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
		alert("다시 가입을 해주세요");
		location.href = "product_add.jsp";
	</script>
<%
}
%>


</body>
</html>