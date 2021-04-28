<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="#">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                               	 대쉬보드
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-card"></i></div>
                                	회원관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="${contextPath}/admin/userManagerlist.ad">매장관리자 리스트 </a>
                                    <a class="nav-link" href="${contextPath}/admin/userlist.ad">회원 리스트</a>
                                    <a class="nav-link" href="${contextPath}/admin/userNonlist.ad">비회원 리스트</a>
                                    <a class="nav-link" href="${contextPath}/admin/userSignoutList.ad">탈퇴회원 리스트</a>
                                    <a class="nav-link" href="${contextPath}/admin/userDormantlist.ad">휴면회원 리스트</a>
                                    <a class="nav-link" href="#">e-mail 관리</a>
                                    <a class="nav-link" href="#">SMS 관리</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCoupons" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-barcode"></i></i></div>
                                	쿠폰관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseCoupons" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                	<a class="nav-link" href="#">쿠폰배포 </a>
                                    <a class="nav-link" href="#">새 쿠폰 추가 </a>
                                    <a class="nav-link" href="#">쿠폰 리스트</a>
                                    <a class="nav-link" href="#">쿠폰 수정</a>
                                    <a class="nav-link" href="#">쿠폰 삭제</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                	홈페이지 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseMainpage" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        	메인페이지관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseMainpage" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="${contextPath}/admin/bannerlist.ad">메인배너 관리</a>
                                            <a class="nav-link" href="${contextPath}/admin/youtubeList.ad">유튜브광고 관리</a>
                                            <a class="nav-link" href="">메인로고 관리</a>
                                            <a class="nav-link" href="">홈페이지메뉴 관리</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseSubpage" aria-expanded="false" aria-controls="pagesCollapseError">
                                        	서브페이지 관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseSubpage" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="${contextPath}/admin/menuListAd.ad">BKC 메뉴 관리</a>
                                            <a class="nav-link" href="${contextPath }/admin/eventlist.ad">BKC 이벤트 게시판 관리</a>
                                            <a class="nav-link" href="${contextPath }/admin/storelist.ad">BKC 신규매장 게시판 관리</a>
                                            <a class="nav-link" href="${contextPath }/admin/noticelist.ad">공지사항 게시판 관리</a>
                                            <a class="nav-link" href="${contextPath }/admin/faqlist.ad">FAQ 게시판 관리</a>
                                            <a class="nav-link" href="">신제품 게시판 관리</a>
                                            <a class="nav-link" href="">광고 게시판 관리</a>
                                            <a class="nav-link" href="${contextPath }/admin/bkcstorylist.ad">BKC스토리 관리</a>
                                            <a class="nav-link" href="${contextPath }/admin/whybkc.ad">WHYBKC 관리</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseDeliverypage" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        	딜리버리페이지관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseDeliverypage" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="">주문리스트</a>
                                            <a class="nav-link" href="">주문취소리스트</a>
                                            <a class="nav-link" href="">결제관리</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseFooter" aria-expanded="false" aria-controls="pagesCollapseError">
                                        	푸터 관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseFooter" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="${contextPath}/admin/term.ad">이용약관 관리</a>
                                            <a class="nav-link" href="${contextPath}/admin/termPrivacy.ad">개인정보취급방침 관리</a>
                                            <a class="nav-link" href="${contextPath}/admin/termEmail.ad">이메일약관 관리</a>
                                            <a class="nav-link" href="${contextPath }/admin/businessinformationConent.ad">사업자 정보 관리</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseStatics" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                	판매 통계
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseStatics" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">매장별 판매 현황 </a>
                                    <a class="nav-link" href="#">제품별 판매 현황</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                               	 차트
                            </a>
                            <a class="nav-link" href="">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                               	 테이블
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">BKC :</div>
                    </div>
                </nav>
            </div>
            
            
</body>
</html>
