$('.acc_tit .btn_acc').click(function(){
    $('acc_list').addClass('open');
});
//인증 버튼을 누를시에 모달창이 열림. 
$(function() {
      //인증번호 발송할 경우 
      $(".send_btn").click(function() {
         //css 관련 

         //핸드폰 번호 넘겨주기
         var email = document.getElementById("email").value;
         var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
         if(regExp.test(email)){                  
            //false일경우
            if(!checkTimer){ 
               var sendMessage = { 
                     "email" : email,
               };

               //ajax로 서버로 문자를 보냄.
               $.ajax({ 
                  url: contextpath+"/sendemail.do", 
                  data: email, 
                  type: "post", 
                  success: function(result) { 
                     if (result == "") { 
                        alert("인증번호 전송 실패");
                     } else { 
                        startTimer(); //타이머 스타트 시킴.
                        checkNumber = result; //전역변수로 넣어둔다.
                     } 
                  } 
               });
            } 
         } else{
            alert("핸드폰 번호를 확인해주세요");
         }
      });
});
