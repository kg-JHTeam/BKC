$(document).ready(function() {
    $("#st01").keyup(function() {
        $(".btn_del01").toggle(Boolean($(this).val()));
    });
    $(".btn_del01").toggle(Boolean($("#st01").val()));
    $(".btn_del01").click(function() {
        $("#st01").val('').focus();
        $(this).hide();
    	name1.style.display = "block";
    });
    $("#st02").keyup(function() {
        $(".btn_del02").toggle(Boolean($(this).val()));
    });
    $(".btn_del02").toggle(Boolean($("#st02").val()));
    $(".btn_del02").click(function() {
        $("#st02").val('').focus();
        $(this).hide();
        if(document.getElementById('item1').getAttribute('class') == 'on'){
    		if (content2.length != 0) {
    			phone1.style.display = "none";
    			phone2.style.display = "block";
    		} else if (content2.length == 0) {
    			phone1.style.display = "block";
    			phone2.style.display = "none";
    		} else if (content2.length == 11) {
    			phone1.style.display = "none";
    			phone2.style.display = "none";
    		}
    	} else if(document.getElementById('item2').getAttribute('class') == 'on'){
    		if (content2.length != 0) {
    			phone3.style.display = "none";
    			phone4.style.display = "block";
    		} else if (content2.length == 0) {
    			phone3.style.display = "block";
    			phone4.style.display = "none";
    		}
    	}
		phone1.style.display = "block";
		phone2.style.display = "none";
    });
});$("#item1").click(function() {
	$(this).addClass('on').siblings().removeClass('on');
	info1.style.display = "block";
	info2.style.display = "none";
	info3.style.display = "block";
	info4.style.display = "none";
	info5.style.display = "block";
	info6.style.display = "none";
	phone1.style.display = "block";
	phone2.style.display = "none";
	phone3.style.display = "none";
	phone4.style.display = "none";
	$("#st02").attr( 'placeholder', '휴대폰 번호' );
});
$("#item2").click(function() {
	$(this).addClass('on').siblings().removeClass('on');
	info1.style.display = "none";
	info2.style.display = "block";
	info3.style.display = "none";
	info4.style.display = "block";
	info5.style.display = "none";
	info6.style.display = "block";
	phone1.style.display = "none";
	phone2.style.display = "none";
	phone3.style.display = "block";
	phone4.style.display = "none";
	$("#st02").attr( 'placeholder', '이메일' );
});

$('#st01').keyup(function(e) {
	var content1 = $(this).val();
	if (content1.length != 0) {
		name1.style.display = "none";
	} else {
		name1.style.display = "block";
	}
});

$('#st02').keyup(function(e) {
	var content2 = $(this).val();
	if(document.getElementById('item1').getAttribute('class') == 'on'){
		if (content2.length != 0) {
			phone1.style.display = "none";
			phone2.style.display = "block";
		} else if (content2.length == 0) {
			phone1.style.display = "block";
			phone2.style.display = "none";
		} else if (content2.length == 11) {
			phone1.style.display = "none";
			phone2.style.display = "none";
		}
	} else if(document.getElementById('item2').getAttribute('class') == 'on'){
		if (content2.length != 0) {
			phone3.style.display = "none";
			phone4.style.display = "block";
		} else if (content2.length == 0) {
			phone3.style.display = "block";
			phone4.style.display = "none";
		}
	}
});