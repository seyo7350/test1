<%@page import="java.io.IOException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String savePath = "C:/Users/user/Desktop/git/2/11/WebContent/upload/product";
savePath += "/" + seq;

File file = new File(savePath);

if(!file.exists()) {
  file.mkdirs();
}

//파일 크기 15MB로 제한
int sizeLimit = 1024*1024*15;

ArrayList saveFiles = new ArrayList();
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

String product_name = multi.getParameter("product_name");
String product_price = multi.getParameter("product_price");
String product_point = multi.getParameter("product_point");
String product_info_about = multi.getParameter("product_info_about");
String product_info_detail_tip = multi.getParameter("product_info_detail_tip");
String product_info_size_tip = multi.getParameter("product_info_size_tip");
String product_info_washing_tip = multi.getParameter("product_info_washing_tip");

String product_option_count = multi.getParameter("option_count");





String product_photo_gif = multi.getFilesystemName("product_photo_gif");
String product_photo_main = multi.getFilesystemName("product_photo_main");
String product_photo_detail_main = multi.getFilesystemName("product_photo_detail_main");

String product_image_count = multi.getParameter("image_count");



/* 

//전송받은 데이터가 파일일 경우 getFilesystemName()으로 파일 이름을 받아올 수 있다.
String fileName = multi.getFilesystemName("file");

//업로드한 파일의 전체 경로를 DB에 저장하기 위함
String m_fileFullPath = savePath + "/" + fileName;

pdsDAO pdao = pdsDAO.getInstance();

boolean isS = pdao.writePDS(new pdsDTO(id, title, content, fileName));
//upload */

%>
<%=product_photo_gif%>


</body>
</html>