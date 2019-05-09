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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

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
#dataTable_wrapper {
	overflow: hidden;
}

.even:hover {
	cursor: pointer;
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
					<h1 class="h3 mb-2 text-gray-800">물품조회</h1>
					<div class="row">
						<div class="col-lg-4 col-sm-12 col-md-6">
							<div class="okStatus" id="okStatusForm">
								<label>대분류 <select name="okStatus"
									aria-controls="dataTable"
									class="custom-select custom-select-sm form-control form-control-sm">
										<option value="ok">전자기기</option>
										<option value="wait">유아동</option>
										<option value="no">취미레져</option>
										<option value="no">리빙</option>
										<option value="no">반려동물</option>
								</select>
								</label>
							</div>
						</div>
						<div class="col-lg-4 col-sm-12 col-md-6">
							<div class="detail" id="detailForm">
								<label>중분류 <select name="detail"
									aria-controls="dataTable"
									class="custom-select custom-select-sm form-control form-control-sm">
										<option value="reqNumber">디지털</option>
										<option value="name">가전</option>
										<option value="product">컴퓨터</option>
								</select>
								</label>
							</div>
						</div>
						<div class="col-lg-4 col-sm-12 col-md-6">
							<div class="detail" id="detailForm">
								<label>세분류 <select name="detail"
									aria-controls="dataTable"
									class="custom-select custom-select-sm form-control form-control-sm">
										<option value="reqNumber">노트북</option>
										<option value="name">데스크탑</option>
								</select>
								</label>
							</div>
						</div>
						<div class="col-lg-2 col-sm-12 col-md-6">
							<div class="dateForm" id="dateForm">
								<label>등록 기간</label> <input
									class="custom-date custom-date-lg form-control form-control-lg"
									type="date" id="fristDate">
							</div>
						</div>
						<div class="col-lg-2 col-sm-12 col-md-6">
							<div class="dateForm" id="dateForm">
								<label>&nbsp;</label><input
									class="custom-date custom-date-lg form-control form-control-lg"
									type="date" id="fristDate">
							</div>
						</div>
						<div class="col-lg-2 col-sm-12 col-md-6">
							<div class="dateForm" id="dateForm">
								<label>등록자명</label> <input
									class="custom-text custom-text-lg form-control form-control-lg"
									type="text" id="fristDate">
							</div>
						</div>
						<div class="col-lg-2 col-sm-12 col-md-6">
							<div class="dateForm" id="dateForm">
								<label>물품명</label> <input
									class="custom-text custom-text-lg form-control form-control-lg"
									type="text" id="fristDate">
							</div>
						</div>
					</div>
					<br>
					<br> <a href="#" class="btn btn-success btn-icon-split"><span
						class="icon text-white-50"> <i class="fas fa-check"></i></span> <span
						class="text">검색</span> </a><br>
					<br>
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<div id="dataTable_wrapper"
									class="dataTables_wrapper dt-bootstrap4">
									<div class="row">
										<div class="col-sm-12">
											<table class="table table-bordered dataTable" id="dataTable"
												width="100%" cellspacing="0" role="grid"
												aria-describedby="dataTable_info" style="width: 100%;">
												<thead>
													<tr role="row">

														<th class="sorting_asc" tabindex="0"
															aria-controls="dataTable" rowspan="1" colspan="1"
															aria-label="Name: activate to sort column descending"
															aria-sort="ascending" style="width: 30px;">등록번호</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Position: activate to sort column ascending"
															style="width: 30px;">등록자</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Office: activate to sort column ascending"
															style="width: 30px;">물품명</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Age: activate to sort column ascending"
															style="width: 30px;">등록기간</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Start date: activate to sort column ascending"
															style="width: 30px;">상태</th>
													</tr>
												</thead>

												<tbody>
													<tr role="row" class="even">
														<td class="sorting_1">20190508</td>
														<td>user01</td>
														<td>노트북</td>
														<td>2019/05/10 ~ 2019/07/10</td>
														<td>렌탈중</td>
													</tr>
													<tr role="row" class="even">
														<td class="sorting_1">20190508</td>
														<td>user01</td>
														<td>노트북</td>
														<td>2019/05/10 ~ 2019/07/10</td>
														<td>렌탈중</td>
													</tr>
													<tr role="row" class="even">
														<td class="sorting_1">20190508</td>
														<td>user01</td>
														<td>노트북</td>
														<td>2019/05/10 ~ 2019/07/10</td>
														<td>렌탈중</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="row">

										<div class="col-sm-12 col-md-3">
											<div class="dataTables_paginate paging_simple_numbers"
												id="dataTable_paginate">
												<ul class="pagination">
													<li class="paginate_button page-item previous disabled"
														id="dataTable_previous"><a href="#"
														aria-controls="dataTable" data-dt-idx="0" tabindex="0"
														class="page-link">Previous</a></li>
													<li class="paginate_button page-item active"><a
														href="#" aria-controls="dataTable" data-dt-idx="1"
														tabindex="0" class="page-link">1</a></li>
													<li class="paginate_button page-item "><a href="#"
														aria-controls="dataTable" data-dt-idx="2" tabindex="0"
														class="page-link">2</a></li>
													<li class="paginate_button page-item "><a href="#"
														aria-controls="dataTable" data-dt-idx="3" tabindex="0"
														class="page-link">3</a></li>
													<li class="paginate_button page-item "><a href="#"
														aria-controls="dataTable" data-dt-idx="4" tabindex="0"
														class="page-link">4</a></li>
													<li class="paginate_button page-item "><a href="#"
														aria-controls="dataTable" data-dt-idx="5" tabindex="0"
														class="page-link">5</a></li>
													<li class="paginate_button page-item "><a href="#"
														aria-controls="dataTable" data-dt-idx="6" tabindex="0"
														class="page-link">6</a></li>
													<li class="paginate_button page-item next"
														id="dataTable_next"><a href="#"
														aria-controls="dataTable" data-dt-idx="7" tabindex="0"
														class="page-link">Next</a></li>
												</ul>
											</div>
										</div>
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
		$(function() {
			$(".even").click(function() {
				location = "<%=request.getContextPath()%>/views/admin/reqProductDetail.jsp";
			});
		});
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

