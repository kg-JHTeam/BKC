<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- jquery -->
<script type="text/javascript">
function button1_click(s) {
	var objParams = {
            "img_seq"      : parseInt(s),   	  // key값
    };
	  $.ajax({
        url         :   "/bkc/mainYoutube.do",
        dataType    :   "json",
        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
        type        :   "post", //post로 보냄
        data        :   objParams,
        success     :   function(retVal){
    		var title = retVal.title;
    		var path = retVal.path;
    		var input1 = document.getElementById("input1");
    	 	document.getElementById("input2").src = path;
    	 	input1.innerHTML = title;
    	 	alert("성공");
        },
    	 error       :   function(request, status, error){
        	console.log("걍 실패");
        }
    });
}
</script>

<!-- jquery -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../resources/jquery/jquery-3.6.0.min.js"></script>

<!--css-->
<link rel="stylesheet" href="../resources/css/include/main-gnb.css">
<link rel="stylesheet"
	href="../resources/css/subpages/brand/Advertising.css">

<!--font google web font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">

<link rel="shortcut icon" type="image/x-icon"
	href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/icon/apple-icon.png" />

<!-- js -->
<script src="../resources/js/include/main-gnb.js"></script>
<script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js"></script>
<title>BrandStory</title>
</head>
<body>
	<!-- main-header -->
	<jsp:include page="../../include/header/main_desktop_header.jsp" />
	<jsp:include page="../../include/header/main_mobile_header.jsp" />
	
	<div class="contentsWrap eventWrap">
		<div class="locationWrap WEB">
			<div class="news_web_container">
				<div class="page_navi">
					<a href="#/home" class="arrow"> <span>HOME</span>&nbsp;>&nbsp;
					</a><a class="arrow"> <span>브랜드스토리 </span>&nbsp;>&nbsp;
					</a> <a class="arrow"><span> BKC NEWS </span></a>		
				</div>
			</div>
		</div>
		<div class="contentsBox01 bg_w">
			<div class="news_web_container">
				<div class="subtitWrap">
					<h3 class="page_tit">브랜드 스토리</h3>
					<div class="tab01 bdBot">
						<ul>
							<li>
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
							<li class="on">
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/brand/newsNewItem.do'">
									<span>BKC NEWS</span>
								</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="news_web_container">
				<div class="tab_cont">
					<ul class="tab_storyBtn m_shadow">
						<li>
							<button type="button" id="realchicken"
								onclick="location.href='${pageContext.request.contextPath }/brand/newsNewItem.do'">
								<span>신제품</span>
							</button>
						</li>
						<li class="on">
							<button type="button" id="nature"
								onclick="location.href='${pageContext.request.contextPath }/brand/Advertising.do'">
								<span>광고(TV/Digital)</span>
							</button>
						</li>
					</ul>
					<div class="tab_cont">
						<div class="new_product">
							<div id="mainYoutube">
								<h4 class="MOB m_subtit">신제품 소개</h4> 
	 							<p class="youtube_tit" id="input1">${youtubeAd[0].title}</p> 
	 							<div class="youtube-zone">
	 								<iframe id="youtube" src="${youtubeAd[0].path}" id="input2"
	 									title="YouTube video player" frameborder="0" 
										allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
	 									allowfullscreen> </iframe> 
	 							</div>
							</div>
							<div class="tab01 m_shadow">
								<ul class="tabbar">
									<li class='on'>
									<label class="box-radio-input">
										<input type="radio" id="2021" name="youtubedate" onclick="location.href='${pageContext.request.contextPath }/brand/Advertising.do?date=2021'" ${youtubevo.date == "2021" ? "checked" : ""}>
										<span>2021</span>
									</li>
									</label>
									<label class="box-radio-input">
									<li>
										<input type="radio" id="2020" name="youtubedate" onclick="location.href='${pageContext.request.contextPath }/brand/Advertising.do?date=2020'" ${youtubevo.date == "2020" ? "checked" : ""}>
										<span>2020</span>
									</li></label>
									<label class="box-radio-input">
									<li>
										<input type="radio" id="2019" name="youtubedate" onclick="location.href='${pageContext.request.contextPath }/brand/Advertising.do?date=2019'" ${youtubevo.date == "2019" ? "checked" : ""}>
										<span>2019</span>
									</li></label>
									<label class="box-radio-input">
									<li>
										<input type="radio" id="2018" name="youtubedate" onclick="location.href='${pageContext.request.contextPath }/brand/Advertising.do?date=2018'" ${youtubevo.date == "2018" ? "checked" : ""}>
										<span>2018</span>
									</li></label>
									<label class="box-radio-input">
									<li>
										<input type="radio" id="2017" name="youtubedate" onclick="location.href='${pageContext.request.contextPath }/brand/Advertising.do?date=2017'" ${youtubevo.date == "2017" ? "checked" : ""}>
										<span>2017</span>
									</li></label>
									<label class="box-radio-input">
									<li>
										<input type="radio" id="2016" name="youtubedate" onclick="location.href='${pageContext.request.contextPath }/brand/Advertising.do?date=2016'" ${youtubevo.date == "2016" ? "checked" : ""}>
										<span>2016~</span>
									</li></label>

								</ul>
							</div>
							<ul class="prdmenu_list">
								<c:forEach var="youtubeAd" items="${youtubeAd}">
									<li>
										<div class="prd_img WEB">
										<!--  <button onclick="changeyoutube(${youtubeAd.img_seq})">-->
										<button id="button1" onclick="button1_click('${youtubeAd.img_seq}');">
											<span>
												<img src="${youtubeAd.thumbnail}" width=290px height=200px>
											</span>
										</button>
										</div>
										<div class="cont">
											<p class="tit">
												<strong>${youtubeAd.title}</strong>
											</p>
										</div>
									</li>
								</c:forEach>
							</ul>
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
	
	<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../resources/jquery/jquery-3.6.0.min.js"></script>
</body>
</html>