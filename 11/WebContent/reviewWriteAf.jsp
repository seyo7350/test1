<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="review.ReviewDAO"%>
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
String strMemberSeq = request.getParameter("memberSeq");
String strProductSeq = request.getParameter("productSeq");
String strProductOptionSeq = request.getParameter("productOptionSeq");

/* String savePath = "C:/Users/aa1/git/new01/test1/11/WebContent/upload/review"; */
String savePath = request.getServletContext().getRealPath("/");
savePath += "upload/review/" + strMemberSeq;

File file = new File(savePath);

if(!file.exists()) {
  file.mkdirs();
}

int sizeLimit = 1024*1024*15;

MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

String reviewImage = multi.getFilesystemName("forReviewImage");

System.out.println(reviewImage);

String reviewId = multi.getParameter("hname");
String title = multi.getParameter("subject");
String smarteditor = multi.getParameter("smarteditor");

System.out.println(title+"~");
System.out.println(smarteditor+"!");


/* System.out.println(memberSeq+"@");
System.out.println(productSeq+"#");
System.out.println(productOptionSeq+"$"); */

int memberSeq = Integer.parseInt(strMemberSeq);
int productSeq = Integer.parseInt(strProductSeq);
int productOptionSeq = Integer.parseInt(strProductOptionSeq);

ReviewDAO rDAO =  ReviewDAO.getInstance();
rDAO.writeReview(memberSeq, productSeq, productOptionSeq, reviewId, title, smarteditor, reviewImage);

response.sendRedirect("reviewListPage.jsp");
%>
<%-- <jsp:forward page="reviewListPage.jsp??memberSeq=<%=strMemberSeq %>&productSeq=<%=strProductSeq %>&productOptionSeq=<%=strProductOptionSeq %>&reviewId=<%=reviewId %>"></jsp:forward>
 --%></body>
</html>