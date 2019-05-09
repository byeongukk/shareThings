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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
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
html {
	heigth: 100%
}

#content-wrapper {
	min-height: 90%;
}

#pageName {
	margin-left: 30px;
}

#MemberFilter {
	background: lightgray;
	color: black;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

#MemberFilter label {
	padding-left: 3%;
	padding-right: 3%;
}

.card-body {
	width: 100%;
}

#dataTable_wrapper {
	height: 200px;
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
					<h1>대여 관리</h1>
					<div class="container-fluid">

						<!-- Page Heading -->
						<h1 class="h3 mb-2 text-gray-800">대여 조회</h1>
						<hr>
						<div class="card-body">
							<div id="dataTable_wrapper"
								class="dataTables_wrapper dt-bootstrap4">
								<div class="row">
									<div class="col-sm-12 col-md-12" id="MemberFilter">
										<label><b>회원ID:</b> 
											<input type="search" class="form-control form-control-sm" placeholder="ID필터" aria-controls="dataTable">
										</label> 
										<label><b>회원명:</b>
											<input type="search" class="form-control form-control-sm" placeholder="이름필터" aria-controls="dataTable">
										</label> 
										<label><b>회원등급:</b>
											<select class="form-control form-control-sm">
												<option>전체</option>
												<option value="10">브론즈</option>
												<option value="20">실버</option>
												<option value="30">골드</option>
												<option value="40">다이아</option>
											</select> 
										</label> 
										<label><b>회원상태:</b> 
											<select class="form-control form-control-sm">
													<option>전체</option>
													<option value="Y">가입</option>
													<option value="N">탈퇴</option>
											</select> 
										</label>
									</div>
								</div>
							</div>
						</div>

						<!-- 리스트 테이블  -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">00 건</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<div class="dataTables_wrapper dt-bootstrap4"
										id="dataTable_wrapper">


										<div class="row">
											<div class="col-sm-12">
												<table width="100%" class="table table-bordered dataTable"
													id="dataTable" role="grid"
													aria-describedby="dataTable_info" style="width: 100%;"
													cellspacing="0">
													<thead>
														<tr role="row" align="center">
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 57px;"
																aria-label="Name: activate to sort column ascending"
																rowspan="1" colspan="1"><input type="checkBox"></th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 57px;"
																rowspan="1" colspan="1">대여주문번호</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 61px;"
																rowspan="1" colspan="1">대여자</th>
															<th tabindex="0" class="sorting_asc"
																aria-controls="dataTable" style="width: 50px;"
																aria-sort="ascending" rowspan="1" colspan="1">물품번호</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 31px;"
																rowspan="1" colspan="1">물품명</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 68px;"
																rowspan="1" colspan="1">요청일자</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 67px;"
																rowspan="1" colspan="1">대여상태</th>
														</tr>
													</thead>
													<tbody>
														<tr class="odd" role="row" align="center">
															<td><input type="checkBox"></td>
															<td>011</td>
															<td>최병욱</td>
															<td>노트북입니다</td>
															<td>mm01</td>
															<td>2011/04/25</td>
															<td>렌탈중</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<!-- 페이징 -->
										<div class="row">
											<div class="col-sm-12 col-md-7" ailgn="center">
												<div class="dataTables_paginate paging_simple_numbers"
													id="dataTable_paginate">
													<ul class="pagination">
														<li class="paginate_button page-item previous disabled"
															id="dataTable_previous"><a tabindex="0"
															class="page-link" aria-controls="dataTable" href="#"
															data-dt-idx="0">Previous</a></li>
														<li class="paginate_button page-item active"><a
															tabindex="0" class="page-link" aria-controls="dataTable"
															href="#" data-dt-idx="1">1</a></li>
														<li class="paginate_button page-item "><a
															tabindex="0" class="page-link" aria-controls="dataTable"
															href="#" data-dt-idx="2">2</a></li>
														<li class="paginate_button page-item next"
															id="dataTable_next"><a tabindex="0"
															class="page-link" aria-controls="dataTable" href="#"
															data-dt-idx="7">Next</a></li>
													</ul>
												</div>
											</div>
										</div>
										<!-- 페이징 끝부분 -->
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


	<script
		src="<%= request.getContextPath() %>/resource/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<%= request.getContextPath() %>/resource/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="<%= request.getContextPath() %>/resource/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="<%= request.getContextPath() %>/resource/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="<%= request.getContextPath() %>/resource/js/demo/chart-area-demo.js"></script>
	<script
		src="<%= request.getContextPath() %>/resource/js/demo/chart-pie-demo.js"></script>
</body>

</html>

