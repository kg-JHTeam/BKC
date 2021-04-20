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
<title>메뉴등록</title>
<style>
#bannerimgCol {
	text-align: center;
}

#bannerimg {
	width: 898.8px;
	height: 540.4px;
}

#imgDetail {
	text-align: center;
}
</style>
<script>
	$(document).ready(function() {
		var path = '${update.filePath}';
		var selected = '${select}';
		var coded = $("#code").val();
		console.log(selected);
		console.log(coded);
		console.log(path);

		if (selected == "chiken") {
			$(".price").remove();
		} else if (selected == "wrap") {
			
			$(".price").remove();
		} else if (selected == "morning") {
			$(".price15").remove();
			$(".price30").remove();
		} else if (selected == "salad") {
			$(".price15").remove();
			$(".price30").remove();
		} else if (selected == "cookie") {
			$(".category").remove();
			$(".price15").remove();
			$(".price30").remove();
		} else if (selected == "was") {
			$(".category").remove();
			$(".price15").remove();
			$(".price30").remove();
		} else if (selected == "drink") {
			$(".form").remove();
			$(".category").remove();
			$(".price15").remove();
			$(".price30").remove();
		}

		$("#deleteBtn").click(function() {
			var select = selected;
			var code = coded;

			var form = document.createElement("form");
			form.setAttribute("method", "post");
			form.setAttribute("action", "menuDelete.mdo");

			var input_select = document.createElement("input");
			input_select.setAttribute("type", "hidden");
			input_select.setAttribute("name", "select");
			input_select.setAttribute("value", select);
			var input_code = document.createElement("input");
			input_code.setAttribute("type", "hidden");
			input_code.setAttribute("name", "code");
			input_code.setAttribute("value", code);
			form.appendChild(input_select);
			form.appendChild(input_code);
			document.body.appendChild(form);
			form.submit();
		})

		function btnUpdate() {
			var select = selected;
			var code = coded;
			console.log(select);
			console.log(code);

			var form = document.createElement("form");
			form.setAttribute("method", "post");
			form.setAttribute("action", "menuUpdate.mdo");

			var input_select = document.createElement("input");
			input_select.setAttribute("type", "hidden");
			input_select.setAttribute("name", "select");
			input_select.setAttribute("value", select);
			var input_code = document.createElement("input");
			input_code.setAttribute("type", "hidden");
			input_code.setAttribute("name", "code");
			input_code.setAttribute("value", code);
			form.appendChild(input_select);
			form.appendChild(input_code);
			document.body.appendChild(form);
			form.submit();
		}
	});
</script>
</head>
<body class="sb-nav-fixed">
	<!-- firstHeader -->
	<jsp:include page="../../include/firstHeader.jsp" />
	<div id="layoutSidenav">
		<!-- secondHeader -->
		<jsp:include page="../../include/secondHeader.jsp" />


		<!-- firstHeader -->
		<jsp:include page="../../include/footer.jsp" />
	</div>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/js/admin/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/assets/demo/chart-area-demo.js"></script>
	<script src="${contextPath }/resources/assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/assets/demo/datatables-demo.js"></script>
</body>
</html>
