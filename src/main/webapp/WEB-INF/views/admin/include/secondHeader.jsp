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
                            <a class="nav-link" href="${contextPath}/goAdminPage.ad">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i>
                                	대쉬보드 
                               	</div>
                              </a>
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
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCoupons" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-barcode"></i></i></div>
                                	쿠폰관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseCoupons" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                	<a class="nav-link" href="${contextPath}/admin/couponlist.ad">쿠폰 리스트</a>
                                	<a class="nav-link" href="${contextPath}/admin/couponUserlist.ad">회원 쿠폰 리스트</a>
                                	<a class="nav-link" href="${contextPath}/admin/couponRelease.ad">회원 쿠폰 배포</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOrders" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-box-open"></i></i></div>
                                	주문관리 
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseOrders" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                	<a class="nav-link" href="${contextPath}/admin/orderlist.ad">주문 리스트</a>
                                	<a class="nav-link" href="${contextPath}/admin/orderReceiptlist.ad">주문 접수 리스트</a>
                                	<a class="nav-link" href="${contextPath}/admin/orderCompleteList.ad">주문 완료 리스트 </a>
                                	<a class="nav-link" href="${contextPath}/admin/orderCancellationList.ad">주문 취소 리스트 </a>
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
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseSubpage" aria-expanded="false" aria-controls="pagesCollapseError">
                                        	서브페이지 관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseSubpage" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="${contextPath}/admin/adminAllList.ad">BKC 메뉴 관리</a>
                                            <a class="nav-link" href="${contextPath }/admin/eventlist.ad">BKC 이벤트 게시판 관리</a>
                                            <a class="nav-link" href="${contextPath }/admin/storelist.ad">BKC 신규매장 게시판 관리</a>
                                            <a class="nav-link" href="${contextPath }/admin/noticelist.ad">공지사항 게시판 관리</a>
                                            <a class="nav-link" href="${contextPath }/admin/faqlist.ad">FAQ 게시판 관리</a>
                                            <a class="nav-link" href="${contextPath }/admin/bkcstorylist.ad">BKC스토리 관리</a>
                                            <a class="nav-link" href="${contextPath }/admin/whybkclist.ad">WHYBKC 관리</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseDeliverypage" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        	딜리버리페이지관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseDeliverypage" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="${contextPath}/delivery/admin/cautionList.ad">이용약관</a>
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
                                    <a class="nav-link" href="${contextPath}/admin/salelist.ad"> 차트</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">BKC :</div>
                    </div>
                </nav>
            </div>
</body>
</html>
