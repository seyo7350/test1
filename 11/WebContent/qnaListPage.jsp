<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A 목록</title>
<link rel="stylesheet" href="css/qnaListPage.css">

</head>
<body>
<div class="content" style="background-color: white;">
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
	
	 <div class="bbs-tit">
                           <!--  <span class="braket">[</span>
                            <strong>질문과 대답</strong>
                            <span class="braket">]</span> -->
                        </div>
                        <div class="bbs-table-list" style="background-color: white;">
                            <table summary="No, content,Name,Data,Hits">
                                <caption>일반게시판 게시글</caption>
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
                                    
                                    <c:forEach items="${qnaList}" var="dto"> <!-- 반복할땐 qnaList.qna_num 이렇게 바로 못쓰나? -->
                                    
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
</body>
</html>