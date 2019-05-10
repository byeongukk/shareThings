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
<style>
.card {
	margin-right: center;
	margin-left: center;
	width: 100%;
}

/* .button {
	margin-top: 15%;
} */



.productPic {
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

table {
	font-size: 20px;
}
textarea {
	border:0;
}
</style>
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
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">등록 요청 관리</h1>
					</div>
					<br> <br>
					<div class="row">
						<div class="col-lg-10">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">
										요청날짜 : 2019/05/08<br>등록자 : user01<br>물품 : 노트북<br>등록기간
										: 2019/05/10 ~ 2019/07/10
									</h6>
								</div>
								<div class="card-body">
									<table class="col-lg-10">
										<tr>
											<td>
												<div class="productPic">사진1</div>
											</td>
											<td>
												<div class="productPic">사진2</div>
											</td>
											<td>
												<div class="productPic">사진3</div>
											</td>
										</tr>
										<tr>
											<td colspan="3">구입시기 : 2013년</td>
										</tr>
										<tr>
											<td colspan="3">모델명 : 1234</td>
										</tr>
										<tr>
											<td colspan="3">브랜드 : 삼성</td>
										</tr>
										<tr>
											<td colspan="3">구입가 : 500,000원</td>
										</tr>
										<tr>
											<td colspan="3">물품상태</td>
										</tr>
										<tr>
											<td colspan="3">CPU : i15</td>
										</tr>
										<tr>
											<td colspan="3">메모리 : 1억 GB</td>
										</tr>
										<tr>
											<td colspan="3">운영 체제 : window10</td>
										</tr>
										<tr>
											<td colspan="3">월 렌탈비 : 30,000원</td>
										</tr>
										<tr>
											<td colspan="3">보증금 : 150,000원</td>
										</tr>
										<tr>
											<td colspan="3">전화번호 : 010-1234-5678</td>
										</tr>
										<tr>
											<td colspan="3">주소 : 서울시 강남구</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="row answer">
						<div class="col-lg-4">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">거절 사유</h6>
								</div>
								<div class="card-body">
								<textarea class="col-lg-12" rows="5">거짓 사진</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="button">
						<a
							href="<%=request.getContextPath()%>/views/admin/request/reqProduct.jsp"
							class="btn btn-success btn-icon-split"><span
							class="icon text-white-50"> <i class="fas fa-check"></i></span> <span
							class="text">돌아가기</span> </a>
						<%-- <% if(loginUser != null && 
							loginUser.getUserId().equals("admin"))  { %> --%>
						<a href="#" class="btn btn-info btn-icon-split" onclick="ok();"> <span
							class="icon text-white-50"> <i class="fas fa-info-circle"></i>
						</span> <span class="text">승인하기</span></a> <a href="#"
							class="btn btn-danger btn-icon-split" data-toggle="modal" 
							data-target="#cancelModal"> <span
							class="icon text-white-50"> <i class="fas fa-trash"></i>
						</span> <span class="text">거절하기</span>
						</a>
						<%-- <% } %> --%>
					</div>
				</div>
				<div class="modal fade" id="cancelModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">요청 거절 처리</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="row">
					<div class="col-md-12 col-lg-12">
						<div class="modal-body">
							<p>물품명과 승인상태를 확인하고 처리하세요</p>
							<div class="panel-body">
								<table width="100%"
									class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th style="text-align: center;" class="text-black-50 small">등록요청번호</th>
											<th style="text-align: center;" class="text-black-50 small">물품명</th>
											<th style="text-align: center;" class="text-black-50 small">등록자</th>
											<th style="text-align: center; width: 130px" class="text-black-50 small">거절사유</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX">
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
							<h5>*거절상세사유</h5>	
								<textarea rows="10" cols="55" placeholder="EX)거짓 정보 등록"></textarea>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-default" data-dismiss="modal">거절처리</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
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


	<script>
		function ok() {
			alert("정말 승인하시겠습니까?");
			location = "<%= request.getContextPath()%>/views/admin/request/reqProduct.jsp";
		}
	</script>
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

