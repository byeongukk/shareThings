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
<style>
html {
	heigth: 100%
}
#content-wrapper {
	min-height: 90%;
}

.card-body {
	height: 200px;
}
.card {
	width: 80%; text-align : center;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
.row {
	margin-top:50px;
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
		<%@ include file="../common/sidebar.jsp"%>
		<!-- End of Sidebar -->

		<!--콘텐츠 영역 시작-->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- 메인 콘텐츠 영역 시작 -->
			<div id="content">
				<!-- 헤더 인클루드 -->
				<%@ include file="../common/header.jsp"%>
				<!-- 컨텐츠바디 영역 실제 작성 영역 -->
				<div class="container-fluid">
					<div>
						<h1 align="center" style="color:black">오늘 하루도 열심히 코딩하는 사람이 되도록 노력합시다!!</h1>
					</div>
					<hr>
					<div class="row">
						<div class="col-lg-6 mb-4">
							<div class="card bg-primary text-white shadow">
								<div class="card-body">
									<b>등록관리</b>
									<hr color="white">
									<div class="text-white-50 small">등록요청 00건</div>
									<div class="text-white-50 small">등록승인현황 00건</div>
									<div class="text-white-50 small">미반품건 00건</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 mb-4">
							<div class="card bg-success text-white shadow">
								<div class="card-body">
									<b>대여관리</b>
									<hr color="white">
									<div class="text-white-50 small">대여요청 00건</div>
									<div class="text-white-50 small">대여 취소 요청 00건</div>
									<div class="text-white-50 small">반품 요청 00건</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 mb-4">
							<div class="card bg-info text-white shadow">
								<div class="card-body">
									<b>게시글 현황</b>
									<hr color="white">
									<div class="text-white-50 small">공지사항 00건</div>
									<div class="text-white-50 small">1:1문의 00건</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 mb-4">
							<div class="card bg-warning text-white shadow">
								<div class="card-body">
									<b>정산 현황</b>
									<hr color="white">
									<div class="text-white-50 small">회원 입금 대기 00건</div>
									<div class="text-white-50 small">회원 환불 대기 00건</div>
									<div class="text-white-50 small">기업 매출 50000원</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 메인 콘텐트 영역 끝 -->
				<!-- Footer 인클루드 -->
			</div>
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

