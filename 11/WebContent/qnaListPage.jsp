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
<link rel="stylesheet" href="css/qnaListPage.css">

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
			<a href='myPage.jsp'>mypage</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href='index.jsp'>home</a>
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
			
			<!--  -->
			
			<div class="qna_menu_area">
						<h2></h2>
						<div>
						<img src="image/board_qna_title.png" />
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
                                    
                                   <%--  <c:forEach items="${qnaList}" var="dto"> <!-- 반복할땐 qnaList.qna_num 이렇게 바로 못쓰나? -->
                                    
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
                                    
                                    </c:forEach>
                                   	 --%>
                                                                    
                                </tbody>
                                </table>
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

            </select>							            <select name="search_type" class="brd-st">                <option value="">선택</option>                <option value="hname">이름</option>
<option value="subject">제목</option>
<option value="content">내용</option>

            </select> 

                                <span class="key-wrap">
                                    <input type='text' name='stext' value='상품문의'  class="MS_input_txt inputborder" />                                    <a href="javascript:document.form1.submit();"><img src="image/search.gif" alt="검색" title="검색" style="vertical-align:middle;" /></a>
                                </span>
                        </form><!-- .검색 폼 끝 -->
                        </div><!-- .bbs-sch -->	
	 					
	 					
                        
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







