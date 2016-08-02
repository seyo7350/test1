<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/qnaDetail.css">
</head>
<body>

<%-- <input type="hidden" name="seq" value="${detail.qna_num }">
<input type="hidden" name="pwd" value="${detail.qna_pwd }">
글번호 : ${detail.qna_num } <br>
조회수 : ${detail.qna_readCnt }<br>
주제 : ${detail.qna_subhead } <br>
제목 : <input type="text" name="title" value="${detail.qna_title }"><br>
작성자 : <input type="text" name="author" value="${detail.qna_author }"><br>
내용 : <textarea rows="10" name="content">${detail.qna_content }</textarea><br>
날짜 : ${detail.qna_writeday } --%>




<div id="content">
	<div class="page_title_area" align="center">
		<img src="image/notice_title.jpg">
	</div>
	
	   
                         <div class="bbs-table-view">
                            <table summary="게시글 보기">
                               <!--  <caption>게시글 보기</caption> -->
                                <thead>
                                    <tr>
                                        <th class="subject"><div class="tb-left">${noticeDetail.notice_title }</div></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="line">
                                            <div class="cont-sub-des">
                                                <div>
                                                    <span><em>작성일 :</em> ${noticeDetail.notice_writeday }</span>                                                </div>
                                                    
                                                <div>
                                                    <span><em>작성자 :</em> ${noticeDetail.notice_author }</span>
                                                                                                    </div>
                                                <div class="hit"><span><em>조회 :</em> ${noticeDetail.notice_readCnt } </span></div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="data-bd-cont">
                                                                                                <div id=MS_WritenBySEB>${noticeDetail.notice_title }</div>                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
</div>
<div id="comment_list_0"></div><form id="comment_form" name="comment" action="board.html?" method="post" autocomplete="off">
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
                                                        <label>이름</label><span><input type="text" name="cname"  class="MS_input_txt input-style input-style2" value="" onclick="CheckLogin()" onkeyup="CheckLogin()" placeholder=이름 /></span>
                                                        <label>비밀번호</label><span><input type="password" name="cpass"  class="MS_input_txt input-style input-style2" onclick="CheckLogin()" onkeyup="CheckLogin()" placeholder=패스워드 /> </span>
                                                    </div>
                                                    <div class="wrt"><textarea name="comment" onchange="Checklength(this);" onkeyup="Checklength(this);" onclick="CheckLogin()"   placeholder=내용></textarea><a href="javascript:comment_save('');"> <img src="image01/btn_h57_write.gif" alt="글쓰기" title="글쓰기" /></a></div>
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
                                        <a href="/board/board.html?code=cherry07&page=1&board_cate=&type=i" class="write custom_button button_medium_level4"><span>글쓰기</span></a>                                        <a href="noticeList.do" class="custom_button button_medium_level1"><span>목록보기</span></a>                                    </dd>
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
                                                   	                                                  <a href="detail.do?seq=${noticeDetail.notice_num }"> ${noticeDetail.notice_title }</a>
                                                                                                        <img src="image01/neo_new.gif" />                                                                                                    </div>
                                            </td>
                                            <td>
                                                <div class="tb-center">
                                                                                                                                                                    <div class='video-writer' style='padding-left:2px; padding-right:2px;' onMouseover="document.getElementById('MK_searchId_571893_00000').style.display='block'" onMouseout="document.getElementById('MK_searchId_571893_00000').style.display='none'">${noticeDetail.notice_author }                <div id='MK_searchId_571893_00000' class='search_id' style='display:none'>
                    <a href="Javascript:search_id('ahnjihunj')">회원게시글검색</a>
                </div></div>                                                                                                    </div>
                                            </td>
                                            <td><div class="tb-center">${noticeDetail.notice_writeday }</div></td>
                                            <td><div class="tb-center">${noticeDetail.notice_readCnt }</div></td>
                                        </tr>
                                                </tbody>
                                </table>
                            </div>
                        </div>


</body>
</html>