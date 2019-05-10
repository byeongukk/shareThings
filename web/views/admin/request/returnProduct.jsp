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
	cursor: pointer;
}

#dataTable_wrapper {
	overflow: hidden;
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
					<h1 class="h3 mb-2 text-gray-800">등록관리</h1>
					<p class="mb-4">반품 현황 관리</p>
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="okStatus" id="okStatusForm">
								<label>발송상태 <select name="okStatus"
									aria-controls="dataTable"
									class="custom-select custom-select-sm form-control form-control-sm">
										<option value="ok">발송 완료</option>
										<option value="wait">발송 대기</option>

								</select>
								</label>
							</div>
						</div>
						<div class="col-sm-12 col-md-6">
							<div class="detail" id="detailForm">
								<label>상세조건 <select name="detail"
									aria-controls="dataTable"
									class="custom-select custom-select-sm form-control form-control-sm">
										<option value="reqNumber">요청번호</option>
										<option value="name">등록자명</option>
										<option value="product">물품명</option>
								</select>
								</label> &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" id="detailInput"
									placeholder="내용을 입력하세요">
							</div>
						</div>
						<div class="col-sm-12 col-md-6">
							<div class="detail" id="detailForm">
								<label><br>송장정보 입력 <select name="detail"
									aria-controls="dataTable"
									class="custom-select custom-select-sm form-control form-control-sm">
										<option value="reqNumber">CJ대한통운</option>
										<option value="name">한진택배</option>
										<option value="product">로젠</option>
								</select>
								</label> &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" id="detailInput"
									placeholder="송장번호">
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
					</div><br><br>
					<a href="#" class="btn btn-success btn-icon-split"><span
						class="icon text-white-50"> <i class="fas fa-check"></i></span> <span
						class="text">검색</span> </a> <br>
					<br>
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">00건</h6>
							<a href="#" class="btn btn-info btn-icon-split"> <span
								class="icon text-white-50"> <i class="fas fa-info-circle"></i>
							</span> <span class="text">발송 처리</span>
							</a>
						</div>
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
														<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 10px;"
																aria-label="Name: activate to sort column ascending"
																rowspan="1" colspan="1"><input type="checkBox"></th>
														<th class="sorting_asc" tabindex="0"
															aria-controls="dataTable" rowspan="1" colspan="1"
															aria-label="Name: activate to sort column descending"
															aria-sort="ascending" style="width:60px;">요청번호</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Position: activate to sort column ascending"
															style="width: 10px;">등록자</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Office: activate to sort column ascending"
															style="width: 10px;">물품명</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Age: activate to sort column ascending"
															style="width: 10px;">요청날짜</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Start date: activate to sort column ascending"
															style="width: 10px;">택배사</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 30px;">송장번호</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 50px;">발송상태</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 50px;">배송상태</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 50px;">처리상태</th>
													</tr>
												</thead>

												<tbody>
													<tr role="row" class="even">
														<td class="sorting_1"><input type="checkbox"></td>
														<td>01</td>
														<td>user01</td>
														<td>노트북</td>
														<td>2019/05/05</td>
														<td>CJ대한통운</td>
														<td>123456789</td>
														<td>발송완료</td>
														<td>배송중</td>
														<td>처리완료</td>
													</tr>
													<tr role="row" class="even">
														<td class="sorting_1"><input type="checkbox"></td>
														<td>01</td>
														<td>user01</td>
														<td>노트북</td>
														<td>2019/05/05</td>
														<td>CJ대한통운</td>
														<td>123456789</td>
														<td>발송중</td>
														<td>배송중</td>
														<td>처리완료</td>
													</tr>
													<tr role="row" class="even">
														<td class="sorting_1"><input type="checkbox"></td>
														<td>01</td>
														<td>user01</td>
														<td>노트북</td>
														<td>2019/05/05</td>
														<td>CJ대한통운</td>
														<td>123456789</td>
														<td>발송대기</td>
														<td>배송대기</td>
														<td>처리대기</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<%@ include file="../common/paging.jsp"%>
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

