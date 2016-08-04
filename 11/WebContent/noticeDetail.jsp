<%@page import="notice.NoticeReplyDTO"%>
<%@page import="java.util.List"%>
<%@page import="notice.NoticeReplyDAO"%>
<%@page import="notice.NoticeDAO"%>
<%@page import="notice.NoticeDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="product.productOptionDTO"%>
<%@page import="product.productDAO"%>
<%@page import="product.productDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="order.orderDTO"%>
<%@ page import="member.memberDTO" %>
<%@ page import="member.memberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 보기</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link rel="stylesheet" href="css/qnaDetail.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/textRolling.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/jquery.bxslider.min.js"></script>

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




<div id="content">
	<div class="page_title_area" align="center">
			<img src="image/notice_title.jpg" width="1030px">
	</div>
	
	   
                       <%-- <input type="hidden" name="seq" value="${detail.qna_num }">
<input type="hidden" name="pwd" value="${detail.qna_pwd }">
글번호 : ${detail.qna_num } <br>
조회수 : ${detail.qna_readCnt }<br>
주제 : ${detail.qna_subhead } <br>
제목 : <input type="text" name="title" value="${detail.qna_title }"><br>
작성자 : <input type="text" name="author" value="${detail.qna_author }"><br>
내용 : <textarea rows="10" name="content">${detail.qna_content }</textarea><br>
날짜 : ${detail.qna_writeday } --%>

<%
request.setCharacterEncoding("utf-8");

String s_notice_num = request.getParameter("seq").trim();

int notice_num = Integer.parseInt(s_notice_num);

NoticeDAO nDAO = new NoticeDAO();

NoticeDTO nDTO = nDAO.noticeDetail(s_notice_num);

NoticeReplyDAO noDAO = new NoticeReplyDAO();
List<NoticeReplyDTO> noList = noDAO.getNoticeAnswer(notice_num);


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

	if(pageNo < 1) {	//현재 페이지면
		pageNo = 1;
	}
	
	int total_record = noList.size();	// 총 레코드 갯수
	if(total_record == 0){
		total_record = 1;
	}
	int page_per_record_cnt = 10;	// 페이지 당 레코드 갯수
	int group_per_page_cnt = 5;		// 페이지 당 보여줄 번호 수 [1], [2], ....
	
	int record_end_no = pageNo*page_per_record_cnt;
	int record_start_no = record_end_no-(page_per_record_cnt);
	
	System.out.println(record_end_no);
	System.out.println(pageNo);
	System.out.println(record_start_no);
	
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
System.out.println("ddddddd" + (pageNo));

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



	
	   
                         <div class="bbs-table-view">
                            <table summary="게시글 보기">
                               <!--  <caption>게시글 보기</caption> -->
                                <thead>
                                    <tr>
                                        <th class="subject"><div class="tb-left"><%=nDTO.getNotice_title() %></div></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="line">
                                            <div class="cont-sub-des">
                                                <div>
                                                    <span><em>작성일 :</em><%=nDTO.getNotice_writeday() %></span>                                                </div>
                                                    
                                                <div>
                                                    <span><em>작성자 :</em><%=nDTO.getNotice_author() %></span>
                                                                                                    </div>
                                                <div class="hit"><span><em>조회 :</em><%=nDTO.getNotice_readCnt() %></span></div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="data-bd-cont">
                                                                                                <div id=MS_WritenBySEB><%=nDTO.getNotice_content() %></div>                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            
                            
                            
</div>

<div id="comment_list_0">
<table summary="코멘트 목록" class="comment-box">
<colgroup><col width="120"><col><col width="120"><col width="70"></colgroup>
	<thead>

	</thead>
	<tbody>

	<%
	if(noList == null || noList.size() == 0){
	%>	
		<tr>
			<td colspan="3"><div align="center" style="vertical-align: middle; margin-bottom: 10px;"><b style="color: #787878;">작성된 댓글이 없습니다</b></div></td>
		</tr>
		<%
	}
	for(int i = record_start_no; i < record_start_no+page_per_record_cnt; i++){
		if(noList.size() <= i){
			break;
		}
		NoticeReplyDTO noDTO = noList.get(i);
		%>

		<tr>
			<td>
				<div class="com-name"><%=noList.get(i).getNoticeAnswer_author() %> 
			</td>
			<td>
				<div class="com-name">
				<%=noList.get(i).getNoticeAnswer_content() %>
				</div>
			</td>
			
			<td>
				<div class="com-name">
					<span><%=noList.get(i).getNoticeAnswer_writeday() %>
				</div>
				
			</td>
			<td>
				<div class="com-name">
					<a href="#" onclick="">삭제</a></span>	<!-- 삭제 누르면 삭제 -->
				</div>
				
			</td>
		</tr>
		
	<%
	}
	%>
	</tbody>
	
	
</table>
<p align="center">                          
	<a href="noticeDetail.jsp?pageNo=1&seq=<%=notice_num%>">[맨앞으로]</a>
	<a href="noticeDetail.jsp?pageNo=<%=prev_pageno%>&seq=<%=notice_num%>">&nbsp;&nbsp;<img src="image/step_arrow_pre.png" >&nbsp;&nbsp;</a>
	<%
	for(int i =page_sno;i<=page_eno;i++){
	%>      
	<a href="noticeDetail.jsp?pageNo=<%=i %>&seq=<%=notice_num%>">      
	<%if(pageNo == i){ %>   
	<font size="5" color="gray">[<%=i %>]</font>
	<%}else{ %>   
	[<%=i %>]   
	<%}
	%>      
	</a>
	<%}
	%>      
	<a href="noticeDetail.jsp?pageNo=<%=next_pageno%>&seq=<%=notice_num%>" style="text-decoration: none">&nbsp;&nbsp;<img src="image/step_arrow_next.png">&nbsp;&nbsp;</a>      
	<a href="noticeDetail.jsp?pageNo=<%=total_page %>&seq=<%=notice_num%>">[맨뒤로]</a>   
 <br/><br/>
</p>
<div class="custom_paging">

</div>
</div>



<form id="comment_form" name="comment" action="noticeDetailAf.jsp" method="post" autocomplete="off">
<input type="hidden" name="page_type" value="board_view" />
<input type="hidden" name="formnum" value="0" />
<input type="hidden" name="code" value="cherry07" />
<input type="hidden" name="num1" value="571893" />
<input type="hidden" name="num2" value="00000" />
<input type="hidden" name="page" value="" />
<input type="hidden" name="lock" value="Y" />
<input type="hidden" name="type" value="v" />
<input type="hidden" name="type2" />
<input type="hidden" name="comnum" />
<input type="hidden" name="comtype" />
<input type="hidden" name="seq" value="<%=nDTO.getNotice_num() %>" />
<input type="text" name="___DUMMY___" readonly disabled style="display:none;" /><input type="hidden" name="secret" value="N" />                            <fieldset>
                               <!--  <legend>코멘트 쓰기</legend> -->
                                                                                                                                    <table summary="코멘트 쓰기" class="comment-box">
                                   <!--  <caption>코멘트 쓰기</caption> -->
                                    <colgroup>
                                        <col width="120" />
                                        <col />
                                        <col width="150" />                                                                            
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <td colspan="3" class="com-wrt-box">
                                                <div>
                                                    <div class="wrt">
                                                    	<%-- <%
                                                    	if(){}
                                                    	%> --%>
                                                        <label>이름</label><span><input type="text" name="cname"  class="MS_input_txt input-style input-style2" value="" onclick="CheckLogin()" onkeyup="CheckLogin()" placeholder=이름 /></span>
                                                        <%-- <label>이름</label> <%= %> --%> <!-- 로그인 되었을 때 뜨는 부분 => 로그인 세션에서 얻어오자 -->
                                                        <label>비밀번호</label><span><input type="password" name="cpass"  class="MS_input_txt input-style input-style2" onclick="CheckLogin()" onkeyup="CheckLogin()" placeholder=패스워드 /> </span>
                                                    </div>
                                                    <div class="wrt"><textarea name="comment" onchange="Checklength(this);" onkeyup="Checklength(this);" onclick="CheckLogin()"   placeholder=내용></textarea>
                                                    <input type="image" src="image01/btn_h57_write.gif" alt="글쓰기" title="글쓰기" style="vertical-align: top;"></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </fieldset>
</form>
                            <div class="view-link">
                                <dl class="con-link">
                                    <dt></dt>
                                    <dd>
                                        <a href="/board/board.html?code=cherry07&page=1&board_cate=&num1=571893&num2=00000&type=q&type2=u" class="custom_button button_medium_level1"><span>수정</span></a>                                        <a href="/board/board.html?code=cherry07&page=1&board_cate=&num1=571893&num2=00000&type=q&type2=d" class="custom_button button_medium_level1"><span>삭제</span></a>                                                                           </dd>
                                </dl>
                                <dl class="">
                                    <dt></dt>
                                    <dd>
                                        <!-- <a href="/board/board.html?code=cherry07&page=1&board_cate=&type=i" class="write custom_button button_medium_level4"><span>글쓰기</span></a>   -->                                      <a href="noticeList.do" class="custom_button button_medium_level1"><span>목록보기</span></a>                                    </dd>
                                </dl>                                                                
                            </div>
                            <div class="bbs-table-list">
                                <table summary="게시글 목록">
                                    <!-- <caption>게시글 목록</caption> -->
                                    <colgroup>
                                        <col />
                                        <col width="120" />
                                        <col width="90" />
                                        <col width="60" />
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th scope="col"><div class="tb-center">제목</div></th>
                                            <th scope="col"><div class="tb-center">작성자</div></th>
                                            <th scope="col"><div class="tb-center">작성일</div></th>
                                            <th scope="col"><div class="tb-center">조회</div></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                                    <tr>
                                            <td style="padding-left: 120px;">
                                                <div class="tb-left" style="margin-bottom: 7px;">
                                                    <img src="image/neo_default.gif" />
                                                    <!-- <img src="image01/neo_head.gif" style="margin-left: 00px" /> -->
                                                   	                                                  <a href="detail.do?seq=<%=nDTO.getNotice_num() %>"> <%=nDTO.getNotice_title() %></a>
                                                                                                        <img src="image01/neo_new.gif" />                                                                                                    </div>
                                            </td>
                                            <td>
                                                <div class="tb-center">
                                                                                                                                                                    <div class='video-writer' style='padding-left:2px; padding-right:2px;' onMouseover="document.getElementById('MK_searchId_571893_00000').style.display='block'" onMouseout="document.getElementById('MK_searchId_571893_00000').style.display='none'"><%=nDTO.getNotice_author() %>}                <div id='MK_searchId_571893_00000' class='search_id' style='display:none'>
                    <a href="Javascript:search_id('ahnjihunj')">회원게시글검색</a>
                </div></div>                                                                                                    </div>
                                            </td>
                                            <td><div class="tb-center"><%=nDTO.getNotice_writeday() %></div></td>
                                            <td><div class="tb-center"><%=nDTO.getNotice_readCnt() %> </div></td>
                                        </tr>
                                                </tbody>
                                </table>
                            </div>
                        </div>



</div>
	</div>
	<div class="container_footer">
		<div class="footer_content">
	        <div class="footer_info">
	            <!-- <ul class="menu">
	                GUIDE/개인정보취급방침/..
	            </ul> -->
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
</body>
</html>