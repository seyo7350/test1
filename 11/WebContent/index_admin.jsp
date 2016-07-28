<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin</title>
</head>
<body>
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
												<div class="prd-price detail_info_right"><input type="text"></div>
											</td>
										</tr>
										<tr>
											<th scope="row">
												<div class="tb-left">price</div>
											<th>
											<td>
												<div class="prd-price detail_info_right"><input type="text"></div>
											</td>
										</tr>
										<tr>
											<th scope="row">
												<div class="tb-left">mileage</div>
											<th>
											<td>
												<div class="prd-price detail_info_right"><input type="text"></div>
											</td>
										</tr>
										<tr>
											<th scope="row">
												<div class="tb-left">color</div>
											<th>
											<td>
												<div class="detail_info_right">
													<span id="MK_opt_0">
		    											<input type="hidden" id="optionlist_0" name="optionlist[]" value="">
		    												<select id="MK_p_s_0" onchange="p_add_product(this)" p_opt_cnt="0" mandatory="Y">
		       													<option value="">--옵션 선택--</option>
		        												<option value="0" price="29000" opt_price="0" opt_title="black/블랙" stock_cnt="-1">black/블랙</option>
		    												</select>
		    										</span>
												</div>
											</td>
										</tr>
									</tbody>
									</table> 
								</div>
							</div>
						</form>

</body>
</html>