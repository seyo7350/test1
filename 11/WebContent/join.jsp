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
<style type="text/css">
form {
	margin: 0 auto; /* 회원관리 폼 700px로 고정 및 가운데 정렬 */
	width: 700px;
}

a {
	font-size: 12px;
	color: gray;
}

input {
	outline-style: none;
}

input[type=text] {
	size: 30;
	font-size: 12px;
	border-left: 0px;
	border-right: 0px;
	border-top: 0px;
	border-bottom: 1px soild gray;
}

input[type=password] {
	size: 30;
	font-size: 12px;
	border-left: 0px;
	border-right: 0px;
	border-top: 0px;
	border-bottom: 1px soild gray;
}

img {
	vertical-align: middle;
	outline-style: none;
}

select {
	font-size: 10px;
}
</style>

<script>
	function noSpaceForm(obj) { // 공백사용못하게
		var str_space = /\s/; // 공백체크
		if (str_space.exec(obj.value)) { //공백 체크
			alert("해당 항목에는 공백을 사용할수 없습니다.");
			obj.focus();
			obj.value = obj.value.replace(' ', ''); // 공백제거
			return false;
		}
	}
</script>

</head>
<body>
	<div class="side">
		<div class="side_inner">
			<div class="side_inner_top">
				<a href='login.jsp'>login</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href='join.jsp'>join<br> 
				shopping bag<br>mypage&nbsp;&nbsp;/&nbsp;&nbsp;home 
			</div>
			<div class="side_inner_middle">
				<hr>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="product_detail.jsp">OUTER</a>
				<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TOP <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BOTTOM <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ONEPIECE <br> <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NOTICE <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q&A <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;REVIEW
				<hr>
			</div>
		</div>
	</div>





	<div class="container">
		<div class="container_top">
			<div class="logo">
				<img alt="로고" src="image/header.png">
			</div>
		</div>
		<div class="container_middle">
			<div class="content">

				<p align="center">
					<img src="image/join_img.jpg" width="700px" />
				</p>
				<p style="color: rgb(248, 194, 143);">일반회원</p>
				<hr style="border: soild 1px #8a8a8a;">
				<form action="joinAF.jsp" method="post">
					<!--이름입력  -->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> <a>이름 :
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</a> <input type="text" name="name" onkeyup="noSpaceForm(this)" /> <br>
					<!--아이디입력  -->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> <a>아이디 :
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a> <input
						type="text" name="id" onkeyup="noSpaceForm(this)" /> <input
						type="hidden" name="checkid" value=0> <img
						src="image/overlap_btn.jpg" width="50px" /> <br>
					<!--비밀번호입력  -->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> <a>비밀번호 :
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <input type="password"
						name="password" onkeyup="noSpaceForm(this)" /> <a
						style="font-size: 8px">*영문 대소문자/숫자/특수문자를 혼용하여 10~16자</a> <br>
					<!--비밀번호 확인 -->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> <a>비밀번호 확인
						:&nbsp;&nbsp;</a> <input type="password" name="Chk_password"
						onkeyup="noSpaceForm(this)" /> <br>
					<!--생일 성별 -->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> <a>생년월일 :
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<!--태어난 년도 선택  -->
					<select name="year">
						<%
							for (int i = 1920; i <= 2016; i++) {
						%>
						<option <%=(i + "")%> value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select><a>년</a> &nbsp;

					<!--태어난 월 선택  -->
					<select name="month">
						<%
							for (int i = 1; i <= 12; i++) {
						%>
						<option <%=(i + "")%> value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select><a>월</a> &nbsp;

					<!--태어난 일 선택  -->
					<select name="day">
						<%
							for (int i = 1; i <= 31; i++) {
						%>
						<option <%=(i + "")%> value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select><a>일</a> <br>
					<!--성별-->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> <a>성별
						:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<input type="radio" name="gender" value="male" checked="checked"><a
						style="font-size: 10px">남성</a> <input type="radio" name="gender"
						value="female"><a style="font-size: 10px">여성</a> <br>
					<!--우편번호-->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> <a>우편번호
						:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<!--우편번호 찾기  -->
					<input type="text" name="zip" id="zip" readonly="readonly">
					<img src="image/address_btn.jpg" width="70px" onclick="findZip()"><br>

					<div id="wrap"
						style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
						<img
							src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
							id="btnFoldWrap"
							style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
							onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> <a>집주소 :
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</a> <input type="text" size="42" name="address1" readonly="readonly"
						id="sample3_address" class="d_form large">

					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script>
						// 우편번호 찾기 찾기 화면을 넣을 element
						var element_wrap = document.getElementById('wrap');

						function foldDaumPostcode() {
							// iframe을 넣은 element를 안보이게 한다.
							element_wrap.style.display = 'none';
						}

						function findZip() {
							// 현재 scroll 위치를 저장해놓는다.
							var currentScroll = Math.max(
									document.body.scrollTop,
									document.documentElement.scrollTop);
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 각 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var fullAddr = data.address; // 최종 주소 변수
											var extraAddr = ''; // 조합형 주소 변수

											// 기본 주소가 도로명 타입일때 조합한다.
											if (data.addressType === 'R') {
												//법정동명이 있을 경우 추가한다.
												if (data.bname !== '') {
													extraAddr += data.bname;
												}
												// 건물명이 있을 경우 추가한다.
												if (data.buildingName !== '') {
													extraAddr += (extraAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}
												// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
												fullAddr += (extraAddr !== '' ? ' ('
														+ extraAddr + ')'
														: '');
											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
											document
													.getElementById('sample3_address').value = fullAddr;

											// iframe을 넣은 element를 안보이게 한다.
											// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
											element_wrap.style.display = 'none';

											// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
											document.body.scrollTop = currentScroll;
										},
										// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
										onresize : function(size) {
											element_wrap.style.height = size.height
													+ 'px';
										},
										width : '100%',
										height : '100%'
									}).embed(element_wrap);

							// iframe을 넣은 element를 보이게 한다.
							element_wrap.style.display = 'block';
						}
					</script>

					<br>
					<!--상세주소  -->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> <a>상세주소 :
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a> <input
						type="text" name="address2" /> <br>
					<!--연락처  -->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> <a>연락처 :
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <input
						type="text" name="phone" onkeyup="noSpaceForm(this)" /> <a
						style="font-size: 8px">*숫자만 입력해주세요</a> <br>
					<!--이메일  -->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> <a>이메일 :
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <input
						type="text" size="10" name="email1" onkeyup="noSpaceForm(this)" />
					<a>&nbsp;<b>@</b>&nbsp;
					</a> <input type="text" size="6" name="email2" id="email2"
						onkeyup="noSpaceForm(this)" style="font-size: 8px;" disabled
						value="naver.com" />

					<!--도메인 선택  -->
					<select name="selectEmail" id="selectEmail">
						<option value="naver.com" selected="selected">naver.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="outlook.com">outlook.com</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="chol.com">chol.com</option>
						<option value="1">직접입력</option>
					</select>

					<script type="text/javascript">
						//이메일 입력방식 선택
						$('#selectEmail').change(function() {
							$("#selectEmail option:selected").each(function() {

								if ($(this).val() == '1') { //직접입력일 경우
									$("#email2").val(''); //값 초기화
									$("#email2").attr("disabled", false); //활성화
								} else { //직접입력이 아닐경우
									$("#email2").val($(this).text()); //선택값 입력
									$("#email2").attr("disabled", true); //비활성화
								}
							});
						});
					</script>

					<img src="image/overlap_btn.jpg" width="50px" /> <a
						style="font-size: 8px">*한메일(hanmail.net) 사용시 정보 메일이 수신이 안될 수
						있습니다.</a> <br>
					<p align="center">
						<input TYPE="IMAGE" src="image/ok_btn.jpg" name="submit"	value="submit" width="90px" /> &nbsp;&nbsp;
						<a href='index.jsp'><img src="image/cancel_btn.jpg" width="90px" style="vertical-align: top;"/></a>
					</p>
				</form>



			</div>
		</div>
		<div class="container_footer">
			<div class="footer_content">
				<div class="footer_info">
					<!-- <ul class="menu">
	                GUIDE/개인정보취급방침/..
	            </ul> -->
					<div class="address">
						<p
							style="text-align: right; color: #6c6c6c; font-weight: bold; font-style: italic;">
							CALL 1600 - 7255<br> MON-FRI AM 10:00 - PM 5:00 / SAT AM
							10:00 - PM 1:00<br> LUNCHI TIME PM 1:00 - 2:00 / SUN/HOLYDAY
							CLOSED<br>
							<br> _BANK_ : WOORI 1005-501-330632, ....
						</p>
						<p style="text-align: right; color: #9c9c9c;">
							법인명(상호): (주)체리코코 | 대표자(성명): 지동헌 | 사업자 등록번호 안내: [215-87-15936] |
							통신판매업 신고 제 2011 - 서울강남 - 03186호<br> 전화: 1600-7255 | 주소:
							서울특별시 강남구 신사동 517-4 M SPACE 빌딩 2층 (강남대로158길 26) -(주)체리코코 <br>
							교환 & 반품 주소 : 서울 성북구 종암동 57-39번지 CJ대한통운 종암대리점 (주)체리코코 <br>
							개인정보관리책임자: 지동헌 | Contact help@cherrykoko.com for more
							information.<br>
						</p>
						<p class="copyright" style="text-align: right;">
							<img
								src="http://img29.makeshop.co.kr/design/cherry07/trend9/cherrycoco/imgs/footer_copy_img.png" />
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- container_footer -->
	</div>

	<a style="position: fixed; bottom: 700px; right: 240px;" href="#"
		title="Top"><img src="image/quick_top.png"></a>

	<script type="text/javascript">
		var real_search_keyword = new textScroll('scroll'); // 스크롤링 하고자하는 ul 엘리먼트의 id값을 인자로 넣습니다
		real_search_keyword.name = "real_search_keyword"; // 인스턴스 네임을 등록합니다
		real_search_keyword.start(); // 스크롤링 시작
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('.slider').bxSlider({
				mode : 'fade', //사라지는 모냥
				speen : 3000, // 이미지변환 속도 기본 500
				pager : false, //하단 페이지
				auto : true, //자동시작
				captions : true, //캡션
				controls : true
			//전 후 콘트롤 보이기 안보이기
			});
		});
	</script>


</body>
</html>