var selected_option_cnt = 0;
var total_price = 0;

function number_format (number, decimals, dec_point, thousands_sep) {
    number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
    var n = !isFinite(+number) ? 0 : +number,
        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
        sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
        dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
        s = '',
        toFixedFix = function (n, prec) {
            var k = Math.pow(10, prec);
            return '' + Math.round(n * k) / k;
        };
    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
    if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
    }
    return s.join(dec);
}

function change_amount(sign, code) {
    //TODO - 재고상태 체크
    per_price  = parseInt(document.getElementById('MK_li_' + code).getAttribute('price'), 10);
    now_amount = parseInt(document.getElementById('MK_p_cnt_' + code).value, 10);
        
    if (sign == '+') {
        now_amount++;;
        document.getElementById('MK_p_cnt_' + code).value       = now_amount;
        document.getElementById('MK_p_price_' + code).innerHTML = number_format(per_price * now_amount) + "원";
        total_price += per_price;
        cal_total();
    } else {
        if (now_amount > 1) {
            now_amount--;
            //total_amount--;
            document.getElementById('MK_p_cnt_' + code).value       = now_amount;
            document.getElementById('MK_p_price_' + code).innerHTML = number_format(per_price * now_amount) + "원";
            total_price -= per_price;
            cal_total();
        }
    }
}

function add_product(obj){
	var i = document.getElementById('MK_p_s_0').selectedIndex;
	var price = obj.options[i].getAttribute('price');
	var opt_title = obj.options[i].getAttribute('opt_title');
	
	var j = obj.value;
	
	if(j==''){
		return;
	}
	
	for(var a = 0; a < document.getElementById('MK_innerOpt_01').children.length; a++){
		if(document.getElementById('MK_innerOpt_01').children[a].getAttribute('id')=='MK_li_'+j){
			alert('이미 추가된 옵션 입니다.');
			return;
		}		
	}
	
	total_price += parseInt(price);
	cal_total();
	
	elem = document.createElement('li');
	elem.setAttribute('id', 'MK_li_' + j );
	elem.setAttribute('price', price);
	elem.setAttribute('optionindex', opt_title);
	var _option = Array();
	_option.push('<span class="MK_p-name">' + opt_title + '</span>');
	_option.push('<div class="MK_qty-ctrl">');
	_option.push('<input type="hidden" name="productOption_seq" value="'+j+'">');
	_option.push('<input type="text" class="MK_count" value="1" name="MK_p_cnt_' + j + '" id="MK_p_cnt_' + j + '" readonly style="ime-mode:disabled;">');
	_option.push('<a href="javascript:change_amount(\'+\', \'' + j + '\');" class="MK_btn-up">');
	_option.push('<img src="image/basket_up.gif" border="0">');
	_option.push('</a>');
	_option.push('<a href="javascript:change_amount(\'-\', \'' + j + '\');" class="MK_btn-dw">');
	_option.push('<img src="image/basket_down.gif" border="0">');
	_option.push('</a>');
	_option.push('</div>');
	_option.push('<strong class="MK_price">');
	_option.push('<span id="MK_p_price_' + j + '">');
	_option.push(price+"원");
	_option.push('</span>');
	_option.push('</strong>');
	_option.push('<a class="MK_btn-del" href="javascript:del_product(\'' + j + '\');" id="MK_btn_del_' + j + '">');
	_option.push('<img src="image/btn_del.gif">');
	_option.push('</a>');
	elem.innerHTML = _option.join("\n");
	document.getElementById('MK_innerOpt_01').appendChild(elem);
	
	selected_option_cnt++;
}

function del_product(code) {
    del_Elem = document.getElementById('MK_li_' + code);
    
    document.getElementById('MK_innerOpt_01').removeChild(del_Elem);
    
    selected_option_cnt--;
}

function cal_total(){
    document.getElementById('MK_p_total').innerHTML = number_format(total_price);
}

function gotoAf(index){
	if(selected_option_cnt>0){
		document.form1.select.value = index;
		document.getElementById('form1').submit();
	}else{
		alert('선택된 옵션이 없습니다.');
	}
}