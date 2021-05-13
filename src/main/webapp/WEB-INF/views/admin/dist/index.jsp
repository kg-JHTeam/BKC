<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<title>BKC 홈페이지 관리자 페이지</title>
</head>
<body class="sb-nav-fixed">
	<
	<!-- firstHeader -->
	<jsp:include page="../include/firstHeader.jsp" />

	<div id="layoutSidenav">
		<!-- secondHeader -->
		<jsp:include page="../include/secondHeader.jsp" />
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1 class="mt-4">Dashboard</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">Dashboard</li>
					</ol>
					<div class="row">
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-blue">
                              <div class="panel-left pull-left blue">
                                <i class="fa fa-shopping-cart fa-5x"></i>
								</div>
                            <div class="panel-right pull-right"><br>
							<h3>
							<fmt:formatNumber value="${totalSales}" pattern="#,###"/>￦
							</h3>
							<strong>모든매장 총 매출액 합계</strong>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-brown">
                            <div class="panel-left pull-left brown">
                                <i class="fa fa-users fa-5x"></i>
                            </div>
                            <div class="panel-right pull-right"><br>
							<h3>${userCount }</h3>
                             <strong>가입회원 수</strong>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-green">
                            <div class="panel-left pull-left green">
                                <i class="fa fa-store fa-5x"></i>
                            </div>
                            <div class="panel-right pull-right"><br>
								<h3>${bestStore}</h3>
                               <strong>BEST STORE</strong>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-brown">
                            <div class="panel-left pull-left brown">
                                <i class="fa fa-thumbs-up fa-5x"></i>
                            </div>
                            <div class="panel-right pull-right"><br>
							<h3>${bestMenu} </h3>
                             <strong>BEST MENU</strong>
                            </div>
                        </div>
                    </div>
                </div>
					 <br><br><br>
					<!-- 매출 현황 -->
					<div class="row">
					 <br><br><br>
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-area mr-1"></i> 월별 매출 현황
								</div>
								<div class="card-body" style="display: table-cell">
									<canvas id="myAreaChart" width="100%" height="40"></canvas>
		
								</div>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-area mr-1"></i> 지점별 매출 현황
								</div>
								<div class="card-body">
									<div id="chart_div" style="width: 100%; height:240px;"></div>
								</div>
							</div>
						</div>
					</div>

					<!-- 회원 리스트  -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 회원리스트
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>아이디(이메일)</th>
											<th>이름</th>
											<th>핸드폰번호</th>
											<th>회원/비회원 정보</th>
											<th>이메일 동의여부</th>
											<th>SNS 동의여부</th>
											<th>탈퇴/휴면 여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${users}">
											<tr>
												<td><c:out value="${user.userid}"/></td>
												<td>${user.name}</td>
												<td>${user.phone}</td>
												<td><c:choose>
														<c:when test="${user.regist_type eq 1 }">
															회원
														</c:when>
														<c:otherwise>
															비회원
														</c:otherwise>
													</c:choose></td>
												<td><c:choose>
														<c:when test="${user.sms_agree eq true }">
															동의
														</c:when>
														<c:otherwise>
															미동의
														</c:otherwise>
													</c:choose></td>
												<td><c:choose>
														<c:when test="${user.email_agree eq true }">
															동의
														</c:when>
														<c:otherwise>
															미동의
														</c:otherwise>
													</c:choose></td>
												<td><c:choose>
														<c:when test="${user.enabled eq true }">
															-
														</c:when>
														<c:otherwise>
															휴면회원	
														</c:otherwise>
													</c:choose></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2020</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/js/admin/scripts.js"></script>
	<script src="<c:url value='/resources/js/admin/chart/moment.min.js'/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="<c:url value='/resources/js/admin/chart/chartUtils.js'/>"></script>
	<script src="<c:url value='/resources/js/admin/chart/chartCommon.js'/>"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>

	<script src="${contextPath }/resources/assets/demo/datatables-demo.js"></script>
	<script>
		var totalChart = null;
		
		function initChart2() {
			makeStoreChart();
		}

		var data = new Date();

		function initChart() {
			var dataChartCtx = document.getElementById("myAreaChart").getContext("2d");

			//차트 데이터 초기화  by chartCommon.js
			var totalChartData = chartDataSet;

			totalChart = new Chart(dataChartCtx, {
				type: 'line',
				data: totalChartData,
				options: chartOptions  // by chartCommon.js
			});

			makChart();
			
		}

		//차트 생성
		function makChart() {

			//파라미터 생성
			var param = function () {
				var now = moment(new Date(new Date().toISOString())).format('YYYY-MM-DD 00:00:00');
				var startDate = moment(now).format('YYYY') + '-01-01';
				var endDate =   moment(now).format('YYYY-MM-DD');

				var result = {
					startDate: startDate,
					endDate: endDate
				}
				//console.log(result);
				return result;
			}

			$.ajax({
				url: '/bkc/admin/dash/chartData.ad',
				type: "post",
				dataType: "json",
				data: param(),
				success: function (data) {
					//console.log(data);
					drawCharts(data);

				},
				fail: function (data) {
					console.log(data)
				},
				error: function (data, status, error) {
					console.log(error);
				}
			});

		}
		
		google.charts.load('current', {'packages':['bar']});
	    //google.charts.setOnLoadCallback(drawChart);

		function drawCharts(data) {

			if (typeof data != 'undefined') {

				var chartData = chartDataSet;
				chartData.labels = data.chartLabels;
				chartData.datasets[0].label = '총매출';
				chartData.datasets[0].data = data.chartData;
				chartData.datasets[0]['fill'] = false;
				chartData.datasets[0]['borderWidth'] = 2;
				chartData.datasets[0]['cubicInterpolationMode'] = 'monotone';

				totalChart.data = chartData;

				var max = maxValue(data.chartData);
				console.log(max);
				var stepSize = getStepSize(max);

				var chartOpt = getChartOption(max, stepSize);

				totalChart.options = chartOpt;
				totalChart.update();

			}
		}

		function getChartOption(max, stepSize) {
			var option = chartOptions;
			option.scales.yAxes[0].ticks.min = 0;
			option.scales.yAxes[0].ticks.max = max;
			option.scales.yAxes[0].ticks.stepSize = stepSize;
			return option;
		}

		$(document).ready(function () {
			initChart();
			initChart2();
		});
		
		
		 function makeStoreChart() {
				$.ajax({
					url: '/bkc/admin/storelist.ad',
					type: "post",
					dataType: "json",
					data: {
						month: 6
					},
					success: function (data) {
						console.log(data);
						drawChartStore(data);
					},
					fail: function (data) {
						console.log(data)					
					},
					error: function (data, status, error) {
						console.log(error);
					}
				});
			}
		
		 function drawChartStore(input) {

		    	var chartData = [['Store', '매출']];
		    	input.data.forEach(function(e){
		    		console.log(e); 
		    		chartData.push([e.x,e.yList[0]]);
		    	});
		    	var data = google.visualization.arrayToDataTable(chartData);
		    	

		        var options = {
		          chart: {
		            title: '',
		            subtitle: '',
		          },
		          
		          vAxis: {
		    			format: 'decimal'
		    		},
		    		
		          bars: 'vertical'
		        };

		        var chart = new google.charts.Bar(document.getElementById('chart_div'));
		        chart.draw(data, google.charts.Bar.convertOptions(options));
		    }
		 
	</script>
</body>
</html>
