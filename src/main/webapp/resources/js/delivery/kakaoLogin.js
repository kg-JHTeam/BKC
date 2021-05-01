 		
		//javascript key : 950685967910771abce582f44da62023
        window.Kakao.init("950685967910771abce582f44da62023"); //이 key를 받고 검증
		function logoutWithKaKao(){
			if(Kakao.Auth.getAccessToken()){
				console.log('카카오 인증 액세스 토큰이 존재합니다.', Kakao.Auth.getAccessToken());
				Kakao.Auth.logout(()=>{
					console.log('로그아웃 되었습니다.', Kakao.Auth.getAccessToken());
					alert("카카오톡 로그아웃 완료");
				})
			}
		}
		
		
		function kakaoLogin(){
            //로그인 버튼이 눌렀을 때  
            window.Kakao.Auth.login({
                scope:'profile, account_email, gender',  //이 범위 내에서 받아온다는 뜻.
                success : function(authObj){ //받아온 obj
                    console.log(authObj); 
                    //user정보를 받아오는 API  
                    window.Kakao.API.request({
                        url:'/v2/user/me', //현재 로그인 사용자의 정보
                        success : 
							res => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account);
							}
                    });
                }
            });
        }


