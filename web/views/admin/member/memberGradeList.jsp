<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap core JavaScript-->
<title>Share Things</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
html {
	heigth: 100%
}

#content-wrapper {
	min-height: 90%;
}

#pageName {
	margin-left: 30px;
}

table {
	border: 2px solid black;
	text-align: center;
}

th, td {
	border: 1px dashed black;
	color: black;
	height: 50px;
}

.tableArea {
	height: 400px;
}

.btnArea {
	width: 650px;
	margin: 0 auto;
}
</style>
<!-- Custom fonts for this template-->
<link
	href="<%=request.getContextPath()%>/resource/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="<%=request.getContextPath()%>/resource/css/sb-admin-2.min.css"
	rel="stylesheet">

</head>

<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- 사이드바 인클루드 -->
		<%@ include file = "../common/sidebar.jsp"%>
		<!-- End of Sidebar -->

		<!--콘텐츠 영역 시작-->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- 메인 콘텐츠 영역 시작 -->
			<div id="content">
				<!-- 헤더 인클루드 -->
				<%@ include file="../common/header.jsp"%>
				<!-- 컨텐츠바디 영역 실제 작성 영역 -->
				<div id="pageName">
					<h2 style="color: black">
						<b>회원등급관리</b>
					</h2>
				</div>
				<img src="/st/resource/img/adminHr.png" width="100%">

				<div class="table-responsive">
					<br>
					<h2 align="center"></h2>
					<div class="tableArea">
						<table id="listArea" align="center">
							<tr>
								<th width="300px" style="color: black">회원등급</th>
								<th width="300px" style="color: black">기준</th>
								<th width="300px" style="color: black">혜택</th>
							</tr>
							<tr>
								<td>VVIP</td>
								<td>00 ~ 00점</td>
								<td>적립금 5% 적립</td>
							</tr>
							<tr>
								<td>VIP</td>
								<td>00 ~ 00점</td>
								<td>적립금 4% 적립</td>
							</tr>
							<tr>
								<td>Gold</td>
								<td>00 ~ 00점</td>
								<td>적립금 3% 적립</td>
							</tr>
							<tr>
								<td>찌끄래기</td>
								<td>00 ~ 00점</td>
								<td>적립금 2% 적립</td>
							</tr>
						</table>
						<br>
						<div class="btnArea" align="center">
							<button>수정하기</button>
						</div>
					</div>


				</div>

				<!-- 메인 콘텐트 영역 끝 -->
			</div>
			<!-- Footer 인클루드 -->
			<%@ include file="../common/footer.jsp"%>
			<!-- 메인 콘텐츠 영역 끝 -->
		</div>
		<!-- 콘텐츠 영역 끝 -->
	</div>

	<!-- 맨위로-->
	<%@ include file="../common/toTop.jsp"%>

	<!-- 로그아웃 모달-->
	<%@ include file="../common/logoutModal.jsp"%>


	<script
		src="<%=request.getContextPath()%>/resource/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<%=request.getContextPath()%>/resource/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="<%=request.getContextPath()%>/resource/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="<%=request.getContextPath()%>/resource/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="<%=request.getContextPath()%>/resource/js/demo/chart-area-demo.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/js/demo/chart-pie-demo.js"></script>
</body>

</html>

