<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
	<!-- font google web font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <!-- favicon -->
    <link rel="shortcut icon" type="image/x-icon"
    href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
	<!-- css -->
	<link rel="stylesheet" href="${contextPath}/resources/css/include/delivery-gnb2.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/delivery/order.css">
	
	<!-- js -->
    <script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
	
	<title>주문하기</title>
	
	<script>

	//메뉴에 따른 menu tab
	$(document).ready(function() {
	    //$(".tab_cont > ul").hide();
	    $(".tab01 li").click(function() {
	        var idx = $(this).index();
	        $(".tab01 li").removeClass("on");
	        $(".tab01 li").eq(idx).addClass("on");
	        $(".payment_tabcont").addClass("w_none");
	        $(".payment_tabcont").eq(idx).removeClass("w_none");
	    })
	});

	//네이버페이 카카오페이 누를시 달라지게
	$(document).ready(function() {
	    $('.kakao input[type=radio]').click(function() {
	        $('.txtlist03 li').hide();
	    })
	    $('.naver input[type=radio]').click(function() {
	        $('.txtlist03 li').show();
	    })
	});

	//Goto Page Top
	$(function() {
	    $(window).scroll(function() {
	        if ($(this).scrollTop() > 500) {
	            $('.btn_top').fadeIn();
	        } else {
	            $('.btn_top').fadeOut();
	        }
	    });
	    $(".btn_top").click(function() {
	        $('html, body').animate({
	            scrollTop: 0
	        }, 400);
	        return false;
	    });
	});
	
	
	//최종 가격 구하기
	var total = 0;  //최종 금액의 가격
	var couponTotal = 0; // 쿠폰의 최종가격
	var realTotal = 0 ; // 진짜 최종 가격 
	
	window.onload = function(){
		//주문내역 모든 가격 
		var totalOrderCost = parseInt(document.getElementById("totalOrderCost").innerHTML);
		var productsPrice =  document.getElementsByClassName('productsPrice');
		for(let i = 0 ;i< productsPrice.length; i++){
			totalOrderCost += parseInt(productsPrice[i].innerHTML);
			console.log(productsPrice[i].innerHTML);
		}
		
		//할인가격 전 최종가격 
		document.getElementById("totalOrderCost").innerHTML = totalOrderCost;
		
		//진짜최종가격
		var realTotalCost = document.getElementsByClassName("realTotalCost");
		realTotalCost[0].innerHTML = totalOrderCost;
		realTotalCost[1].innerHTML = totalOrderCost;
		
		total = totalOrderCost;
	}
	
	
	//갯수 변경 
	function fnCalCount(type, ths, key) {
		var parent = ths.parentNode;
		var child= parent.childNodes[3];
		
		//상품의 갯수 
		var productCount = child.value 
		
		//하나의 가격 
		var oneCost = document.getElementById("oneProductCost"+key).innerHTML;
		var totalProductCost = document.getElementById("totalProductCost"+key);
		
		var totalCartCost = parseInt(document.getElementById("totalOrderCost").innerHTML);
		var productsPrice =  document.getElementsByClassName('productsPrice');
		
		if (type == 'p') {
	    	if(productCount >= 10){
	    		alert("10건이상 주문 불가능합니다.\n 단체주문은 문의부탁드립니다." ); 
	    		return;
	    	}
	    	child.value++;
	    	totalProductCost.innerHTML = oneCost * child.value;
	    	total += parseInt(oneCost);
	    	document.getElementById("totalOrderCost").innerHTML = total;
	    	
	    	//진짜최종가격
			var realTotalCost = document.getElementsByClassName("realTotalCost");
			realTotalCost[0].innerHTML = total;
			realTotalCost[1].innerHTML = total;
	    } 
	    else {
	    	if(productCount <= 1){
	    		return;
	    	}
	    	child.value--;
	    	totalProductCost.innerHTML = oneCost * child.value;
	    	total -= parseInt(oneCost);
	    	document.getElementById("totalOrderCost").innerHTML = total;
	    	
	    	//진짜최종가격
			var realTotalCost = document.getElementsByClassName("realTotalCost");
			realTotalCost[0].innerHTML = total;
			realTotalCost[1].innerHTML = total;
	    }
	    
	    var objParams = {
                "key"      : key,   	  // key값
                "count"    : child.value  // 갯수
        };
		  
		  $.ajax({
            url         :   "/bkc/delivery/cartcount.do",
            dataType    :   "json",
            contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
            type        :   "post", //post로 보냄
            data        :   objParams,
            success     :   function(retVal){
                if(retVal.code == "OK") {
                	console.log("걍성공");
                } else {
                	console.log("걍성공2");
                }
            },
            error       :   function(request, status, error){
            	console.log("걍 실패");
            }
        });
	 	
	}
	
	/*
	 	결제관련 Javascript
	 				
	*/
	function payValid(){
		alert("결제 하자");
	}
	
	
	function KakaopPay() {
		  $.ajax({
		       url: '/bkc/pay/kakaopay.do',
		       type: 'get',
		       async: false,
		       dataType: 'text',
		       success: function (res) {
		         let _left = (window.screen.width/2) - (500/2);
		         let _top = (window.screen.height/2) - (500/2);
		         console.log(_left);
		         console.log(_top);
		         window.open(res, 'BKC', "width=500, height=500, location=no, menubar=no, top=" + _top + ", left=" + _left);
		       }
		   });
		}
	
	</script>
	<style>
	#selectedCoupon{
	font-size:1.4rem;
	}
	</style>
</head>
<body>
	<div class="subWrap02">
	<!-- delivery desktop header -->
	<jsp:include page="../include/header/delivery_desktop_header2.jsp"/>
	<!-- desktop order page -->
	<!-- contents 부분 -->
        <div class="contentsWrap">
            <div class="locationWrap">
                <div class="web_container">
                    <div class="page_navi">
                        <a href="${contextPath}/delivery/delivery.do">
                            <span>딜리버리</span>
                        </a>
                        <a href="${contextPath}/delivery/order.do" class="gotomenu">
                            <span>주문하기</span>
                        </a>
                    </div>
                    <div class="location">
                        <span class="addr">
                        <span>서울특별시 서초구 잠원로 117 (잠원동, 아크로리버뷰신반포)(DB)</span>
                        </span>
                        <span class="shop">
                        <span>신논현역점(DB)</span>
                        </span>
                        <span class="btn">
                        <a href="#" class="addrchange">
                            <span>변경</span>
                        </a>
                        </span>
                    </div>
                </div>
            </div>
            <div class="contentsBox02">
                <div class="web_container2">
                    <div class="subtitWrap">
                        <h2 class="page_tit">주문하기</h2>
                    </div>
                    <div class="container01 orderWrap">
                        <h2 class="tit01 tit_ico delivery">
                            <span>배달정보</span>
                        </h2>
                        <div class="container02 deli_info01">
                            <div class="addrWrap01">
                                <p class="txt_addr">
                                    <span>서울특별시 서초구 잠원로 117 (잠원동, 아크로리버뷰신반포)</span>
                                    <span></span>
                                </p>
                                <button type="button" class="btn04 h02">
                                    <span>변경</span>
                                </button>
                            </div>
                            <div class="info_list">
                                <dl>
                                    <dt>연락처</dt>
                                    <dd>
                                        <input type="text" maxlength="20" value="${user.phone}">
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>매장</dt>
                                    <dd>
                                        <input type="text" readonly="readonly">
                                    </dd>
                                </dl>
                                <dl class="memo">
                                    <dt>요청사항</dt>
                                    <dd>
                                        <div class="inp_bytes">
                                            <div>
                                                <input type="text" placeholder="요청사항을 입력하세요" maxlength="50">
                                            </div>
                                        </div>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <div class="tit01 tit_ico chicken tit_ordermenu">
                            <h2>
                                <span>주문정보</span>
                            </h2>
                        </div>
                        <div class="container02 order_accWrap open">
                        	<c:forEach var="products" items="${cart.products}">
                        	<!-- 카트 정보  -->
                            <div class="acc_tit">
                                <p class="tit">
                                    <strong>
                                        <span>${products.value.product_name}</span>
                                    </strong>
                                </p>
                            </div>
                            <ul class="cart_list01">
                                <li>
                                    <div class="cont">
                                        <div class="menu_titWrap">
                                            <div class="menu_name">
                                                <p class="tit">
                                                    <strong>
                                                    <span>${products.value.product_name}</span>
                                                </strong>
                                                </p>
                                                <span class="price">
                                                <strong>
                                                    <span id="oneProductCost${products.key}">${products.value.price}</span>
                                                </strong>
                                                </span>
                                            </div>
                                            <div class="prd_img">
	                                            <span>
	                                                <img src='${products.value.path}' alt="제품" style="display: inline; opacity: 1;">
	                                            </span>
	                                       	</div>
                                        </div>
                                        <div class="quantity">
                                        <strong class="tit">수량</strong>
                                        <div class="num_set">
                                            <button type="button"  class="btn_minus" onclick="fnCalCount('m', this, ${products.key});">
                                                <span>-</span>
                                            </button>
                                            <input type="number" id="count${products.key}" class="first_menu" readonly="readonly" class="tempCost" value="${products.value.count}">
                                            <button type="button" class="btn_plus" onclick="fnCalCount('p', this, ${products.key});">
                                                <span>+</span>
                                            </button>
                                        </div>
                                    </div>
                                    </div>
                                    <div class="sumWrap">
                                        <dl>
                                            <dt>합계금액</dt>
                                            <dd>
                                                <strong>
                                                <em>
                                                    <span class="productsPrice" id="totalProductCost${products.key}">${products.value.price*products.value.count}</span>	<!-- 갯수에 따른 금액 -->
                                                    <span class="unit">원</span>
                                                </em>
                                            </strong>
                                            </dd>
                                        </dl>
                                        <!-- 쿠폰 관련  -->
                                        <dl class="discount">
                                            <dt>
                                            <em>쿠폰할인</em>
                                        </dt>
                                       
                                            <dd>
                                                <strong>
                                                <em>
                                                    <span>0</span>
                                                    <span class="unit">원</span>
                                                </em>
                                            </strong>
                                            </dd>
                                        </dl>
                                    </div>
                                </li>
                            </ul>
                            </c:forEach>
                        </div>
                        <h2 class="tit01 tit_ico money">
                            <span>쿠폰 선택</span>
                        </h2>
                        <div class="container02">
                            <div class="order_payment_list">
                                <dl class="tot">
                                    <dt>쿠폰 선택하기 </dt>
                                    <dd>
                                         <select name="coupon" id="selectedCoupon" style="width:500px;height:50px;">
                                         	<option value="" selected="selected">없음</option>
                                         	<c:forEach var="coupon" items="${usercoupons}">
											    <option value="${coupon.coupon_seq}">${coupon.coupon_title}</option>
											    <option value="${coupon.coupon_seq}">${coupon.coupon_title}</option>
											    <option value="${coupon.coupon_seq}">${coupon.coupon_title}</option>
                                         	</c:forEach>
										    
										</select>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <h2 class="tit01 tit_ico money">
                            <span>최종 결제금액</span>
                        </h2>
                        <div class="container02">
                            <div class="order_payment_list">
                                <dl class="tot">
                                    <dt>최종 결제금액</dt>
                                    <dd>
                                        <em>
                                            <span class="realTotalCost">0</span>
                                            <span class="unit">원</span>
                                        </em>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>제품금액</dt>
                                    <dd>
                                        <span class="unit" id="totalOrderCost">0</span><span>원</span>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>할인금액</dt>
                                    <dd>
                                        <span class="unit" id="totalDiscountCost">0</span><span>원</span>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <div class="WEB tit01 titbox">
                            <h2 class="tit_ico payment">
                                <span>결제 수단 선택</span>
                            </h2>
                            <div class="tab01 rcen_btn">
                                <ul>
                                    <li class="on">
                                        <button type="button">
                                            <span>간편결제</span>
                                        </button>
                                    </li>
                                    <li>
                                        <button type="button">
                                            <span>카드결제</span>
                                        </button>
                                    </li>
                                    <li>
                                        <button type="button">
                                            <span>만나서 결제</span>
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="payment_tabcont">
                            <h3 class="tit01 tit_ico payment">
                                <span>간편하게 결제</span>
                            </h3>
                            <div class="container02">
                                <ul class="easy_payment_list">
                                    <li class="naver">
                                        <label>
                                            <input type="radio" name="paymentType">
                                            <span>네이버페이</span>
                                        </label>
                                    </li>
                                    <li class="kakao" onclick="javascript:KakaoPay()">
                                        <label>
                                            <input type="radio" name="paymentType">
                                            <span>카카오페이</span>
                                        </label>
                                    </li>
                                </ul>
                                <ul class="txtlist03">
                                    <li>· 주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.</li>
                                    <li>· 네이버페이는 네이버ID로 별도 앱 설치 없이 신용카드 또는 은행계좌 정보를 등록하여 네이버페이 비밀번호로 결제할 수 있는 간편결제 서비스입니다.</li>
                                    <li>· 결제 가능한 신용카드: 신한, 삼성, 현대, BC, 국민, 하나, 롯데, NH농협, 씨티</li>
                                    <li>· 결제 가능한 은행: NH농협, 국민, 신한, 우리, 기업, SC제일, 부산, 경남, 수협, 우체국, 미래에셋대우, 광주, 대구, 전북, 새마을금고, 제주은행, 신협, 하나은행</li>
                                    <li>· 네이버페이 카드 간편결제는 네이버페이에서 제공하는 카드사별 무이자, 청구할인 혜책을 받을 수 있습니다.</li>
                                </ul>
                            </div>
                        </div>
                        <div class="payment_tabcont w_none">
                            <h3 class="tit01 tit_ico phone">
                                <span>카드결제</span>
                            </h3>
                            <div class="container02">
                                <div class="check_list01">
                                    <label>
                                        <input type="radio" name="paymentType">
                                        <span>신용카드 결제</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="payment_tabcont w_none">
                            <h3 class="tit01 tit_ico deliveryman">
                                <span>만나서 결제</span>
                            </h3>
                            <div class="container02">
                                <ul class="check_list01">
                                    <li>
                                        <label>
                                            <input type="radio" name="paymentType">
                                            <span>현장에서 신용카드 결제</span>
                                        </label>
                                    </li>
                                    <li>
                                        <label>
                                            <input type="radio" name="paymentType">
                                            <span>현장에서 현금 결제</span>
                                        </label>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="totamountWrap">
                            <dl>
                                <dt>총 결제금액</dt>
                                <dd>
                                    <strong><span>&#8361;</span><span class="realTotalCost">0</span></strong>
                                </dd>
                            </dl>
                            <div class="c_btn m_item2">
                                <a href="${contextPath}/delivery/delivery.do" class="btn01">
                                    <span>취소</span>
                                </a>
                                <a onclick="payValid();" href="#" class="btn01 orange">
                                    <span>결제하기</span>
                                </a>
                            </div>
                        </div>
                        <div class="WEB order_caution">
                            <div class="tit03">
                                <h4>유의사항</h4>
                            </div>
                            <ul class="txtlist01">
                                <li>매장별 주문금액이 상이하니, 반드시 최소금액을 확인하기 바랍니다.</li>
                                <li>배달 소요시간은 기상조건이나 매장 사정상 지연 또는 제한될 수 있습니다.</li>
                                <li>고객님과 수 차례 연락을 시도한 후 연락이 되지 않을 경우 배달음식이 변질되거나 부패될 우려로 식품위생법상 위반될 여지가 있어 별도로 보관하지 않으며, <strong>재배달 또는 환불처리가 어려울 수 있습니다.</strong></li>
                                <li>대량 주문의 경우 콜센터(1577-5577)주문으로만 가능합니다.</li>
                                <li>주문 완료 후 변경 및 취소는 콜센터(1577-557)에서만 가능합니다.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <jsp:include page="../include/footer/delivery_desktop_footer.jsp"/>
    <a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>