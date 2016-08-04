<%@page import="qna.QnADTO"%>
<%@page import="qna.QnADAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="member.memberDAO" %>
<%@ page import="member.memberDTO" %>
<%@page import="product.productDTO"%>
<%@page import="product.productOptionDTO"%>
<%@page import="product.productDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>애플코코</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">
<style type="text/css">
a {
	color:#787878;
}
a:link{color:#787878;text-decoration:none;}
a:visited{Color:#787878;text-decoration:none;}
a:hover{color:#787878;text-decoration:none;}
a:active{Color:#787878;text-decoration:none;}

</style>
<link rel="stylesheet" href="css/qnaListPage.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/textRolling.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/jquery.bxslider.min.js"></script>


</head>
<body>

<%
QnADAO qDAO = new QnADAO();
List<QnADTO> qnaList = qDAO.qnaList();

/* Object obj = request.getAttribute("qnaList");
List<QnADTO> qnaList = (List<QnADTO>)obj; */
%>

<%!
   public Integer toInt(String x) {
   
      int a = 0;
      
      try{
         a = Integer.parseInt(x);
         
      }catch(Exception e){}
      
      return a;
      
}

%>

<%
   int pageNo = toInt(request.getParameter("pageNo"));

   if(pageNo < 1) {   //현재 페이지면
      pageNo = 1;
   }
   
   int total_record = qnaList.size();   // 총 레코드 갯수
   if(total_record == 0){
      total_record = 1;
   }
   
   int page_per_record_cnt = 10;   // 페이지 당 레코드 갯수
   
   int group_per_page_cnt = 5;      // 페이지 당 보여줄 번호 수 [1], [2], ....
   
   int record_end_no = pageNo*page_per_record_cnt;
   int record_start_no = record_end_no-(page_per_record_cnt);
   
   if(record_end_no>total_record){
      record_end_no = total_record;
   }
   
   int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt>0 ? 1:0);
   if(pageNo > total_page){
      pageNo = total_page;
   }
   
//  현재 페이지(정수) / 한페이지 당 보여줄 페지 번호 수(정수) + (그룹 번호는 현제 페이지(정수) % 한페이지 당 보여줄 페지 번호 수(정수)>0 ? 1 : 0)
 int group_no = pageNo/group_per_page_cnt+( pageNo%group_per_page_cnt>0 ? 1:0);
//    현재 그룹번호 = 현재페이지 / 페이지당 보여줄 번호수 (현재 페이지 % 페이지당 보여줄 번호 수 >0 ? 1:0)
// ex)    14      =   13(몫)      =    (66 / 5)      1   (1(나머지) =66 % 5)

 int page_eno = group_no*group_per_page_cnt;
//    현재 그룹 끝 번호 = 현재 그룹번호 * 페이지당 보여줄 번호 
// ex)    70      =   14   *   5

 int page_sno = page_eno-(group_per_page_cnt-1);
//     현재 그룹 시작 번호 = 현재 그룹 끝 번호 - (페이지당 보여줄 번호 수 -1)
// ex)    66   =   70 -    4 (5 -1)

 if(page_eno>total_page){
//    현재 그룹 끝 번호가 전체페이지 수 보다 클 경우
    page_eno=total_page;
//    현재 그룹 끝 번호와 = 전체페이지 수를 같게
 }

 int prev_pageno = page_sno-group_per_page_cnt;  // <<  *[이전]* [21],[22],[23]... [30] [다음]  >>
//    이전 페이지 번호   = 현재 그룹 시작 번호 - 페이지당 보여줄 번호수   
// ex)      46      =   51 - 5            

 int next_pageno = page_sno+group_per_page_cnt;   // <<  [이전] [21],[22],[23]... [30] *[다음]*  >>
//    다음 페이지 번호 = 현재 그룹 시작 번호 + 페이지당 보여줄 번호수
// ex)      56      =   51 - 5

 if(prev_pageno<1){
//    이전 페이지 번호가 1보다 작을 경우
    prev_pageno=1;
//    이전 페이지를 1로
 }

 if(next_pageno>total_page){
    next_pageno = page_eno;
//    다음 페이지보다 전체페이지 수보가 클경우
    //next_pageno=total_page/group_per_page_cnt*group_per_page_cnt+1;
//    next_pageno=total_page
//    다음 페이지 = 전체페이지수 / 페이지당 보여줄 번호수 * 페이지당 보여줄 번호수 + 1
// ex)            =    76 / 5 * 5 + 1   ????????
 }
 // [1][2][3].[10]

 // [11][12]

         
%>

<%-- 현재 페이지   (pageno)   : <%=pageno%><br />

전체 데이터 수   (total_record) : <%=total_record %><br />

한페이지 당 레코드 수   (page_per_record_cnt) : <%=page_per_record_cnt %><br />

한페이지 당 보여줄 페지 번호 수   (group_per_page_cnt) : <%=group_per_page_cnt %><br />




<hr />

레코드 시작 번호  (record_start_no) : <%=record_start_no%><br />

레코드 끝 번호    (record_end_no) : <%=record_end_no %><br />

전체페이지 수     (total_page)  : <%=total_page %><br />

<hr />

현재 그룹번호 [1] (group_no):  <%=group_no %><br />

현재 그룹 시작 번호(page_sno): <%= page_sno%><br />

현재 그룹 끝 번호  (page_eno): <%= page_eno%><br />

이전 페이지 번호   (prev_pageno) <%=prev_pageno%><br />

다음 페이지 번호   (next_pageno) <%=next_pageno%><br />

<hr /> --%>



<div class="side">
	<div class="side_inner">
		<div class="side_inner_top">
		            <%
Object ologin = session.getAttribute("login");
memberDTO mem = null;

if(ologin == null){
	%>
    <a href='login.jsp'>login</a>&nbsp;&nbsp;/&nbsp;&nbsp;
	<%
}else{
 %>
    <a href='logout.jsp'>logout</a>&nbsp;&nbsp;/&nbsp;&nbsp;
    <%} %>
			<a href='join.jsp'>join</a><br>
			shopping bag<br>
			<a href='myPage.jsp'>mypage</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href='index.jsp'>home</a>
		</div>
		<div class="side_inner_middle">	
			<hr>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OUTER
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="top.jsp">TOP</a>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BOTTOM
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ONEPIECE
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href ="noticeList.do">NOTICE</a>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href ="qnaList.do">Q&A</a>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;REVIEW		
			<hr>
		</div>
	</div>
</div>



      
      
<div class="container">
	<div class="container_top">
		<div class="logo">
			<a href='index.jsp'><img alt="로고" src="image/header.png"></a>
		</div>
	</div>	
	<div class="container_middle">
		<div class="content">
			
			
			
			<div class="qna_menu_area">
                  <h2><img src="image/board_qna_title.png" /></h2>
                  <ul>
                     <li class="first_child"><a href="/board/board.html?s_id=&code=cherry07&page=1&type=s&search_header=%BB%F3%C7%B0%B9%AE%C0%C7&search_type=&stext=%BB%F3%C7%B0%B9%AE%C0%C7"><img src="image/qna_menu1.png" onmouseover="this.src='image/qna_menu1_1.png'" onmouseout="this.src='image/qna_menu1.png'" /></a></li>
                     <li><a href="/board/board.html?s_id=&code=cherry07&page=1&type=s&search_header=%B1%B3%C8%AF%B9%DD%C7%B0&search_type=&stext=%B1%B3%C8%AF%B9%DD%C7%B0"><img src="image/qna_menu2.png" onmouseover="this.src='image/qna_menu2_1.png'" onmouseout="this.src='image/qna_menu2.png'" /></a></li>
                     <li><a href="/board/board.html?s_id=&code=cherry07&page=1&type=s&search_header=%B9%E8%BC%DB%B9%AE%C0%C7&search_type=&stext=%B9%E8%BC%DB%B9%AE%C0%C7"><img src="image/qna_menu3.png" onmouseover="this.src='image/qna_menu3_1.png'" onmouseout="this.src='image/qna_menu3.png'" /></a></li>
                     <li><a href="/board/board.html?s_id=&code=cherry07&page=1&type=s&search_header=%C3%EB%BC%D2%BA%AF%B0%E6&search_type=&stext=%C3%EB%BC%D2%BA%AF%B0%E6"><img src="image/qna_menu4.png" onmouseover="this.src='image/qna_menu4_1.png'" onmouseout="this.src='image/qna_menu4.png'" /></a></li>
                     <li><a href="/board/board.html?s_id=&code=cherry07&page=1&type=s&search_header=%B1%E2%C5%B8%B9%AE%C0%C7&search_type=&stext=%B1%E2%C5%B8%B9%AE%C0%C7"><img src="image/qna_menu5.png" onmouseover="this.src='image/qna_menu5_1.png'" onmouseout="this.src='image/qna_menu5.png'" /></a></li>
                     <li><a href="/board/board.html?s_id=&code=cherry07&page=1&type=s&search_header=%C7%D8%BF%DC%B9%E8%BC%DB&search_type=&stext=%C7%D8%BF%DC%B9%E8%BC%DB"><img src="image/qna_menu6.png" onmouseover="this.src='image/qna_menu6_1.png'" onmouseout="this.src='image/qna_menu6.png'" /></a></li>
                  </ul>
                  
   </div>
   
   
   <div class="page-body">
   
    <div class="bbs-tit">
                           <!--  <span class="braket">[</span>
                            <strong>질문과 대답</strong>
                            <span class="braket">]</span> -->
                        </div>
                        <div class="bbs-table-list" style="background-color: white;">
                            <table summary="No, content,Name,Data,Hits">
                                <colgroup>
                                    <col width="50" />
                                    <col width="30" />
                                    <!-- .상품정보가 있을 경우에만 나타남 -->
                                    <col width="75"/>
                                                                        <col width="*" />
                                    <col width="110" />
                                    <col width="90" />
                                    <col width="60" />
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" colspan="2"><div class="tb-center border_right">NO</div></th>
                                        <!-- .상품정보가 있을 경우에만 나타남 -->
                                        <th scope="col"><div class="tb-center">&nbsp;</div></th>
                                                                                <th scope="col"><div class="tb-center border_right">SUBJECT</div></th>
                                        <th scope="col"><div class="tb-center border_right">NAME</div></th>
                                        <th scope="col"><div class="tb-center border_right">DATE</div></th>
                                        <th scope="col"><div class="tb-center">HIT</div></th>
                                    </tr>
                                    
                                </thead>
                                <tbody> 
                                
                                    <!-- .공지사항 리스트 시작 -->
                                                                            <tr>
                                        <td><div class="tb-center"><img src="image/icon_box_arrow.gif" /></div></td>
                                        <td><div class="tb-left"><img src = "image/neo_notice.gif"/> </div></td>
                                        <!-- .상품정보가 있을 경우에만 나타남 -->
                                        <td colspan="2" >
                                                                                    <div class="tb-left">
                                                <img src = ""/> 
                                                <a href="/board/board.html?code=cherry07&page=1&type=v&board_cate=&num1=606692&num2=00000&s_id=&stext=%BB%F3%C7%B0%B9%AE%C0%C7&ssubject=&shname=&scontent=&search_header=%BB%F3%C7%B0%B9%AE%C0%C7&datekey=0&number=676&lock=N&flag=notice" style="font-weight: bold;"><font color=#A03F00><b>체리코코 카카오톡 1:1문의 OPEN 언제든지 Talk! 하세요</b></font></a>
                                                                                                                                                                                                 (1) 
                                                                                            </div>
                                        </td>
                                        <td>
                                            <div class="tb-center">
                                                                                            <img src = "image/MK_neo_cherry07_adminimg.gif"/>
                                                                                        </div>
                                        </td>
                                        <td><div class="tb-center">2015/11/16</div></td>
                                        <td><div class="tb-center">57148</div></td>
                                    </tr>
                                                                            <tr>
                                        <td><div class="tb-center"><img src="image/icon_box_arrow.gif" /></div></td>
                                        <td><div class="tb-left"><img src = "image/neo_notice.gif"/> </div></td>
                                        <!-- .상품정보가 있을 경우에만 나타남 -->
                                        <td colspan="2" >
                                                                                    <div class="tb-left">
                                                <img src = ""/> 
                                                <a href="/board/board.html?code=cherry07&page=1&type=v&board_cate=&num1=689521&num2=00000&s_id=&stext=%BB%F3%C7%B0%B9%AE%C0%C7&ssubject=&shname=&scontent=&search_header=%BB%F3%C7%B0%B9%AE%C0%C7&datekey=0&number=676&lock=N&flag=notice" style="font-weight: bold;"><font size=2><font color=#FF600F><b>주문장애 해결방법(System Error issue)</b></font></font></a>
                                                                                                                                                                                                 (1) 
                                                                                            </div>
                                        </td>
                                        <td>
                                            <div class="tb-center">
                                                                                            <img src = "image/MK_neo_cherry07_adminimg.gif"/>
                                                                                        </div>
                                        </td>
                                        <td><div class="tb-center">2014/06/23</div></td>
                                        <td><div class="tb-center">191861</div></td>
                                    </tr>
                                                                            <tr>
                                        <td><div class="tb-center"><img src="image/icon_box_arrow.gif" /></div></td>
                                        <td><div class="tb-left"><img src = "image/neo_notice.gif"/> </div></td>
                                        <!-- .상품정보가 있을 경우에만 나타남 -->
                                        <td colspan="2" >
                                                                                    <div class="tb-left">
                                                <img src = ""/> 
                                                <a href="/board/board.html?code=cherry07&page=1&type=v&board_cate=&num1=692826&num2=00000&s_id=&stext=%BB%F3%C7%B0%B9%AE%C0%C7&ssubject=&shname=&scontent=&search_header=%BB%F3%C7%B0%B9%AE%C0%C7&datekey=0&number=676&lock=N&flag=notice" style="font-weight: bold;">[해외배송] <font color=#009FAF><b>Global User Guide</b></font></a>
                                                                                                                                                                                                 (1) 
                                                                                            </div>
                                        </td>
                                        <td>
                                            <div class="tb-center">
                                                                                            <img src = "image/MK_neo_cherry07_adminimg.gif"/>
                                                                                        </div>
                                        </td>
                                        <td><div class="tb-center">2014/05/14</div></td>
                                        <td><div class="tb-center">208622</div></td>
                                    </tr>
                                                                            <tr>
                                        <td><div class="tb-center"><img src="image/icon_box_arrow.gif" /></div></td>
                                        <td><div class="tb-left"><img src = "image/neo_notice.gif"/> </div></td>
                                        <!-- .상품정보가 있을 경우에만 나타남 -->
                                        <td colspan="2" >
                                                                                    <div class="tb-left">
                                                <img src = ""/> 
                                                <a href="/board/board.html?code=cherry07&page=1&type=v&board_cate=&num1=692827&num2=00000&s_id=&stext=%BB%F3%C7%B0%B9%AE%C0%C7&ssubject=&shname=&scontent=&search_header=%BB%F3%C7%B0%B9%AE%C0%C7&datekey=0&number=676&lock=N&flag=notice" style="font-weight: bold;">[해외배송] <font color=#009FAF><b>How to Order?</b></font></a>
                                                                                                                                                                                                 (1) 
                                                                                            </div>
                                        </td>
                                        <td>
                                            <div class="tb-center">
                                                                                            <img src = "image/MK_neo_cherry07_adminimg.gif"/>
                                                                                        </div>
                                        </td>
                                        <td><div class="tb-center">2014/05/14</div></td>
                                        <td><div class="tb-center">190592</div></td>
                                    </tr>
                                                                            <!--. 공지사항 리스트 끝! -->   
                                    
                                  <%--   <c:forEach items="${qnaList}" var="dto"> <!-- 반복할땐 qnaList.qna_num 이렇게 바로 못쓰나? -->
                                    
                                    <tr>
                              <td><div class="tb-center">${dto.qna_num }</div></td>
                              <td><div class="tb-left"><img src="image/neo_lock.gif"></div></td>
                              <!-- .product image 관련 -->
                              <td><div class="tb-left"><img src="" height="50" align="middle"></div></td>
                              <td><div class="tb-left"><img src="" style="padding-left: 00px;"><a href="#">[상품명]</a>
                              <a href="detail.do?seq=${dto.qna_num }">[${dto.qna_subhead }] ${dto.qna_title }</a><img src="image/neo_new.gif"></div></td>                                                      
                              <td><div class="tb-center">${dto.qna_author }</div></td>
                              <td><div class="tb-center">${dto.qna_writeday }</div></td>
                              <td><div class="tb-center">${dto.qna_readCnt }</div></td>
                                    </tr> 
                                    
                                    </c:forEach> --%>
                                    
                                    <%
                                    if(qnaList == null || qnaList.size() == 0){
                                       %>
                                       <tr>
                                          <td colspan="5">작성된 글이 없습니다</td>
                                       </tr>
                                       <%
                                    }
                                    for(int i = record_start_no; i < record_start_no+page_per_record_cnt; i++){
                                       if(qnaList.size() <= i) {
                                          break;
                                       }
                                       QnADTO qDTO = qnaList.get(i);
                                       /* if(qDTO.getDel()==0) */
                                       %>
                                       <tr>
                                          <td><div class="tb-center"><%=qDTO.getQna_num() %></div></td>
                                          <td><div class="tb-left"><img src="image/neo_lock.gif"></div></td>
                                          <!-- .product image 관련 -->
                                          <td><div class="tb-left"><img src="" height="50" align="middle"></div></td>
                                          <td><div class="tb-left"><img src="" style="padding-left: 00px;"><a href="#">[상품명]</a>
                                          <a href="detail.do?seq=<%=qDTO.getQna_num() %>">[<%=qDTO.getQna_subhead() %>] <%=qDTO.getQna_title() %></a><img src=""></div></td>
                                          <td><div class="tb-center"><%=qDTO.getQna_author() %></div></td>
                                 <td><div class="tb-center"><%=qDTO.getQna_writeday() %></div></td>
                                 <td><div class="tb-center"><%=qDTO.getQna_readCnt() %></div></td>
                                       </tr>
                                          <%--}else{
                                       %>               
                                       <tr>
                                          <td><%=bdto.getSeq()%></td>
                                          <td>삭제된 글입니다</td>
                                          <td></td>
                                       </tr>
                                       <% --%>
                                       
                                       <%
                                    }
                                    %>
                                      
                                                                    
                                </tbody>
                                </table>
                                
      <p align="center">                          
      <a href="qnaListPage.jsp?pageNo=1">[맨앞으로]</a>
      <a href="qnaListPage.jsp?pageNo=<%=prev_pageno%>">&nbsp;&nbsp;<img src="image/step_arrow_pre.png" >&nbsp;&nbsp;</a>
      <%for(int i =page_sno;i<=page_eno;i++){
         %>      
         <a href="qnaListPage.jsp?pageNo=<%=i %>">      
         <%if(pageNo == i){ %>   
            <font size="5" color="gray">[<%=i %>]</font>
         <%}else{ %>   
            [<%=i %>]   
         <%}
         %>      
         </a>
      <%}
      %>      
      <a href="qnaListPage.jsp?pageNo=<%=next_pageno%>" style="text-decoration: none">&nbsp;&nbsp;<img src="image/step_arrow_next.png">&nbsp;&nbsp;</a>      
      <a href="qnaListPage.jsp?pageNo=<%=total_page %>">[맨뒤로]</a>   
      <br/><br/>
      </p>
      
      <!-- <button type="submit" onclick="window.location='bbswrite.jsp'">Write</button><button type="submit" onclick="window.location='logout.jsp'">Sign Out</button> -->
                                </div>
                                <dl class="bbs-link-btm">
                            <dd>
                                <a href="qnaWriteUI.do"><img src="image/detail_write_bt.png" /></a>
                            </dd>
                        </dl>
                        
                                 <div class="bbs-sch">
                        <form action="board.html" name="form1">
    <input type=hidden name=s_id value="">
    <input type=hidden name=code value="cherry07">
    <input type=hidden name=page value=1>
    <input type=hidden name=type value=s>
    <input type=hidden name=board_cate value="">
    <input type=hidden name="review_type" value="" /><!-- .검색 폼시작 -->
                                        <select name="search_header" class="brd-hd">
                <option value="선택">선택</option>
<option value="상품문의"selected>상품문의</option>
<option value="교환반품">교환반품</option>
<option value="배송문의">배송문의</option>
<option value="취소변경">취소변경</option>
<option value="기타문의">기타문의</option>
<option value="해외배송">해외배송</option>

            </select>                                 <select name="search_type" class="brd-st">                <option value="">선택</option>                <option value="hname">이름</option>
<option value="subject">제목</option>
<option value="content">내용</option>

            </select> 

                                <span class="key-wrap">
                                    <input type='text' name='stext' value='상품문의'  class="MS_input_txt inputborder" />                                    <a href="javascript:document.form1.submit();"><img src="image/search.gif" alt="검색" title="검색" style="vertical-align:middle;" /></a>
                                </span>
                        </form><!-- .검색 폼 끝 -->
			
			
				</div>
			</div>
			<!--  -->
			
		</div>
	</div>
	<div class="container_footer">
		<div class="footer_content">
	        <div class="footer_info">
	          <!--   <ul class="menu">
	                GUIDE/개인정보취급방침/..
	            </ul>  -->
	            <div class="address">
					<p id="info1">
						CALL 1600 - 7255<br>
						MON-FRI AM 10:00 - PM 5:00 / SAT AM 10:00 - PM 1:00<br>
						LUNCHI TIME PM 1:00 - 2:00 / SUN/HOLYDAY CLOSED<br><br>
						_BANK_ : WOORI 1005-501-330632, ....
					</p>
	                <p id="info2">
	                	법인명(상호): (주)애플코코  | 대표자(성명): 나대표 | 사업자 등록번호 안내: [777-77-77777] | 통신판매업 신고 제 2016 - 서울강북 - 77777호<br>
						전화: 1600-7255 | 주소: 서울특별시 마포구 백범로18(노고산동) 미화빌딩 3층 F반 강의실 -(주)애플코코 <br>
						교환 & 반품 주소 : 서울특별시 마포구 백범로18(노고산동) 미화빌딩 3층 F반 강의실 (주)애플코코 <br>
						개인정보관리책임자: 나책임 | Contact help@applekoko.com for more information.<br>
	                </p>
	            </div>	           
	        </div>
		</div>		
	</div><!-- container_footer -->
</div>

<a style="position: fixed; bottom: 700px; right: 240px;" href="#" title="Top"><img src="image/quick_top.png"></a>

<script type="text/javascript">
var real_search_keyword = new textScroll('scroll'); // 스크롤링 하고자하는 ul 엘리먼트의 id값을 인자로 넣습니다
real_search_keyword.name = "real_search_keyword"; // 인스턴스 네임을 등록합니다
real_search_keyword.start(); // 스크롤링 시작
</script>

<script type="text/javascript">
$(document).ready(function(){
 $('.slider').bxSlider({ 
   mode: 'fade',    //사라지는 모냥
   speen: 3000,     // 이미지변환 속도 기본 500
   pager: false,     //하단 페이지
   auto: true,     //자동시작
   captions: true,  //캡션
   controls: true //전 후 콘트롤 보이기 안보이기
 }); 
});
</script>


</body>
</html>







