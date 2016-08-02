
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 등록</title>
</head>
<body>

<script type="text/javascript">
var option_count = 0;
var image_count = 0;

$(document).ready(function(){
	$('#product_option_count').change(function() {
		if($('#product_option_count option:selected').val()==null){
			return;
		}
		
		var s = "";
		
		/* alert(cnt); */
		
		var indexa = $('tr').index($(this).parent().parent());
		
		
		for(var i = 0; i < option_count; i++){
			$('tr:eq('+(indexa+1)+')').remove();
		}
		
		for(var i = 0; i < option_count/4; i++){
			$('tr:eq('+(indexa+1)+')').remove();
		}
		
		for(var i=1; i<=$('#product_option_count option:selected').val(); i++){
			s+="<tr><th colspan='2'>옵션 입력</th><input type='hidden' name='option_count' value='" + $('#product_option_count option:selected').val() +"'></tr>";
			s+="<tr><th>COLOR</th><td><input type='text' name='productOption_color" + i + "'></td></tr>";
			s+="<tr><th>COLORCODE</th><td><input type='text' name='productOption_colorCode" + i + "'></td></tr>";
			s+="<tr><th>AMOUNT</th><td><input type='text' name='productOption_amount" + i + "'></td><tr>";
		}
		$('#option_cnt').after(s);
		
		option_count = 4*$('#product_option_count option:selected').val();
		
	});
	
	$('#product_image_count').change(function() {
		if($('#product_image_count option:selected').val()==null){
			return;
		}
		
		var s = "";
		
		
		var indexb = $('tr').index($(this).parent().parent());
		
		
		for(var i = 0; i < image_count; i++){
			$('tr:eq('+(indexb+1)+')').remove();
		}
		
		for(var i=1; i<=$('#product_image_count option:selected').val(); i++){
			s+="<tr><th>디테일이미지</th><td><input type='file' name='product_photo_detail" + i + "'></td><input type='hidden' name='image_count' value='" + $('#product_image_count option:selected').val() +"'></tr>";
		}
		$('#detail_cnt').after(s);
		
		image_count = $('#product_image_count option:selected').val();
		
	});
});
</script>

<h1>상품등록</h1>
<form action="product_addAf.jsp?seq=2" method="post" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<th colspan="2">기본 사항</th>
		</tr>
		<tr>
			<th>상품명</th>
			<td><input type="text" name="product_name"></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="text" name="product_price"></td>
		</tr>
		<tr>
			<th>적립금</th>
			<td><input type="text" name="product_point"></td>
		</tr>
		<tr>
		<th colspan="2">상세 내용</th>
		</tr>
		<tr>
			<th>ABOUT</th>
			<td><input type="text" name="product_info_about"></td>
		</tr>
		<tr>
			<th>DETAIL TIP</th>
			<td><input type="text" name="product_info_detail_tip"></td>
		</tr>
		<tr>
			<th>SIZE TIP</th>
			<td><input type="text" name="product_info_size_tip"></td>
		</tr>
		<tr>
			<th>WASHING TIP</th>
			<td><input type="text" name="product_info_washing_tip"></td>
		</tr>
		<tr>
			<th colspan="2" align="center">옵션사항</th>
		</tr>
		<tr id="option_cnt">
			<th>옵션 갯수</th>
			<td>
				<select id="product_option_count">
					<option value="">---갯수선택---</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</td>
		</tr>
		<tr id="gif_image">
			<th>gif이미지</th>
			<td><input type="file" name="product_photo_gif"></td>
		</tr>
		<tr id="main_image">
			<th>미리보기이미지</th>
			<td><input type="file" name="product_photo_main"></td>
		</tr>
		<tr id="main_image">
			<th>메인이미지</th>
			<td><input type="file" name="product_photo_detail_main"></td>
		</tr>
		<tr id="detail_cnt">
			<th>detail이미지 갯수</th>
			<td>
				<select id="product_image_count">
					<option value="">---갯수선택---</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="상품등록"></td>
		</tr>
	</table>
</form>

</body>
</html>