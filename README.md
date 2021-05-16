# BKC

- 버거 대표 브랜드 버거킹과 치킨 대표 브랜드 BHC를 벤치마킹하여 프로젝트를 제작하였습니다.
- 버거킹 페이지에 BHC페이지를 접목시켜 리뉴얼하는 방식으로 제작하였으며, 벡엔드 로직에 집중하였기에 화면은 반응형으로 구현하지는 않았습니다.
- 사용자에게 편리한 주문 서비스 제공을 하도록 하였습니다. 
- 지점별/카테고리별/품목별/월별 통계 및 보고서를 통한 편리한 매출관리 서비스 제공하도록하였습니다. 

<br>

##  : 프로젝트 사용기술 
![image](https://user-images.githubusercontent.com/55049159/118394187-1470bf80-b67e-11eb-9493-6ed220c7767a.png)


<br>
<br>

##  :rocket: 전체 프로젝트의 구조
![image](https://user-images.githubusercontent.com/55049159/118393926-9233cb80-b67c-11eb-9b23-03d04d373365.png)

<br>
<br>

##  :rocket: USECASE

![image](https://user-images.githubusercontent.com/55049159/118394093-8dbbe280-b67d-11eb-9072-b59a9657d6bc.png)
![image](https://user-images.githubusercontent.com/55049159/118394101-93b1c380-b67d-11eb-8b62-b714e5f6cec6.png)

<br>
<br>

##  :rocket: 프로젝트 주요 관심사

:heavy_check_mark: 클린코드를 위한 꾸준한 코드 리팩토링을 진행 중입니다.      
:heavy_check_mark: 이유와 근거가 명확한 기술의 사용을 지향합니다.    
:heavy_check_mark: 객체지향적 개념을 이해하고 이를 코드에 녹여내어 의미있는 설계를 지향하였습니다.      

<br>

### :diamond_shape_with_a_dot_inside: Git-Flow 브랜치 전략

**Git-Flow 브랜치 전략**에 따라 기능별로 브랜치를 나누어 작업하였습니다. 

<br>

![image](https://user-images.githubusercontent.com/55049159/118393988-efc81800-b67c-11eb-9b1f-23aa09ddb52b.png)

<br>

:white_check_mark: master : 제품으로 출시될 수 있는 브랜치를 의미합니다.     
:white_check_mark: develop : 다음 출시 버전을 개발하는 브랜치입니다. feature에서 리뷰완료한 브랜치를 Merge하고 있습니다.    
:white_check_mark: feature : 팀원 각자 기능을 개발하는 브랜치 - "feature_팀원이름"으로 규칙을 정하였습니다. 
:white_check_mark: release : 이번 출시 버전을 준비하는 브랜치    
:white_check_mark: hotfix : 출시 버전에서 발생한 버그를 수정하는 브랜치    

<br>

#### 참고문헌
- 우아한 형제들 기술블로그 "우린 Git-flow를 사용하고 있어요"   
<https://woowabros.github.io/experience/2017/10/30/baemin-mobile-git-branch-strategy.html>

<br>

##  :rocket: 화면 구성도


<br>

___



<br>
<br>

##  :rocket: DB ERD 구조
![image](https://user-images.githubusercontent.com/55049159/118394023-374ea400-b67d-11eb-92e7-04567dd37feb.png)
![image](https://user-images.githubusercontent.com/55049159/118394026-3b7ac180-b67d-11eb-8df8-2667ac33f370.png)
![image](https://user-images.githubusercontent.com/55049159/118394034-42a1cf80-b67d-11eb-89e1-9c1e5447ce80.png)


<br>
<br>

##  :rocket: 팀원 역할

:heavy_check_mark: 
   최재호(팀장) <br>
   AWS 서버구축 / 프로젝트 구조 설계 / DB설계 / 디자인 <br>
    Client : 스프링 시큐리티, 회원가입, 로그인, 소셜 로그인(카카오, 네이버), 아이디/비밀번호 찾기, 회원정보수정, 회원탈퇴
            쿠폰, 딜리버리 카트, 주문, 결제 (아임포트API – 카카오, 페이코, KG이니시스) <br>
    Admin : 회원관리, 쿠폰관리, 주문관리, 배너관리, 푸터관리, 관리자 페이지 구축 <br>
  
:heavy_check_mark:
기진현 <br>
DB설계 / 디자인	 <br>
Client : 이벤트/신규 매장 게시판 페이지 제작, coolSMS API, 유튜브광고, 약관(이용약관/개인정보취급방침/이메일약관) 페이지 제작<br>
Admin : 이벤트/신규 매장 관리, 유튜브광고 관리<br>

:heavy_check_mark: 
민경민<br>
DB설계 / 디자인(총괄)<br>
Client : 이용약관게시판, 개인정보취급방침게시판, 이메일약관게시판,매장찾기(카카오지도 API)<br>
Admin : 이용약관 관리, 개인정보취급방침 관리, 이메일약관 관리<br>

:heavy_check_mark: 
엄지현 <br>
DB설계 / 디자인 / 포토샵<br>
Client : 메뉴리스트, 메뉴상세조회, 매장찾기(카카오지도 API), 카카오 페이API<br>
Admin : 메뉴관리, pdf생성/다운로드  <br>

:heavy_check_mark: 
유진원 DB설계 / 디자인	<br>
Client : FAQ, BKCSTORY게시판, WHYBKC게시판, BKCNEWS게시판<br>
Admin : FAQ관리, BKC스토리 관리, WHYBKC 관리, 유의사항<br>

:heavy_check_mark: 
이주현 DB설계(총괄) / 디자인	<br>
Client : 주소검색(우편번호 API ), 매장 매칭, 공지사항, 신규매장, 이벤트 게시판 관리<br>
Admin : 공지사항 관리, 이벤트 게시판 관리, 통계처리(구글차트 API, chart.js API)<br>


