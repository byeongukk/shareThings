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
	
	.even:hover {
		cursor:pointer;
	}
	#filter {
		margin-left:auto;
		margin-right:auto;
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
					<h1 class="h3 mb-2 text-gray-800">회원정보관리</h1>
					<img src="<%=request.getContextPath()%>/resource/img/adminHr.png" width="100%">
					<div class="row" id="filter" align="center" style="width:80%">
						<div class="col-sm-12 col-md-6 col-lg-4">
							<div class="okStatus" id="okStatusForm">
								<label>회원ID : </label>
								<input type="text" name="userId">
							</div>
						</div>
						<div class="col-sm-12 col-md-6 col-lg-4">
							<div class="detail" id="detailForm">
								<label>회원명 : </label>
								<input type="text" name="userName">
							</div>
						</div>
						<div class="col-sm-12 col-md-6 col-lg-2">
							<div class="dateForm" id="dateForm">
								<label>회원등급 : </label>
								<select>
									<option>전체</option>
									<option>브론즈</option>
									<option>실버</option>
									<option>골드</option>
									<option>VIP</option>
									<option>VVIP</option>
								</select>
							</div>
						</div>
						<div class="col-sm-12 col-md-6 col-lg-2">
							<div class="dateForm" id="dateForm">
								<label>회원구분</label>
								<select>
									<option>전체</option>
									<option>가입</option>
									<option>탈퇴</option>
								</select>
							</div>
						</div>
					</div>
					<a href="#" class="btn btn-success btn-icon-split"><span
						class="icon text-white-50"> <i class="fas fa-check"></i></span> <span class="text">검색</span>
					</a>
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
															aria-sort="ascending" 
															style="width: 30px;">회원ID</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Position: activate to sort column ascending"
															style="width: 30px;">회원명</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Office: activate to sort column ascending"
															style="width: 30px;">전화번호</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Age: activate to sort column ascending"
															style="width: 30px;">주소</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Start date: activate to sort column ascending"
															style="width: 30px;">보유 수익금</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 10px;">보유 적립금</th>
													</tr>
												</thead>

												<tbody>
													<tr role="row" class="even">
														<td class="sorting_1"><input type="checkbox">01</td>
														<td>user01</td>
														<td>노트북</td>
														<td>2019/05/05</td>
														<td>노트북 빌려드림</td>
														<td>승인</td>
													</tr>
													<tr role="row" class="even">
														<td class="sorting_1"><input type="checkbox">01</td>
														<td>user01</td>
														<td>노트북</td>
														<td>2019/05/05</td>
														<td>노트북 빌려드림</td>
														<td>승인</td>
													</tr>
													<tr role="row" class="even">
														<td class="sorting_1"><input type="checkbox">01</td>
														<td>user01</td>
														<td>노트북</td>
														<td>2019/05/05</td>
														<td>노트북 빌려드림</td>
														<td>승인</td>
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
				location = "<%= request.getContextPath()%>/views/admin/reqProductDetail.jsp";
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

