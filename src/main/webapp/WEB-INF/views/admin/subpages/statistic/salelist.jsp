<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>BKC 홈페이지 관리자 페이지</title>
<style>

#menuimgCol {
	text-align: center;
}

#menuimg {
	width: 233px;
	height: 160px;
}
.getMonthTotal, .getDayTotal { 
	width:250px; 
	height:100px; 
	border: 4px #000; 
	text-align: center;
	vertical-align: center;
	display: table-cell;
}

.getMonthTotal span, .getDayTotal span{
	border: 2px solid black;
	font-weight: bold;
	font-size: 24px;
	padding: 14px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body class="sb-nav-fixed">
	<!-- firstHeader -->
	<jsp:include page="../../include/firstHeader.jsp" />
	<div id="layoutSidenav">
		<!-- secondHeader -->
		<jsp:include page="../../include/secondHeader.jsp" />
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1 class="mt-4">지점별 목록</h1>
					<!-- 공지사항 목록 -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 목록
						</div>
						<div class="card-body">
							
							<div class="table-responsive">
								<form action="#">
									<div align="right">
										<select class="btn btn-info dropdown-toggle" id="select1"
											name="select" style="width: 200px" onchange="changeSelect()">
											<option value="monthSaleList" selected>월별 매출 조회</option>
											<option value="storeSaleList">지점별 매출 조회</option>
											<option value="productSaleList">카테고리별 매출 조회</option>
											<option value="daySaleList">메뉴별 매출 조회</option>
										</select> 									
									</div>
								</form>
								<div id="sales" style="display: table; margin-left: 300px;">
									<div class="getMonthTotal">
										<span>월 매출: ${month_total}</span>
									</div>
									<div class="getDayTotal">
										<span>일 매출: ${day_total}</span>
									</div>
								</div>
								<div id="chart_div" style="width: 900px; height:500px; margin-left:200px;" ></div>
								
							</div>
						</div>
					</div>
				</div>
			</main>

			<!-- firstHeader -->
			<jsp:include page="../../include/footer.jsp" />
		</div>
	</div>

<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		crossorigin="anonymous"></script> -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/js/admin/scripts.js"></script>
	<!--  <script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/assets/demo/chart-area-demo.js"></script>
	<script src="${contextPath }/resources/assets/demo/chart-bar-demo.js"></script>-->
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/assets/demo/datatables-demo.js"></script>
	<script>

	google.charts.load('current', {'packages':['line', 'bar', 'corechart']});
	
    function drawChartMonth(input) {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Month');
        data.addColumn('number', 'Count');
    	var chartData = [];
    	console.log("test");
    	console.log(input);
    	input.data.forEach(function(e){
    		console.log("test2");
    		console.log(e); 
    		chartData.push([e.x,e.yList[0]]);
    	});
    	data.addRows(chartData);
    	
      	var options = {
    		chart:{
    			title: '매출 현황'
    		},
    			        
    		vAxis: {
    			format: 'decimal'
    		},
    		
            width: 900,
            height: 500
      };

        var chart = new google.charts.Line(document.getElementById('chart_div'));

      chart.draw(data, google.charts.Line.convertOptions(options));
    }
    
    
    function drawChartDay(input) {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Day');
        data.addColumn('number', 'Count');
    	var chartData = [];
    	console.log("test");
    	console.log(input);
    	input.data.forEach(function(e){
    		console.log("test2");
    		console.log(e); 
    		chartData.push([e.x,e.yList[0]]);
    	});
    	data.addRows(chartData);    	

      var options = {
    		chart:{
    			title: '매출 현황'
    		},
    		
    		vAxis: {
    			format: 'decimal'
    		},
    		
            width: 900,
            height: 500
      };

        var chart = new google.charts.Line(document.getElementById('chart_div'));
		chart.draw(data, google.charts.Line.convertOptions(options));
    }
    
    
    function drawChartStore(input) {

    	var chartData = [['Store', 'Count']];
    	input.data.forEach(function(e){
    		console.log(e); 
    		chartData.push([e.x,e.yList[0]]);
    	});
    	var data = google.visualization.arrayToDataTable(chartData);
    	

        var options = {
          chart: {
            title: '지점별 매출 현황',
            subtitle: '최근 6개월 간 지점별 매출 비교',
          },
          
          vAxis: {
  			format: 'decimal'
  		},
          
          bars: 'vertical'
        };

        var chart = new google.charts.Bar(document.getElementById('chart_div'));
        chart.draw(data, google.charts.Bar.convertOptions(options));
    }
    
    function drawChartCategory(input) {

    	var chartData = [['Category', 'Count']];
    	input.data.forEach(function(e){
    		console.log(e); 
    		chartData.push([e.x,e.yList[0]]);
    	});
    	var data = google.visualization.arrayToDataTable(chartData);
    	

    	var options = {
    	          title: '메뉴 카테고리별 판매량 비교', 
    	              slices: {
    	                  0: { color: 'red' },
    	                  1: { color: 'brown' },
    	                  2: { color: 'yellow' } 
    	                }
    	        };

    	        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    	        chart.draw(data, options);
    	}
    
   
    function drawChartProduct(input) {

    	var chartData = [['Product', 'Count']];
    	input.data.forEach(function(e){
    		console.log(e); 
    		chartData.push([e.x,e.yList[0]]);
    	});
    	var data = google.visualization.arrayToDataTable(chartData);
    	

    	var options = {
    	          title: '메뉴별 판매량 비교', 
    	             
    	        };

    	        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));

    	        chart.draw(data, options);
    	}

		var totalChart = null;

		function initChart() {
			makeMonthChart();
		}

		var data = new Date();
		
		function makeMonthChart() {
			$.ajax({
				url: '/bkc/admin/chartData-month.ad',
				type: "post",
				dataType: "json",
				data: {
					month: 6
				},
				success: function (data) {
					console.log(data);
					drawChartMonth(data);
				},
				fail: function (data) {
					console.log(data)					
				},
				error: function (data, status, error) {
					console.log(error);
				}
			});
		}		
		
		function makeDayChart() {
			$.ajax({
				url: '/bkc/admin/chartData-day.ad',
				type: "post",
				dataType: "json",
				data: {
					day: 7
				},
				success: function (data) {
					console.log(data);
					drawChartDay(data);
				},
				fail: function (data) {
					console.log(data)					
				},
				error: function (data, status, error) {
					console.log(error);
				}
			});
		}		

		function makeStoreChart() {
			$.ajax({
				url: '/bkc/admin/chartData-store.ad',
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

		function makeCategoryChart() {
			$.ajax({
				url: '/bkc/admin/chartData-category.ad',
				type: "post",
				dataType: "json",
				data: {
					month: 6
				},
				success: function (data) {
					console.log(data);
					drawChartCategory(data);
					
				},
				fail: function (data) {
					console.log(data)					
				},
				error: function (data, status, error) {
					console.log(error);
				}
			});
		}
		
		
		function makeProductChart() {
			$.ajax({
				url: '/bkc/admin/chartData-product.ad',
				type: "post",
				dataType: "json",
				data: {
					month: 6
				},
				success: function (data) {
					console.log(data);
					drawChartProduct(data);
					
				},
				fail: function (data) {
					console.log(data)					
				},
				error: function (data, status, error) {
					console.log(error);
				}
			});
		}		
		
		function changeSelect(){
			var target = $("#select1").val();
			if (target == "monthSaleList"){
				makeMonthChart();				
			}else if (target == "storeSaleList"){
				makeStoreChart();						
			}else if (target == "productSaleList"){
				makeCategoryChart();				
			}else if (target == "daySaleList"){
				makeProductChart();
			}
		}
		
		$(document).ready(function () {
			initChart();
		});

	</script>

</body>
</html>
