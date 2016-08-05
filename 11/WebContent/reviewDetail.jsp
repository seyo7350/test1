<%@page import="java.util.ArrayList"%>
<%@page import="qnaReply.AdminReplyDTO"%>
<%@page import="qnaReply.AdminReplyDAO"%>
<%@page import="java.util.List"%>
<%@page import="review.ReviewDAO" %>
<%@page import="review.ReviewDTO" %>
<%@ page import="member.memberDAO" %>
<%@ page import="member.memberDTO"%>
<%@ page import="product.productDAO" %>
<%@ page import="product.productDTO"%>
<%@ page import="product.productOptionDTO"%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>koko</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link rel="stylesheet" href="css/qnaDetail.css">


<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/textRolling.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/jquery.bxslider.min.js"></script>


</head>
<body>
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
			
		<%-- 
<%
AdminReplyDAO aDAO = new AdminReplyDAO();

List<AdminReplyDTO> answerList = aDAO.getAdminReplyList();

answerList.toString();
%> --%>

<%-- <input type="hidden" name="seq" value="${detail.qna_num }">
<input type="hidden" name="pwd" value="${detail.qna_pwd }">
글번호 : ${detail.qna_num } <br>
조회수 : ${detail.qna_readCnt }<br>
주제 : ${detail.qna_subhead } <br>
제목 : <input type="text" name="title" value="${detail.qna_title }"><br>
작성자 : <input type="text" name="author" value="${detail.qna_author }"><br>
내용 : <textarea rows="10" name="content">${detail.qna_content }</textarea><br>
날짜 : ${detail.qna_writeday } --%>

<%-- <%

request.setCharacterEncoding("utf-8");

AdminReplyDTO aDTO = (AdminReplyDTO)request.getAttribute("aDTO");

System.out.println(aDTO.toString());
%> --%>

<%
String s_review_num = request.getParameter("seq").trim();

int review_num = Integer.parseInt(s_review_num);
ReviewDAO rDAO = ReviewDAO.getInstance();
ReviewDTO rDTO = rDAO.ReviewDetail(review_num);

productDAO pdao = productDAO.getInstance();
productDTO pdto = pdao.getProduct(rDTO.getReview_product_seq());

productOptionDTO podto = pdao.getProductOption(rDTO.getReview_product_seq(), rDTO.getReview_productOption_seq());

System.out.println("dfdfdfd" + review_num);
%>



<div id="content">
	<div class="page_title_area">
		<h2>Review</h2>
	</div>
	
	    <dl class="prd-tinfo">
                            <dt>
                                <a href="/shop/shopdetail.html?branduid=29890&xcode=002&mcode=003&scode=&GfDT=bmt4W1w%3D"><img src="/shopimages/cherry07/0020030030003.gif" /></a>
                            </dt>
                            <dd>
                                <ul>
                                    <li class="name"><span class="tit">상 품 명:</span><a href="/shop/shopdetail.html?branduid=29890&xcode=002&mcode=003&scode=&GfDT=bmt4W1w%3D"><%=pdto.getProduct_name()%></a></li>
                                    <li class="price"><span class="tit">색 상:</span><strong><%=podto.getProductOption_color() %></strong></li>
                                </ul>
                            </dd>
                        </dl>
                        
                         <div class="bbs-table-view">
                            <table summary="게시글 보기">
                               <!--  <caption>게시글 보기</caption> -->
                                <thead>
                                    <tr>
                                        <th class="subject"><div class="tb-left"><%=rDTO.getReview_title() %></div></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr style="border-bottom: 1px solid lightgray;">
                                        <td class="line">
                                            <div class="cont-sub-des">
                                                <div>
                                                    <span><em>작성일 :</em> <%=rDTO.getReview_writeday() %></span>                                                </div>
                                                    
                                                <div>
                                                    <span><em>작성자 :</em> <%=rDTO.getReview_author() %></span>
                                                                                                    </div>
                                                <!-- <div class="hit"><span><em>조회 :</em> 4</span></div> -->
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="data-bd-cont">
                                            <div id=MS_WritenBySEB><%=rDTO.getReview_content() %></div>                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
</div>

<%-- <div id="comment_list_0">
<table summary="코멘트 목록" class="comment-box">
<colgroup><col width="120"><col><col width="120"><col width="70"></colgroup>
	<tbody>
		<%
		AdminReplyDAO aDAO = new AdminReplyDAO();
		List<AdminReplyDTO> replyList = aDAO.getQnAAnswer(qnaanswer_qna_num);
		
		for(int i = 0; i < replyList.size(); i++) {
		%>
		<tr>
		
			<td>
				<div class="com-name"><%=replyList.get(i).getQnaAnswer_author() %></div>
			</td>
			<td>
				<div class="com-name">
				<%=replyList.get(i).getQnaAnswer_content() %>
				
				</div>
			</td>
			
			<td>
				<div class="com-name">
					<span><%=replyList.get(i).getQnaAnswer_writeday() %></span></div>
				
			</td>
			<td>
				<div class="com-name">
					<a href="#" onclick="">삭제</a>	<!-- 삭제 누르면 삭제 -->
				</div>
				
			</td>
		
		</tr>
		<%
		}
		%>
	
	</tbody>
</table>
<div class="custom_paging">

</div>
</div> --%>



<%-- <form id="comment_form" name="comment" action="qnaDetailAf.jsp?seq=<%=qDTO.getQna_num() %>" method="post" autocomplete="off">
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
<input type="text" name="___DUMMY___" readonly disabled style="display:none;" /><input type="hidden" name="secret" value="N" />                         
  				
  				 <fieldset>
                                
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
                                                        <label>이름</label><span><input type="text" name="cname"  class="MS_input_txt input-style input-style2" value="" onclick="CheckLogin()" onkeyup="CheckLogin()" placeholder=이름 /></span>
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
                                        <a href="/board/board.html?code=cherry07&page=1&board_cate=&num1=571893&num2=00000&type=q&type2=u" class="custom_button button_medium_level1"><span>수정</span></a>                                     
                                        <a href="/board/board.html?code=cherry07&page=1&board_cate=&num1=571893&num2=00000&type=r&lock_re=Y" class="custom_button button_medium_level1"><span>답변</span></a>                                    </dd>
                                </dl>
                                <dl class="">
                                    <dt></dt>
                                    <dd>
                                    	<a href="qnaList.do" class="custom_button button_medium_level1"><span>목록보기</span></a>                                    </dd>
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
                                                    <img src="image01/neo_lock.gif" />
                                                    <!-- <img src="image01/neo_head.gif" style="margin-left: 00px" /> -->
                                                                                                       <a href="detail.do?seq=<%=qDTO.getQna_num() %>"> [<%=qDTO.getQna_subhead() %>] <%=qDTO.getQna_title() %></a>
                                                                                                        <img src="image01/neo_new.gif" />                                                                                                    </div>
                                            </td>
                                            <td>
                                                <div class="tb-center">
                                                                                                                                                                    <div class='video-writer' style='padding-left:2px; padding-right:5px;' onMouseover="document.getElementById('MK_searchId_571893_00000').style.display='block'" onMouseout="document.getElementById('MK_searchId_571893_00000').style.display='none'"><%=qDTO.getQna_author() %>               <div id='MK_searchId_571893_00000' class='search_id' style='display:none'>
                    <a href="Javascript:search_id('ahnjihunj')">회원게시글검색</a>
                </div></div>                                                                                                    </div>
                                            </td>
                                            <td><div class="tb-center"><%=qDTO.getQna_writeday() %> </div></td>
                                            <td><div class="tb-center"><%=qDTO.getQna_readCnt() %> </div></td>
                                        </tr>
                                        
                                                </tbody>
                                </table>
                            </div>
                        </div>
		 --%>

		
			
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
</html>