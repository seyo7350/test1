<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/qnaListPage.css">
</head>
<body>
<div class="content" style="background-color: white;">
	<div class="qna_menu_area">
						<h2></h2>
						<div>
						<img src="image/notice_title.jpg" />
						</div>
						
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
                                    
                                    </c:forEach>
                                   	
                                                                    
                                </tbody>
                                </table>
                                </div>
                                <dl class="bbs-link-btm">
                            <dd>
                                <a href="noticeWriteUI.do"><img src="image/detail_write_bt.png" /></a>
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
                                     


                                <span class="key-wrap">
                                    <input type='text' name='stext' value='상품문의'  class="MS_input_txt inputborder" />                                    <a href="javascript:document.form1.submit();"><img src="image/search.gif" alt="검색" title="검색" style="vertical-align:middle;" /></a>
                                </span>
                        </form><!-- .검색 폼 끝 -->
                        </div><!-- .bbs-sch -->	
                                
	
	
</div>
</body>
</html>