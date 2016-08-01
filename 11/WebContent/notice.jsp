<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>koko</title>
<link href="css/notice.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/textRolling.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/jquery.bxslider.min.js"></script>
</head>
<body>
	<div class="side">
		<div class="side_inner">
			<div class="side_inner_top">
				<a href='login.jsp'>login</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a
					href='join.jsp'>join<br> shopping bag<br>mypage&nbsp;&nbsp;/&nbsp;&nbsp;home
				
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
					<img src="image/notice.jpg"  width='100%';/>
				</p>

				<div id="contentWrapper">
        <div id="contentWrap">
<span></span>            <div id="content">
                <div id="myHistory" class="section_myhistory">

                    <div class="page-body">

                        <div class="table-d2-list">
							<table summary="번호, 게시판, 제목, 날짜, hit수">
                                <caption></caption>
                                <colgroup>
                                    <col width="65">
                                     <col width="*">
                                    <col width="100">
                                    <col width="100">
                                    <col width="65">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="row"><div class="tb-center">번호</div></th>
                                        <th scope="row"><div class="tb-center">제목</div></th>
                                        <th scope="row"><div class="tb-center">작성자</div></th>
                                        <th scope="row"><div class="tb-center">날짜</div></th>
                                        <th scope="row"><div class="tb-center">hit수</div></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="5"><div class="tb-center">작성된 게시글이 없습니다.</div></td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td colspan="5"><div class="tb-center">작성된 습니다.</div></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

					<div class="page custom_paging">
							<p class="first"><a href="javascript:;">[처음]</a></p>
							<p class="prev"><a href="javascript:;">[이전]</a></p>
							<ol>
														</ol>
							<p class="next"><a href="javascript:;">[다음]</a></p>
							<p class="last"><a href="javascript:;">[끝]</a></p>
						</div>
		    </div><!-- .page-body -->
                </div><!-- #myHistory -->
            </div><!-- #content -->
        </div><!-- #contentWrap -->
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
						<p
							style="text-align: right; color: #6c6c6c; font-weight: bold; font-style: italic;">
							CALL 1600 - 7255<br> MON-FRI AM 10:00 - PM 5:00 / SAT AM
							10:00 - PM 1:00<br> LUNCHI TIME PM 1:00 - 2:00 / SUN/HOLYDAY
							CLOSED<br> <br> _BANK_ : WOORI 1005-501-330632, ....
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