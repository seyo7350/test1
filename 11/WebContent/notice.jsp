<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/questionAndAnswer.css">

</head>
<body>
<div class="content_wrap_area" align="center">
<div class="page_title_area">
<h2>질문과 대답</h2>
</div>
							<form action="noticeWrite.do" method="post" id="frm">
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
                                                                                                <input id='bw_input_subject'   class="MS_input_txt input_style2" type='text' name='subject' value='' />                                                    <input type='checkbox' name='tag' value='ok'  /> HTML태그 허용<br />
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

</body>
</html>