<%@page import="java.util.ArrayList"%>
<%@page import="notice.NoticeDTO"%>
<%@page import="notice.NoticeDAO"%>
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
<link rel="stylesheet" href="css/noticeListPage.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/textRolling.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/jquery.bxslider.min.js"></script>

<script type="text/javascript">

document.onkeydown = function(e){
 key = (e) ? e.keyCode : event.keyCode;
 if(key==8 || key==116){
  if(e){
   e.preventDefault();
  }
  else{
   event.keyCode = 0;
   event.returnValue = false;
  }
 }
}
</script> 


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

<%
NoticeDAO nDAO = new NoticeDAO();
List<NoticeDTO> noticeList1 = nDAO.noticeList();
List<NoticeDTO> imList = nDAO.importantNoticeList();

List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
for(int i = 0; i < noticeList1.size(); i++){
	NoticeDTO ndto = noticeList1.get(i);
	if(ndto.getNotice_important()==1){
		continue;
	}else{
		noticeList.add(ndto);
	}
	
}

/* Object obj = request.getAttribute("noticeList");
List<NoticeDTO> noticeList = (List<NoticeDTO>)obj; */

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
   
   int total_record = noticeList.size();   // 총 레코드 갯수
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
	mem = (memberDTO)ologin;
 %>
    <a href='logout.jsp'>logout</a>&nbsp;&nbsp;/&nbsp;&nbsp;<%}%><a href='join.jsp'>join</a><br>
			<a href='shoppingbag.jsp'>shopping bag</a><br>
			<a href='mypage.jsp'>mypage</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href='index.jsp'>home</a>
		</div>
		<div class="side_inner_middle">	
			<hr>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="product.jsp?product_style_code=<%=101 %>">OUTER</a>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="product.jsp?product_style_code=<%=102 %>">TOP</a>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="product.jsp?product_style_code=<%=103 %>">BOTTOM</a>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="product.jsp?product_style_code=<%=104 %>">ONEPIECE</a>
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href ="noticeList.do">NOTICE</a>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href ="qnaList.do">Q&A</a>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href ="reviewListPage.jsp">REVIEW</a>
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
			
			<!--  -->
			
			
   <div class="qna_menu_area">
                  <h2></h2>
                  <div>
                  <img src="image/notice_title.jpg" />
                  </div>
                  
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
                                     
                                   <%--  
                                    <c:forEach items="${noticeList}" var="dto"> <!-- 반복할땐 qnaList.qna_num 이렇게 바로 못쓰나? -->
                                    
                                    <tr>
                              <td><div class="tb-center">${dto.notice_num }</div></td>
                              <td><div class="tb-left"><img src="image/neo_default.gif"></div></td>
                              <!-- .product image 관련 -->
                              <td><div class="tb-left"></div></td>
                              <td><div class="tb-left"><img src="" style="padding-left: 00px;"><a href="#"></a>
                              <a href="noticeView.do?seq=${dto.notice_num }"> ${dto.notice_title }</a><img src="image/neo_new.gif"></div></td>                                                      
                              <td><div class="tb-center">${dto.notice_author }</div></td>
                              <td><div class="tb-center">${dto.notice_writeday }</div></td>
                              <td><div class="tb-center">${dto.notice_readCnt }</div></td>
                                    </tr> 
                                    
                                    </c:forEach> --%>
                                      
                                       <%
                                       
                                    for(int i = 0; i < imList.size(); i++){
                                    	if(imList.size() <= i) {
                                            break;
                                         }
                                         NoticeDTO nDTO = imList.get(i);
                                         /* if(qDTO.getDel()==0) */
                                         %>
                                         <tr>
                                            <td colspan="2"><div class="tb-center"><img src="image/icon_box_arrow.gif"></div></td>
                                            <td><div class="tb-left"><img src="image/neo_notice.gif"></div></td>
                                            <!-- .product image 관련 -->
                                            <td><div class="tb-left"><a href="noticeView.do?seq=<%=nDTO.getNotice_num()%>"><%=nDTO.getNotice_title() %></a></div></td>
                                            <td><div class="tb-center"><%=nDTO.getNotice_author() %></div></td>
                                   <td><div class="tb-center"><%=nDTO.getNotice_writeday() %></div></td>
                                   <td><div class="tb-center"><%=nDTO.getNotice_readCnt() %></div></td>
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
 
									 if(noticeList == null || noticeList.size() == 0){
									     %>
									     <tr>
									        <td colspan="5">작성된 공지사항이 없습니다</td>
									     </tr>
									     <%
									  }
                                    
                                    for(int i = record_start_no; i < record_start_no+page_per_record_cnt; i++){
                                       if(noticeList.size() <= i) {
                                          break;
                                       }
                                       NoticeDTO nDTO = noticeList.get(i);
                                       /* if(qDTO.getDel()==0) */
                                       /* if(nDTO.getNotice_important()==1){
                                    	   continue;
                                       } */
                                       %>
                                       <tr>
                                          <td colspan="2"><div class="tb-center"><%=nDTO.getNotice_num() %></div></td>
                                          <td><div class="tb-left"><img src="image/neo_notice.gif"></div></td>
                                          <!-- .product image 관련 -->
                                          <td><div class="tb-left"><a href="noticeView.do?seq=<%=nDTO.getNotice_num()%>"><%=nDTO.getNotice_title() %></a></div></td>
                                          <td><div class="tb-center"><%=nDTO.getNotice_author() %></div></td>
                                 <td><div class="tb-center"><%=nDTO.getNotice_writeday() %></div></td>
                                 <td><div class="tb-center"><%=nDTO.getNotice_readCnt() %></div></td>
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
                           <a href="noticeListPage.jsp?pageNo=1">[맨앞으로]</a>
                           <a href="noticeListPage.jsp?pageNo=<%=prev_pageno%>">&nbsp;&nbsp;<img src="image/step_arrow_pre.png" >&nbsp;&nbsp;</a>
                           <%for(int i =page_sno;i<=page_eno;i++){
                              %>      
                              <a href="noticeListPage.jsp?pageNo=<%=i %>">      
                              <%if(pageNo == i){ %>   
                                 <font size="5" color="gray">[<%=i %>]</font>
                              <%}else{ %>   
                                 [<%=i %>]   
                              <%}
                              %>      
                              </a>
                           <%}
                           %>      
                           <a href="noticeListPage.jsp?pageNo=<%=next_pageno%>" style="text-decoration: none">&nbsp;&nbsp;<img src="image/step_arrow_next.png">&nbsp;&nbsp;</a>      
                           <a href="noticeListPage.jsp?pageNo=<%=total_page %>">[맨뒤로]</a>   
                           <br/><br/>
                          </p>
      
                                </div>
                                <dl class="bbs-link-btm">
                                <%
                                if(mem.getMember_auth()==0){
                                %>
                            <dd>
                                <a href="noticeWriteUI.do"><img src="image/detail_write_bt.png" /></a>
                            </dd>
                            <%
                                }
                            %>
                        </dl>
                        
                                 <div class="bbs-sch">
                        <form action="board.html" name="form1">
    <input type=hidden name=s_id value="">
    <input type=hidden name=code value="cherry07">
    <input type=hidden name=page value=1>
    <input type=hidden name=type value=s>
    <input type=hidden name=board_cate value="">
    <input type=hidden name="review_type" value="" /><!-- .검색 폼시작 -->
                                     


                                <span class="key-wrap">
                                    <input type='text' name='stext' value='상품문의'  class="MS_input_txt inputborder" />                                    <a href="javascript:document.form1.submit();"><img src="image/search.gif" alt="검색" title="검색" style="vertical-align:middle;" /></a>
                                </span>
                        </form><!-- .검색 폼 끝 -->
                        </div><!-- .bbs-sch -->   
                        
                        
			
			<!--  -->
			
			</div>
			
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







