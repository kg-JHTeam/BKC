<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
	<!-- font google web font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <!-- favicon -->
    <link rel="shortcut icon" type="image/x-icon"
    href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
	<!-- css -->
	<link rel="stylesheet" href="${contextPath}/resources/css/include/delivery-gnb2.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/delivery/cart.css">
	
	<!-- js -->
    <script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
	
	<title>카트</title>
	<script>
	//양식 다시제출 없애기
	if (window.history.replaceState) {
	        window.history.replaceState(null, null, window.location.href );
	}
	
	//최종 가격 구하기
	var total = 0;
	window.onload = function(){
		
		//아무것도 없는 경우
		var count = "<c:out value='${cart.productCount}'/>";
		var zero = document.getElementById("zerocart");
		var notzero = document.getElementById("existcart");
		
		//아무것도없으면
		if(count == 0){
			zero.style.display ='';
			notzero.style.display ='none';
		} 
		//있으면
		else{
			zero.style.display ='none';
			notzero.style.display ='';
		}
		//아무것도 없는 상태 끝. 
		
		//카트에 담기 모든 가격 
		var totalCartCost = parseInt(document.getElementById("totalCartCost").innerHTML);
		var productsPrice =  document.getElementsByClassName('productsPrice');
		for(let i = 0 ;i< productsPrice.length; i++){
			totalCartCost += parseInt(productsPrice[i].innerHTML);
		}
		document.getElementById("totalCartCost").innerHTML = totalCartCost;
		total = totalCartCost;
	}
	
	//메뉴별 최종 가격
	function fnCalCount(type, ths, key) {
		var parent = ths.parentNode;
		var child= parent.childNodes[3];
		var productCount = child.value 
		
		//하나의 가격 
		var oneCost = document.getElementById("oneProductCost"+key).innerHTML;
		var totalProductCost = document.getElementById("totalProductCost"+key);
		
		var totalCartCost = parseInt(document.getElementById("totalCartCost").innerHTML);
		var productsPrice =  document.getElementsByClassName('productsPrice');
		
	    //plus인 경우
	    if (type == 'p') {
	    	if(productCount >= 10){
	    		alert("10건이상 주문 불가능합니다.\n 단체주문은 문의부탁드립니다." ); 
	    		return;
	    	}
	    	//숫자 증가
	    	child.value++;
	    	totalProductCost.innerHTML = oneCost * child.value;
	    	total += parseInt(oneCost);
	    	document.getElementById("totalCartCost").innerHTML = total;
	    } 
	    //minus인 경우 
	    else {
	    	if(productCount <= 1){
	    		return;
	    	}
	    	child.value--;
	    	totalProductCost.innerHTML = oneCost * child.value;
	    	total -= parseInt(oneCost);
	    	document.getElementById("totalCartCost").innerHTML = total;
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

	//x버튼 클릭시 해당 부분 삭제
	function deleteRow(ths, key) {
		//하나의 가격 
		var totalProductCost = document.getElementById("totalProductCost"+key).innerHTML;
		total -= parseInt(totalProductCost);
    	document.getElementById("totalCartCost").innerHTML = total;
		
	    var ths = $(ths);
	    ths.parents(".contWrap").remove();
	    
	  	//아무것도 없는 경우
		var count =  parseInt(document.getElementById("totalCartCost").innerHTML);
		var zero = document.getElementById("zerocart");
		var notzero = document.getElementById("existcart");
		
		//아무것도없으면
		if(count == 0){
			zero.style.display ='';
			notzero.style.display ='none';
		} 
		//있으면
		else{
			zero.style.display ='none';
			notzero.style.display ='';
		}
		
		// 아무것도 없는 상태 끝.
		// 지워졌을때 바로 세션에 추가해야된당.... 
	 	// product를 cart에서 지워주도록 key값을 보내주고 삭제시키게한다. 
	    var objParams = {
                "key"      : key,   	  // key값 - 이값을 주고 세션에서 없애버린다.
        };
		  
		  $.ajax({
            url         :   "/bkc/delivery/cartkeydelete.do",
            dataType    :   "json",
            contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
            type        :   "post", //post로 보냄
            data        :   objParams,
            success     :   function(){
                	console.log("걍성공");
            },
            error       :   function(){
            		console.log("걍 실패");
            }
        });
	}
	
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
	</script>
</head>
<body>
	<div class="subWrap02">
	<!-- delivery desktop header -->
	<jsp:include page="../include/header/delivery_desktop_header2.jsp"/>
	<!-- contents 부분 -->
        <div class="contentsWrap">
            <div class="locationWrap">
                <div class="web_container">
                    <div class="page_navi">
                        <a href="${contextPath}/delivery/delivery.do">
                            <span>딜리버리</span>
                        </a>
                        <a href="${contextPath}/delivery/cart.do" class="gotomenu">
                            <span>카트</span>
                        </a>
                    </div>
                    <div class="location">
                        <span class="addr">
                        <span>${location.addr} ${location.addr_detail}  ${location.addr_extra}</span>
                        </span>
                        <span class="shop">
                        <span>${location.store_name}</span>
                        </span>
                        <span class="btn">
                        <a href="${contextPath}/delivery/mylocation.do" class="addrchange">
                            <span>변경</span>
                        </a>
                        </span>
                    </div>
                </div>
            </div>
            <div class="contentsBox01">
                <div class="web_container2">
                    <div class="subtitWrap">
                        <h2 class="page_tit">딜리버리 카트</h2>
                    </div>
                    <!-- 이게 없을 경우  -->
                    <div class="nodata" style="display: none;" id="zerocart">
                        <span class="txt_c01">카트에 담긴 메뉴가 없습니다.</span>
                        <div class="c_btncart">
                            <button style="cursor:pointer" type="button" class="btn01 ico add" onclick="location.href='${contextPath}/delivery/delivery.do'">
                                <span>메뉴추가</span>
                            </button>
                        </div>
                    </div>
                    <!-- 이게 있을 경우  -->
                    <div class="container02 cartWrap" id="existcart">
                        <!-- 카트리스트  -->
                        <ul class="cart_list01">
                        	<!-- 여기서부터  -->  
                        	<c:forEach var="products" items="${cart.products}">
                            <li class="contWrap">
                                <div class="cont">
	                                	<div class="menu_titWrap">
	                                        <label class="menu_name">
	                                            <span class="tit">
	                                                <strong>
	                                                    <span>${products.value.product_name}</span>
	                                                </strong>
	                                            </span>
	                                            <span class="price">
	                                                <strong>
	                                                    <span id="oneProductCost${products.key}">${products.value.price}</span>
	                                                    <span class="unit">원</span>
	                                                </strong>
	                                            </span>
	                                        </label>
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
                                    <!-- 쿠폰 사용할시 나타남.  -->
                                    <dl class="discount" style="display: none;">
                                        <dt>
                                            <em>쿠폰할인</em>
                                        </dt>
                                        <dd>
                                            <strong>
                                                <em>-
                                                    <span>0</span>
                                                    <span class="unit">원</span>
                                                </em>
                                            </strong>
                                        </dd>
                                    </dl>
                                    
                                </div>
                                <button type="button" class="btn_del02" onclick="deleteRow(this, ${products.key} );">
                                    <span>Delete menu</span>
                                </button>
                            </li>
							</c:forEach>
							<!-- 여기 까지  -->                            
                        </ul>
                        <div class="sumWrap">
                            <dl>
                                <dt>총 주문금액</dt>
                                <dd>
                                    <strong>
                                        <em>
                                            <span id="totalCartCost">0</span>
                                            <span class="unit">원</span>
                                        </em>
                                    </strong>
                                </dd>
                            </dl>
                        </div>
                        <div class="cartinfo">
                            <div class="c_btncartinfo item2" style="width: 400px;">
                                <a href="${contextPath}/delivery/delivery.do" class="btn01 m ico add">
                                    <span>메뉴추가</span>
                                </a>
                                <a href="${contextPath}/delivery/order.do" class="btn01 m orange">
                                    <span>주문하기</span>
                                </a>
                            </div>
                            <ul class="txtlist01">
                                <li>
                                   	주문서를 작성하기 전에 선택하신 상품명, 수량 및 가격이 정확한지 확인해주세요.
                                </li>
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