<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"
    data-client-id="{#_clientId}"
    data-mode="{#_mode}"
    data-merchant-user-key="{#_merchantUserKey}"
    data-merchant-pay-key="{#_merchantPayKey}"
    data-product-name="{#_productName}"
    data-total-pay-amount="{#_totalPayAmount}"
    data-tax-scope-amount="{#_taxScopeAmount}"
    data-tax-ex-scope-amount="{#_taxExScopeAmount}"
    data-return-url="{#_returnUrl}">
   </script>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
   <title>주문하기</title>
   
   <script>

   //----------------------------------UI관련   Javascript---------------------------------------//
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
       $('.payco input[type=radio]').click(function() {
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
   
   
   //----------------------------------금액 변경하는  Javascript---------------------------------------//
   var total = 0;  //최종 금액의 가격
   var couponTotal = 0; // 쿠폰의 최종가격 - 가져온다
   var realTotal = 0 ; // 진짜 최종 가격 
   var coupontCategory = ""; //쿠폰카테고리
   
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
      
      //메뉴 정보를 가져와야함. -> 메뉴 타입.  
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
         realTotal = total - couponTotal;
         //-값 안되게 처리
          if(realTotal < 0){realTotal = 0;}
         realTotalCost[0].innerHTML = realTotal;
         realTotalCost[1].innerHTML = realTotal;
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
         realTotal = total - couponTotal;
         
         //-값 안되게 처리
          if(realTotal < 0){realTotal = 0;}
         realTotalCost[0].innerHTML = realTotal;
         realTotalCost[1].innerHTML = realTotal;
       }
       
       var objParams = {
                "key"      : key,        // key값
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
   
   //쿠폰 변경
   var coupon_seq = "-1"; //쿠폰을 사용안함. 
   function changeCoupon(e){
      const value = e.value;
      coupon_seq = value;
      //쿠폰가격 0으로 처리 
      if(value == "nothing"){
         document.getElementById("totalDiscountCost").innerHTML = 0;
         var realTotalCost = document.getElementsByClassName("realTotalCost");
          realTotalCost[0].innerHTML = total;
          realTotalCost[1].innerHTML = total;
      }
      
      //userCoupon 의 pk - value;
      //value를 가지고 간다. 가격과 카테고리를 다시 가져와야함. 
      var objParams = {
                "coupon_seq"      : parseInt(value),        // key값
        };
      
        $.ajax({
            url         :   "/bkc/delivery/couponPrice.do",
            dataType    :   "json",
            contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
            type        :   "post", //post로 보냄
            data        :   objParams,
            success     :   function(retVal){
               couponTotal   = retVal.price;
               coupontCategory = retVal.category;
               console.log("쿠폰가격 : " + couponTotal + "카테고리" + coupontCategory);

               //모든 메뉴에 적용되는 쿠폰일 경우 
               if(coupontCategory == "all"){
                  //전체 메뉴 쿠폰사용 로직
                  document.getElementById("totalDiscountCost").innerHTML = couponTotal;
                  
                  realTotal = total - couponTotal;   //최종 가격 = 전체메뉴가격 - 쿠폰가격
                  
                  //-값 안되게 처리
                  if(realTotal < 0){realTotal = 0;}

                  var realTotalCost = document.getElementsByClassName("realTotalCost");
                  realTotalCost[0].innerHTML = realTotal;
                  realTotalCost[1].innerHTML = realTotal;
                  return;
               }
               
               //카트를 확인하면서 카테고리에 맞는 게 있으면 쿠폰가격을 넣고, 카테고리가 다르다면 쿠폰을 넣지 못하게 한다. 
               var categoryName =  document.getElementsByClassName('categoryName');
               for(let i = 0 ;i< categoryName.length; i++){
                  //쿠폰과 맞는 카테고리가 있다면 처리시켜준다. 없으면 끝.
                  if(categoryName[i].value==coupontCategory){
                     //전체 메뉴 쿠폰사용 로직
                      document.getElementById("totalDiscountCost").innerHTML = couponTotal;
                      
                      realTotal = total - couponTotal;   //최종 가격 = 전체메뉴가격 - 쿠폰가격
                      //-값 안되게 처리
                      if(realTotal < 0){realTotal = 0;}
                      
                      var realTotalCost = document.getElementsByClassName("realTotalCost");
                      realTotalCost[0].innerHTML =realTotal;
                      realTotalCost[1].innerHTML =realTotal;
                     return; //맞으면 바로 처리 
                  }
              }
               alert("쿠폰을 사용할 수 없습니다.");
               $("#notSelectedCoupon").prop("selected", true);
               document.getElementById("totalDiscountCost").innerHTML = 0;
               
            },
            error       :   function(request, status, error){
               console.log("걍 실패");
            }
        });
   }
   /*
       ----------------------------------결제관련 Javascript---------------------------------------
   */
   
   //DB에 보낼거 
   function payValid(){
      var contextpath = "<c:out value='${contextPath}'/>";
      
      //가격이 0원인 경우 그냥 바로 결제 시킴
      var realTotalCost = document.getElementsByClassName("realTotalCost");
      if(realTotalCost[0].innerHTML  == 0){
         console.log("쿠폰으로 100% 결제")
         //쿠폰으로 결제하는 경우 ajax로 보낸다.
         //총주문가격 - 0원 
         return;
      }
      
        //라디오 버튼 Name 가져오기
        var paymentType = document.getElementsByName("paymentType");
        var paymentType_check = 0;
        var paymentTypeValue ="";
        for(var i = 0; i<paymentType.length; i++){
            if(paymentType[i].checked==true){
                paymentTypeValue = paymentType[i].value;
                paymentType_check++;
                break;
            }
        }
         //결제타입을 정하지 않았을 경우 
        if(paymentType_check==0){
            alert("결제 타입을 선택해주세요");
            return;
        }
      
        //------------------------------    분기 시작하기전 ajax변수 설정    ------------------------------// 
        /*
         1. userid 
         2. 배달지명   *- ajax로 
         3. user주소   *- ajax로 
         4. 연락처      *- ajax로 
         5. 요청사항   *- ajax로 
         6. 카트정보      - CartVO를 세션에서 꺼내온다.                   -> 바로 세션삭제
         7. 쿠폰사용여부   *   - UsercouponVO를 받는다. Usercouponseq를 받아서    -> 쿠폰사용후 삭제해버림
         8. 쿠폰가격   *   - UsercouponVO를 받는다. Usercouponseq를 받아서 
         9. 최종결제가격  - cart에서 꺼낸다. 
         10. 결제수단     - ajax로 
       */
       
       var storename  = document.getElementById("store").value;             // "배달지명" 
       var useraddress = document.getElementById("realAddress").innerHTML;       // "고객주소"
       var phonenumber = document.getElementById("phonenumber").value;          // "연락처"
       var description = document.getElementById("description").value;          // "요청사항"
       var payment_type = "결제수단";     
       var total_price = document.getElementById("realTotalCost").innerHTML;    
       //coupon_seq - 상위에서 등록
      
       
      //------------------------------ ------------------------------------------------------------// 
         //라디어 버튼에 따라 결제 분기 처리  - 5가지 타입 
         if(paymentTypeValue == "payco"){
         	//가맹점 식별코드
      		IMP.init('imp55034775');
      		IMP.request_pay({
      		    pg : 'payco',
      		    pay_method : 'card',
      		    merchant_uid : 'merchant_' + new Date().getTime(),
      		    name : 'BKC 치킨' , //결제창에서 보여질 이름
      		    amount : total_price, //실제 결제되는 가격
      		    buyer_email : 'iamport@siot.do',
      		    buyer_name : '구매자이름',
      		    buyer_tel : phonenumber,
      		    buyer_addr : useraddress,
      		    buyer_postcode : '123-456'
      		}, function(rsp) {
      			console.log(rsp);
      		    if ( rsp.success ) {
      		    	var msg = '결제가 완료되었습니다.';
      		        msg += '고유ID : ' + rsp.imp_uid;
      		        msg += '상점 거래ID : ' + rsp.merchant_uid;
      		        msg += '결제 금액 : ' + rsp.paid_amount;
      		        msg += '카드 승인번호 : ' + rsp.apply_num;
      		        
      		        var objParams = {
      		                "storename" : storename, 
      		                "useraddress" : useraddress, 
      		                "phonenumber" : phonenumber, 
      		                "description" : description, 
      		                "payment_type" : "네이버페이",
      		                "coupon_seq" : parseInt(coupon_seq),
      		                "total_price" :parseInt(total_price)
      		            };
      		            $.ajax({
      		                url         :   "/bkc/delivery/ordersuccess.do",
      		                dataType    :   "json",
      		                contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
      		                type        :   "post",
      		                data        :   objParams,
      		                success     :   function(retVal){
      		                           orderSerial = retVal.order_serial; 
      		                           console.log(orderSerial);
      		                           window.location.href= contextpath+"/delivery/ordercomplete.do?order_serial="+orderSerial;
      		                },
      		                error       :   function(request, status, error){
      		                         alert("주문이 실패하였습니다.");
      		                }
      		            });
      		        
      		    } else {
      		    	 var msg = '결제에 실패하였습니다.';
      		         msg += '에러내용 : ' + rsp.error_msg;
      		    }
      		});
         } 
         
         else if(paymentTypeValue == "kakao"){
        	//가맹점 식별코드
     		IMP.init('imp55034775');
     		IMP.request_pay({
     		    pg : 'kakaopay',
     		    pay_method : 'card',
     		    merchant_uid : 'merchant_' + new Date().getTime(),
     		    name : 'BKC 치킨' , //결제창에서 보여질 이름
     		    amount : total_price, //실제 결제되는 가격
     		    buyer_email : 'iamport@siot.do',
     		    buyer_name : '구매자이름',
     		    buyer_tel : phonenumber,
     		    buyer_addr : useraddress,
     		    buyer_postcode : '123-456'
     		}, function(rsp) {
     			console.log(rsp);
     		    if ( rsp.success ) {
     		    	var msg = '결제가 완료되었습니다.';
     		        msg += '고유ID : ' + rsp.imp_uid;
     		        msg += '상점 거래ID : ' + rsp.merchant_uid;
     		        msg += '결제 금액 : ' + rsp.paid_amount;
     		        msg += '카드 승인번호 : ' + rsp.apply_num;
     		        
     		        //성공한뒤 보낸값을 보낸다. 
     		        var objParams = {
     		                "storename" : storename, 
     		                "useraddress" : useraddress, 
     		                "phonenumber" : phonenumber, 
     		                "description" : description, 
     		                "payment_type" : "카카오페이",
     		                "coupon_seq" : parseInt(coupon_seq),
     		                "total_price" :parseInt(total_price)
     		            };
     		            $.ajax({
     		                url         :   "/bkc/delivery/ordersuccess.do",
     		                dataType    :   "json",
     		                contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
     		                type        :   "post",
     		                data        :   objParams,
     		                success     :   function(retVal){
     		                           orderSerial = retVal.order_serial; 
     		                           console.log(orderSerial);
     		                           window.location.href= contextpath+"/delivery/ordercomplete.do?order_serial="+orderSerial;
     		                },
     		                error       :   function(request, status, error){
     		                         alert("주문이 실패하였습니다.");
     		                }
     		            });
     		        
     		    } else {
     		    	 var msg = '결제에 실패하였습니다.';
     		         msg += '에러내용 : ' + rsp.error_msg;
     		    }
     		});
         } 
         
         //카드결제 두개 
         else if(paymentTypeValue == "card"){
          	//가맹점 식별코드
       		IMP.init('imp55034775');
       		IMP.request_pay({
       		    pg : 'html5_inicis',
       		    pay_method : 'card',
       		    merchant_uid : 'merchant_' + new Date().getTime(),
       		    name : 'BKC 치킨' , //결제창에서 보여질 이름
       		    amount : total_price, //실제 결제되는 가격
       		    buyer_email : 'iamport@siot.do',
       		    buyer_name : '구매자이름',
       		    buyer_tel : phonenumber,
       		    buyer_addr : useraddress,
       		    buyer_postcode : '123-456'
       		}, function(rsp) {
       			console.log(rsp);
       		    if ( rsp.success ) {
       		    	var msg = '결제가 완료되었습니다.';
       		        msg += '고유ID : ' + rsp.imp_uid;
       		        msg += '상점 거래ID : ' + rsp.merchant_uid;
       		        msg += '결제 금액 : ' + rsp.paid_amount;
       		        msg += '카드 승인번호 : ' + rsp.apply_num;
       		        
       		        //성공한뒤 보낸값을 보낸다. 
       		        var objParams = {
       		                "storename" : storename, 
       		                "useraddress" : useraddress, 
       		                "phonenumber" : phonenumber, 
       		                "description" : description, 
       		                "payment_type" : "카드결제",
       		                "coupon_seq" : parseInt(coupon_seq),
       		                "total_price" :parseInt(total_price)
       		            };
       		            $.ajax({
       		                url         :   "/bkc/delivery/ordersuccess.do",
       		                dataType    :   "json",
       		                contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
       		                type        :   "post",
       		                data        :   objParams,
       		                success     :   function(retVal){
       		                           orderSerial = retVal.order_serial; 
       		                           console.log(orderSerial);
       		                           window.location.href= contextpath+"/delivery/ordercomplete.do?order_serial="+orderSerial;
       		                },
       		                error       :   function(request, status, error){
       		                         alert("주문이 실패하였습니다.");
       		                }
       		            });
       		        
       		    } else {
       		    	 var msg = '결제에 실패하였습니다.';
       		         msg += '에러내용 : ' + rsp.error_msg;
       		    }
       		});
            
         } 
         //현장 카드 결제
         else if(paymentTypeValue == "fieldCard"){
            var objParams = {
                "storename" : storename, 
                "useraddress" : useraddress, 
                "phonenumber" : phonenumber, 
                "description" : description, 
                "payment_type" : "현장카드결제",
                "coupon_seq" : parseInt(coupon_seq),
                "total_price" :parseInt(total_price)
            };
            $.ajax({
                url         :   "/bkc/delivery/ordersuccess.do",
                dataType    :   "json",
                contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                type        :   "post",
                data        :   objParams,
                success     :   function(retVal){
                           orderSerial = retVal.order_serial; 
                           window.location.href= contextpath+"/delivery/ordercomplete.do?order_serial="+orderSerial;
                },
                error       :   function(request, status, error){
                         console.log("주문 실패");
                         alert("주문이 실패하였습니다.");
                }
            });
         } 
         
         //현장 현금결제 
         else if(paymentTypeValue == "fieldCash"){
          console.log(payment_type);
            var objParams = {
                "storename" : storename, 
                "useraddress" : useraddress, 
                "phonenumber" : phonenumber, 
                "description" : description, 
                "payment_type" : "현금결제",
                "coupon_seq" : parseInt(coupon_seq),
                "total_price" :parseInt(total_price)
            };
            $.ajax({
                url         :   "/bkc/delivery/ordersuccess.do",
                dataType    :   "json",
                contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                type        :   "post",
                data        :   objParams,
                success     :   function(retVal){
                           orderSerial = retVal.order_serial; 
                           console.log(orderSerial);
                           window.location.href= contextpath+"/delivery/ordercomplete.do?order_serial="+orderSerial;
                },
                error       :   function(request, status, error){
                         console.log("주문 실패");
                         alert("주문이 실패하였습니다.");
                }
            });
            
         } 
         else{
            console.log("결제 error");
         }
    }
   
   function KakaoPay() {
      alert("kakaopay 메서드 실행");
        $.ajax({
             url: '/bkc/pay/kakaopay.do',
             type: 'post',
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
   
   function sample6_execDaumPostcode() {
           new daum.Postcode({
               oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                
                var addressText = addr + " " + extraAddr ;
                
                document.getElementById("realAddress").innerHTML = addressText;
                
                document.getElementById("findAddress").style.display ="none";
                document.getElementById("checkAddress").style.display ="";
                document.getElementById("detailAddress").style.display ="";
               }
           }).open();
       }
   </script>
 
<style>
#selectedCoupon {
   font-size: 1.4rem;
   outline: none;
}
.inputWrap{ 
 display: none;
 visibility: hidden; 
}
</style>
</head>
<body>
   <div class="subWrap02">
      <!-- delivery desktop header -->
      <jsp:include page="../include/header/delivery_desktop_header2.jsp" />
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
                        <span>${location.addr} ${location.addr_detail} ${location.addr_extra}</span>
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
         <div class="contentsBox02">
            <div class="web_container2">
               <div class="subtitWrap">
                        <h2 class="page_tit">주문하기</h2>
                    </div>
                    <div class="container01 orderWrap">
                        <h2 class="tit01 tit_ico delivery"><span>배달정보</span></h2>
                        <div class="container02 deli_info01">
                            <div class="addrWrap01">
                                <form role="form" action="${contextPath }/delivery/insertLocation.do" method="post">
                                <div class="txt_addr">
                                    <span id="realAddress">${location.addr} ${location.addr_detail} ${location.addr_extra}</span>
                                    <input style="display:none;" class="detailaddr2" id="detailAddress" name="addr_extra" type="text" placeholder="상세주소를 입력해주세요." >
                                </div>
                                
                              <input type='hidden' name ="userid" id ="userid" value='<c:out value="${user.getUserid()}"/>'>
                        <div class="inputWrap">
                           <div class="inpbox2" >
                              <input class="addr" id="sample6_address" name="addr" type="hidden" > 
                           </div>
                           <div class="inpbox2" >
                              <input class="detailaddr" id="sample6_extraAddress" name="addr_detail" type="text" >
                           </div>
                           <div class="inpbox2">
                              <input class="detailaddr" id="sample6_detailAddress" name="addr_detail" type="text">
                           </div>               
                           <div class="inpbox2">
                              <input class="detailaddr" id="sample6_postcode" name="zipcode" type="text">
                           </div>
                        </div>
                                <button id="findAddress" type="button" class="btn04 h02" onclick="javascript: sample6_execDaumPostcode()">
                                    <span>변경</span>
                                </button>
                                <button type="submit" class="btn04 h02" style="display:none;" id="checkAddress">이 주소로 배달지 설정</button>
                             </form>
                            </div>
                            <div class="info_list">
                                <dl>
                                    <dt>연락처</dt>
                                    <dd>
                                        <input class="tel" type="text" maxlength="20" value="${user.phone}" id="phonenumber">
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>매장</dt>
                                    <dd>
                                        <input class="store" type="text" readonly="readonly" id="store" value="${location.store_name}">
                                    </dd>
                                </dl>
                                <dl class="memo">
                                    <dt>요청사항</dt>
                                    <dd>
                                        <div class="inp_bytes">
                                            <div>
                                                <input class="request" type="text" placeholder="요청사항을 입력하세요" maxlength="50" id="description">
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
                        <input type="hidden" class="categoryName"
                           value="${products.value.type_serial}">
                        <!-- 카트 정보  -->
                        <div class="acc_tit">
                           <p class="tit">
                              <strong> <span>${products.value.product_name}</span>
                              </strong>
                           </p>
                        </div>
                        <ul class="cart_list01">
                           <li>
                              <div class="cont">
                                 <div class="menu_titWrap">
                                    <div class="menu_name">
                                       <p class="tit">
                                          <strong> <span>${products.value.product_name}</span>
                                          </strong>
                                       </p>
                                       <span class="price"> <strong> <span
                                             id="oneProductCost${products.key}">${products.value.price}</span>
                                       </strong>
                                       </span>
                                    </div>
                                    <div class="prd_img">
                                       <span> <img src='${products.value.path}' alt="제품"
                                          style="display: inline; opacity: 1;">
                                       </span>
                                    </div>
                                 </div>
                                 <div class="quantity">
                                    <strong class="tit">수량</strong>
                                    <div class="num_set">
                                       <button type="button" class="btn_minus"
                                          onclick="fnCalCount('m', this, ${products.key});">
                                          <span>-</span>
                                       </button>
                                       <input type="number" id="count${products.key}"
                                          class="first_menu" readonly="readonly" class="tempCost"
                                          value="${products.value.count}">
                                       <button type="button" class="btn_plus"
                                          onclick="fnCalCount('p', this, ${products.key});">
                                          <span>+</span>
                                       </button>
                                    </div>
                                 </div>
                              </div>
                              <div class="sumWrap">
                                 <dl>
                                    <dt>합계금액</dt>
                                    <dd>
                                       <strong> <em> <span class="productsPrice"
                                             id="totalProductCost${products.key}">${products.value.price*products.value.count}</span>
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
                  <div class="container02">
                     <div class="order_payment_list">
                        <dl class="tot">
                           <dt>쿠폰 선택하기</dt>
                           <dd>
                              <select onChange="changeCoupon(this);" name="coupon"
                                 id="selectedCoupon" style="width: 500px; height: 50px;">
                                 <option value="nothing" selected="selected"
                                    id="notSelectedCoupon">없음</option>
                                 <c:forEach var="coupon" items="${usercoupons}">
                                 
                                 	<c:choose>
										<c:when test="${coupon.use_status eq 1 }">
											<option value="${coupon.coupon_seq}">${coupon.coupon_title}</option>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
                                    
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
                              <em> <span class="realTotalCost" >0</span> <span
                                 class="unit">원</span>
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
                        <dl>
                           <dt></dt>
                           <dd>
                              <span style="color: red;">남은 잔액은 사용 할 수 없습니다.</span>
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
                           <li class="payco"><label> <input type="radio" name="paymentType" value="payco"> <span>페이코</span></label></li>
                           <li class="kakao"><label> <input type="radio" name="paymentType" value="kakao"> <span>카카오페이</span></label></li>
                        </ul>
                        <ul class="txtlist03">
                           <li>· 주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.</li>
                           <li>· 페이코는 페이코ID로 별도 앱 설치 없이 신용카드 또는 은행계좌 정보를 등록하여 페이코
                              비밀번호로 결제할 수 있는 간편결제 서비스입니다.</li>
                           <li>· 결제 가능한 신용카드: 신한, 삼성, 현대, BC, 국민, 하나, 롯데, NH농협, 씨티</li>
                           <li>· 결제 가능한 은행: NH농협, 국민, 신한, 우리, 기업, SC제일, 부산, 경남, 수협,
                              우체국, 미래에셋대우, 광주, 대구, 전북, 새마을금고, 제주은행, 신협, 하나은행</li>
                           <li>· 페이코 간편결제는 페이코에서 제공하는 카드사별 무이자, 청구할인 혜책을 받을 수
                              있습니다.</li>
                        </ul>
                     </div>
                  </div>
                  <div class="payment_tabcont w_none">
                     <h3 class="tit01 tit_ico phone">
                        <span>카드결제</span>
                     </h3>
                     <div class="container02">
                        <div class="check_list01">
                           <label> <input type="radio" name="paymentType" value="card">
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
                           <li><label> <input type="radio" name="paymentType" value="fieldCard">
                                 <span>현장에서 신용카드 결제</span>
                           </label></li>
                           <li><label> <input type="radio" name="paymentType" value="fieldCash">
                                 <span>현장에서 현금 결제</span>
                           </label></li>
                        </ul>
                     </div>
                  </div>
                  <div class="totamountWrap">
                     <dl>
                        <dt>총 결제금액</dt>
                        <dd>
                           <strong><span>&#8361;</span><span
                              class="realTotalCost" id="realTotalCost">0</span></strong>
                        </dd>
                     </dl>
                     <div class="c_btn m_item2">
                        <a href="${contextPath}/delivery/delivery.do" class="btn01">
                           <span>취소</span>
                        </a> <a onclick="payValid();" href="#" class="btn01 orange"> <span>결제하기</span>
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
                        <li>고객님과 수 차례 연락을 시도한 후 연락이 되지 않을 경우 배달음식이 변질되거나 부패될 우려로
                           식품위생법상 위반될 여지가 있어 별도로 보관하지 않으며, <strong>재배달 또는 환불처리가
                              어려울 수 있습니다.</strong>
                        </li>
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
   <jsp:include page="../include/footer/delivery_desktop_footer.jsp" />
   <a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
</body>
</html>