<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon"
    href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/bkclogo/favicon.png" />
<!--css-->
<link rel="stylesheet" href="../resources/css/include/main-gnb.css">
<link rel="stylesheet"
   href="../resources/css/subpages/customerService/faq.css?v=<%=System.currentTimeMillis() %>" />

<!--jQuery-->
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>

<!--js-->
<script src="../resources/js/include/main-gnb.js"></script>

<!--font-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
   rel="stylesheet">

<!--logo-->
<link rel="shortcut icon" type="image/x-icon"
   href="https://bkcbuc.s3.ap-northeast-2.amazonaws.com/images/logo/mainlogo.png">
<title>고객센터</title>
</head>
<body>
   <!-- main-header -->
   <jsp:include page="../../include/header/main_desktop_header.jsp" />
   <jsp:include page="../../include/header/main_mobile_header.jsp" />
   <div class="contentsWrap">
      <div class="locationWrap">
         <div class="faq_web_container">
            <div class="page_navi">
               <a href="#/home"> <span>HOME&nbsp;</span>>
               </a> <span> &nbsp;고객센터&nbsp;>&nbsp; </span> <span>FAQ</span>                      
            </div>
         </div>
      </div>
      <div class="contentsBox01 bg_w">
         <div class="faq_web_container">
            <div class="subtitWrap">
               <h3 class="page_tit">고객센터</h3>
               <div class="tab01 m_shadow">
                  <ul>
                     <li>
                        <button type="button"
                           onclick="location.href='${pageContext.request.contextPath }/customerService/notice.do'">
                           <span>공지사항</span>
                        </button>
                     </li>
                     <li>
                        <button type="button"
                           onclick="location.href='${pageContext.request.contextPath }/customerService/appguide.do'">
                           <span>BKC앱이용안내</span>
                        </button>
                     </li>
                     <li class="on">
                        <button type="button"
                           onclick="location.href='${pageContext.request.contextPath }/customerService/faq.do'">
                           <span>FAQ</span>
                        </button>
                     </li>
                     <li>
                        <button type="button"
                           onclick="location.href='${pageContext.request.contextPath }/customerService/inquiry.do'">
                           <span>문의</span>
                        </button>
                     </li>
                     <li>
                        <button type="button"
                           onclick="location.href='${pageContext.request.contextPath }/customerService/chain.do'">
                           <span>가맹점모집</span>
                        </button>
                     </li>
                     <li>
                        <button type="button"
                           onclick="location.href='${pageContext.request.contextPath }/customerService/recruit.do'">
                           <span>인재채용</span>
                        </button>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="faq_web_container">
            <div class="tab_cont">
               <h4 class="hide">FAQ</h4>
               <div class="faq_category">
                  <label class="switch01">
                     <input type="radio" name="faqcategory" onclick="location.href='${pageContext.request.contextPath }/customerService/faq.do'" ${Faqvo.category == "" ? "checked" : ""}>
                     <span>전체</span>
                  </label>
                  <label class="switch01">
                     <input type="radio" name="faqcategory" onclick="location.href='${pageContext.request.contextPath }/customerService/faq.do?category=제품'" ${Faqvo.category == "제품" ? "checked" : ""}>
                     <span>제품/품질/서비스</span>
                  </label>
                  <label class="switch01">
                     <input type="radio" name="faqcategory" onclick="location.href='${pageContext.request.contextPath }/customerService/faq.do?category=딜리버리'" ${Faqvo.category == "딜리버리" ? "checked" : ""}>
                     <span>딜리버리 주문</span>
                  </label>
                  <label class="switch01">
                     <input type="radio" onclick="location.href='${pageContext.request.contextPath }/customerService/faq.do?category=임대'"name="faqcategory" ${Faqvo.category == "임대" ? "checked" : ""}>
                     <span>임대/가맹</span>
                  </label>
                  <label class="switch01">
                     <input type="radio" onclick="location.href='${pageContext.request.contextPath }/customerService/faq.do?category=BKC카드'"name="faqcategory" ${Faqvo.category == "BKC카드" ? "checked" : ""}>
                     <span>BKC카드</span>
                  </label>
                  <label class="switch01">
                     <input type="radio" onclick="location.href='${pageContext.request.contextPath }/customerService/faq.do?category=기타'"name="faqcategory">
                     <span>기타</span>
                  </label>
               </div>
               <div class="board_list">
                  <table class="tlist01 acc_type">
                     <colgroup>
                        <col style="width: 10%;">
                        <col style="width: 20%;">
                     </colgroup>
                     <thead>
                        <tr>
                           <th scope="col">No.</th>
                           <th scope="col">구분</th>
                           <th scope="col">제목</th>
                        </tr>
                     </thead>
                     <tbody style="display: none;">
                        <tr>
                           <td colspan="3">등록된 FAQ가 없습니다</td>
                        </tr>
                     </tbody>
                     <tbody>
                     	<c:forEach var="FaqList" items="${FaqList}">
                        <tr class="acc_tit_tr">
                           <td class="WEB">${FaqList.rn}</td>
                           <td class="category">
                              <span>${FaqList.category}</span>
                           </td>
                           <td>
                              <div class="acc_tit">
                                 <span class="tit">${FaqList.title}</span>
                                 <button type="button" class="btn_acc">
                                    <span>FAQ 내용 보기</span>
                                 </button>
                              </div>
                           </td>
                        </tr>
                        <tr class="acc_cont">
                           <td colspan="3">${FaqList.contents}</td>
                        </tr>
                        </c:forEach>
                     </tbody>
                  </table>
                  <div class="board_paging">
                  	<div class="VuePagination">
                  		<ul>
                  			${pageing}
                  		</ul>
                  	</div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- main-footer -->
	<jsp:include page="../../include/footer/main_desktop_footer.jsp" />
	<jsp:include page="../../include/footer/main_mobile_footer.jsp" />
   <script src="../resources/js/customerService/cs.js"></script>
</body>
</html>