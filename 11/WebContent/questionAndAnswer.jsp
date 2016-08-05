<%@ page import="member.memberDAO" %>
<%@ page import="member.memberDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link rel="stylesheet" href="css/questionAndAnswer.css">

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
		
		
<div class="content_wrap_area" align="center">
<div class="page_title_area">
<h2>질문과 대답</h2>
</div>
							<form action="qnaWrite.do" method="post" id="frm">
                                <table summary="">
                                    <!-- <caption>게시판 글쓰기</caption> -->
                                    <colgroup>
                                        <col width="150px" />
                                        <col width="" />
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><div>작성자</div></th>
                                            <td class="info"><div><input id='bw_input_writer' type='text' name='hname'  class="MS_input_txt input_style"  /></div></td>
                                        </tr>
										                                        <tr>
                                            <th><div>비밀번호</div></th>
                                            <td class="info">
                                                <div>
                                                    <input id='bw_input_passwd' type='password' name='passwd'  class="MS_input_txt input_style"  />                                                    <font color="red">자동 잠금 기능</font>                                                                                                    </div>
                                            </td>
                                        </tr>
										                                                                                <tr>
                                            <th><div>제목</div></th>
                                            <td class="info">
                                                <div class="title">
                                                    <select name='subhead'  class="MS_select" ><option value="선택">선택</option>
<option value="상품문의">상품문의</option>
<option value="교환반품">교환반품</option>
<option value="배송문의">배송문의</option>
<option value="취소변경">취소변경</option>
<option value="기타문의">기타문의</option>
<option value="해외배송">해외배송</option>
</select><br /><br>                                                    <input id='bw_input_subject'   class="MS_input_txt input_style2" type='text' name='subject' value='' />                                                    <input type='checkbox' name='tag' value='ok'  /> HTML태그 허용<br />
                                                                                                                                                                                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                       	<th colspan="2" id="forpadding">
                                       		
    											<!-- <textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:98%; height:412px;"></textarea><br>
    											<p></p>
    											<input type="button" id="savebutton" value="작성" />&nbsp;&nbsp;&nbsp;<input type="reset" id="canclebutton" value="취소"> -->
    											<jsp:include page="index01.html"></jsp:include>
                                       	</th>
                                        </tr>
                                        </tbody>
                                        </table>
											</form>
</div>

<!-- <script type="text/javascript">
$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "smarteditor/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }
    });
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    })
})

</script> -->

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