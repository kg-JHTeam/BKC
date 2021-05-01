<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8">

                <!--css-->
                <link rel="stylesheet" href="../resources/css/include/main-gnb.css">
                    <link rel="stylesheet" href="../resources/css/subpages/customerService/recruit.css"/>
                    <link rel="stylesheet" type="text/css" href="slick-1.8.1/slick/slick.css"/>
                    <link
                        rel="stylesheet"
                        type="text/css"
                        href="slick-1.8.1/slick/slick-theme.css"/>

                    <!--jQuery-->
                    <script src="http://code.jquery.com/jquery-3.6.0.js"></script>
                    <script type="text/javascript" src="slick-1.8.1/slick/slick.min.js"></script>

                    <!--js-->
                    <script src="../resources/js/include/main-gnb.js"></script>
                    <script src="../resources/js/subpages/customerService/cs.js"></script>

                    <!--font-->
                    <link rel="preconnect" href="https://fonts.gstatic.com">
                        <link
                            href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
                            rel="stylesheet">

                            <!--logo-->
                            <link
                                rel="shortcut icon"
                                type="image/x-icon"
                                href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/logo/mainlogo.png">
                                <title>가맹점모집</title>
                            </head>
                            <body>
            <div id="contents-wrap" pageno="1">
                <div class="location-wrap">
                    <div class="web_container">
                        <div class="page_navi">
                            <a href="#/home">
                                <span>HOME</span>
                            </a>
                            <span>
                                고객센터
                            </span>
                            <span>공지사항</span>
                        </div>
                    </div>
                </div>
                <div class="contentsBox">
                    <div class="web_container">
                        <div class="subtitle-wrap">
                            <h3 class="page_title">고객센터</h3>
                            <div class="tabmenu">
                                <ul>
                                    <li>
                                        <button
                                            type="button"
                                            onclick="location.href='${pageContext.request.contextPath }/customerService/notice.do'">
                                            <span>공지사항</span></button>
                                    </li>
                                    <li>
                                        <button
                                            type="button"
                                            onclick="location.href='${pageContext.request.contextPath }/customerService/app.do'">
                                            <span>bkc앱 이용안내</span></button>
                                    </li>
                                    <li>
                                        <button
                                            type="button"
                                            onclick="location.href='${pageContext.request.contextPath }/customerService/faq.do'">
                                            <span>FAQ</span></button>
                                    </li>
                                    <li>
                                        <button
                                            type="button"
                                            onclick="location.href='${pageContext.request.contextPath }/customerService/inquiry.do'">
                                            <span>문의</span></button>
                                    </li>
                                    <li>
                                        <button
                                            type="button"
                                            onclick="location.href='${pageContext.request.contextPath }/customerService/chain.do'">
                                            <span>가맹점모집</span></button>
                                    </li>
                                    <li class="on">
                                        <button
                                            type="button"
                                            onclick="location.href='${pageContext.request.contextPath }/customerService/recruit.do'">
                                            <span>인재채용</span></button>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="tab_content">
                            <div class="recruit">
                                <div class="recruit-wrap">
                                    <div class="msgbox">
                                        <h5 class="recruit_tit">
                                            <span>bkc에서 인재를 찾습니다.</span>
                                        </h5>
                                        <p>
                                            <br><span>bkc의 차별화된 맛과 서비스의 팬이신 분,</span>
                                            <span>bkc를 더 크게 발전시킬 수 있으신 분,</span>
                                            <span>bkc와 함께 동반성장 하실 분,</span><br>
                                            <span>지금 bkc에서 여러분의 열정을 펼치세요!</span>
                                        </p>
                                    </div>
                                </div>
                                <div class="recruit-wrap2">
                                    <div class="recruit_status">
                                        <img src="1.PNG" alt="채용 현황" width="1050px" value="안녕"></div>
                                       
<div style="left: 500px;  bottom: 0; color:white;font-size: 1.8em; font-weight: bold; position: absolute;">
서류전형  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1.OJT   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
면접심사 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        신체검사  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          최종합격<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2.매장실습/평가
   </div>
   
   
   
                                       
                                    <div class="recruit_board">
                                        <table class="tablelist1">
                                            <colgroup>
                                                <col style="width: 20%;">
                                                <col style="width: 40%;">
                                                <col style="width: 20%;">
                                                <col style="width: 20%;">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th scope="col">상태</th>
                                                    <th scope="col">모집부분</th>
                                                    <th scope="col">제목</th>
                                                    <th scope="col">마감일</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td colspan="3">등록된 채용 공고가 없습니다</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="board_paging">
                                                <nav class="pagination">
                                                    <ul class="paging"></ul>
                                                    <p class="page_count"></p>
                                                </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>
        </body>
    </head>
</html>