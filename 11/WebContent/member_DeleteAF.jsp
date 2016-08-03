<%@ page import="member.memberDTO" %>
<%@ page import="member.memberDAO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>koko</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/textRolling.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/jquery.bxslider.min.js"></script>
<script>
function noSpaceForm(obj) { // 공백사용못하게
    var str_space = /\s/;  // 공백체크
    if(str_space.exec(obj.value)) { //공백 체크
        alert("해당 항목에는 공백을 사용할수 없습니다.");
        obj.focus();
        obj.value = obj.value.replace(' ',''); // 공백제거
        return false;
    }
}
</script>

<style type="text/css">
form { margin: 0 auto;  /* 회원관리 폼 700px로 고정 및 가운데 정렬 */width:700px;}
a {font-size: 18px; color:gray;}
table {border-collapse:collapse; text-align:center; border:3px solid lightgray;  align: center;} 
td{padding-bottom: 15px; padding-top: 15px; }
input {outline-style:none;}
input[type=password] { size: 30; font-size: 15px;}
</style> 

</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("password");
	
	String sseq = request.getParameter("seq");
	int seq = Integer.parseInt(sseq);
	
	memberDAO dao = memberDAO.getInstance();
	memberDTO mem = dao.login(new memberDTO(0, null, id, pwd, null, null, null, null, null, null, null, 0, 0, 0));

	if(mem != null && !mem.getMember_id().equals("")){
		session.setAttribute("login", mem);
		session.invalidate();
		%>
		<script type="text/javascript">
		alert("회원탈퇴를 시작합니다.");
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("패스워드가 틀립니다. 확인해주세요");
		location.href="member_Delete.jsp";
		</script>
		<%
	}
	%>
	
	<%
	boolean isS = dao.deleteMember(seq);
	 if(isS){
			%>
			<script type="text/javascript">
			alert("그동안의 성원에 감사합니다. 회원탈퇴 취소를 원하시면 관리자에게 문의해주세요");
			location.href="index.jsp";
			</script>
			<%
		}else{
			%>
			<script type="text/javascript">
			alert("처리 중 오류가 발생하였습니다. 정보를 제대로 기입하셨는지 확인하시고 이상이 있으면 관리자에게 문의하세요.");
			location.href="member_Delete.jsp";
			</script>
			<%
		}
		%> 

</body>
</html>