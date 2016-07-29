<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin</title>
</head>
<body>
<script language="javascript">
function selectControl(Opt,Obj) {
  var colorselect = document.getElementById("colorselect");
  var colorcodeadd = document.getElementById("color_codeselect");
  
  if (Opt == "coloradd") {
	  colorselect.options.add(new Option(Obj.value,Obj.value));
  }else if (Opt == "colorcodeadd") {
	  colorcodeadd.options.add(new Option(Obj.value,Obj.value));
  }  
}
</script>

	<form name="form1" id="form1" method="post">
		<div class="info">
			<h3 class="tit-prd">상품명</h3>
			<div class="table-opt">
				<table summary="판매가격, 적립금, 주문수량, 옵션, 사이즈">
					<colgroup>
						<col width="90">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">
								<div class="tb-left">code</div>
							<th>
							<td>
								<div class="prd-price detail_info_right">
									<input type="text">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<div class="tb-left">price</div>
							<th>
							<td>
								<div class="prd-price detail_info_right">
									<input type="text">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<div class="tb-left">mileage</div>
							<th>
							<td>
								<div class="prd-price detail_info_right">
									<input type="text">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<div class="tb-left">color</div>
							<th>
							<td>
								<select id="colorselect">
								</select> 
								<input type="button" value="항목추가" onclick="selectControl('coloradd',document.getElementById('color'))">
								<input type="text" id="color">
							</td>
						</tr>
						<tr>
							<th scope="row">
								<div class="tb-left">color-code</div>
							<th>
							<td>
								<select id="color_codeselect">
								</select> 
								<input type="button" value="항목추가"
								onclick="selectControl('colorcodeadd',document.getElementById('color-code'))">
								<input type="text" id="color-code">
							</td>
						</tr>
						<tr>
							<th scope="row">
								<div class="tb-left">amount</div>
							<th>
							<td>
								<input type="text" id="amount">
							</td>
						</tr>
					</tbody>
				</table>
				<input type="button" value="상품 등록">
			</div>
		</div>
	</form>

</body>
</html>