<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">

<!--font google web font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
   rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon"
   href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/icon/apple-icon.png" />

<!-- jQuery -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../resources/jquery/jquery-3.6.0.min.js"></script>

<!-- js -->
<script src="../resources/js/include/main-gnb.js"></script>

<!--css-->
<link rel="stylesheet" href="../resources/css/include/main-gnb.css">
<link rel="stylesheet" href="../resources/css/subpages/brand/storyview.css?v=<%=System.currentTimeMillis() %>" />

<title>BrandStory</title>
</head>
<body>
   <!-- main-header -->
   <jsp:include page="../../include/header/main_desktop_header.jsp" />
   <jsp:include page="../../include/header/main_mobile_header.jsp" />
   
   <div class="contentsWrap eventWrap">
       <div class="locationWrap WEB">
          <div class="story_web_container">
             <div class="page_navi">
                   	<a href="#/home" class="arrow" > <span>HOME</span>&nbsp;>&nbsp;
					</a><a class="arrow"> <span>브랜드스토리 </span>&nbsp;>&nbsp;</a>
					<a class="arrow"><span> BKC스토리 </span></a>		
             </div>
          </div>
       </div>
	   <div class="contentsBox01 bg_w">
	      <div class="story_web_container">
	         <div class="subtitWrap">
	            <h3 class="page_tit">브랜드 스토리</h3>
	            <div class="tab01 bdBot">
	               <ul>
	                  <li class='on'>
	                     <button type="button"
	                        onclick="location.href='${pageContext.request.contextPath }/brand/brandStory.do'">
	                        <span>BKC 스토리</span>
	                     </button>
	                  </li>
	                  <li>
	                     <button type="button"
	                        onclick="location.href='${pageContext.request.contextPath }/brand/whybkc.do'">
	                        <span>WHY BKC</span>
	                     </button>
	                  </li>
	                  <li>
	                     <button type="button"
	                        onclick="location.href='${pageContext.request.contextPath }/brand/newsNewItem.do'">
	                        <span>BKC NEWS</span>
	                     </button>
	                  </li>
	               </ul>
	            </div>
	         </div>
	      </div>
	      <div class="tab_storyWrap">
	         <ul class= "story_web_container tab_storyBtn m_shadow">
	            <li class="on">
	               <button type="button" id="about">ABOUT BKC</button>
	            </li>
	            <li>
	               <button type="button" id="history">HISTORY</button>
	            </li>
	         </ul>
	         <div class="tab_aboutCon story_web_container" id="abo">
	         	<c:forEach var="AboutbkcList" items="${AboutbkcList}">
	            <div class="about01">
	               <img src="${AboutbkcList.path}" alt=""/>
	               <h3>${AboutbkcList.title}</h3>
	               <p>${AboutbkcList.content}</p>
	            </div>
	            </c:forEach>
	         </div>
	         <div class="tab_historyWrap" id="his" style="display: none;">
	            <div class="tab_historyCon hisBg01">
	               <div class="history_bgBox">
	               	  <c:forEach var="HistoryList" items="${HistoryList}">
	                  <div class="history_area">
	                  	<h4 class="yeartit">${HistoryList.title}</h4>
	                  	<pre class="yeartext">
${HistoryList.content}</pre>
	                  </div>
	                  </c:forEach>
	               </div>
	            </div>
	         </div>
	      </div>
	   </div>
	</div>
	<!-- js -->
    <script src="../resources/js/subpages/brand/menuitem.js"></script>
	
   <a href="#app" class="btn_top" style="opacity: 1; display: inline;">Top</a>

   <!-- main-footer -->
   <jsp:include page="../../include/footer/main_desktop_footer.jsp" />
   <jsp:include page="../../include/footer/main_mobile_footer.jsp" />
</body>
</html>