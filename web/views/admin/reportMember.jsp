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
#pageName {
	margin-left: 30px;
}
#MemberFilter {
	color: black;
}
#MemberFilter label {
	padding-left: 3%;
	padding-right: 3%;
}
.card-body {
	width:100%;
}
#dataTable_wrapper {
	height:600px;
	text-align:center;
}
#filterArea {
	text-align:center;
}
#dataTables_wrapper{
	width:100%;
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
				
				<div id="pageName">
					<h2 style="color: black">
						<b>신고이력관리</b>
					</h2>
				</div>
				<img src="/st/resource/img/adminHr.png" width="100%">
				
				<div class="card-body">
					<div class="table-responsive">
						<div id="dataTable_wrapper"
							class="dataTables_wrapper dt-bootstrap4">
							<div class="row">
								<div class="col-sm-12 col-md-12" id="MemberFilter">
									<form id="filterArea">
										<table border="1" class="col-lg-12" id="filter">
											<tr>
												<th style="background:lightgray" height="15px;" colspan="12"></th>
											</tr>
											<tr>
												<td width="5%">회원ID</td>
												<td width="10%">
													<input type="text" name="memberId">
												</td>
												<td width="5%">회원명</td>
												<td width="10%">
													<input type="text" name="memberName">
												</td>
												<td width="5%">분류</td>
												<td width="5%">
													<select>
														<option value="A">전체</option>
														<option value="10">파손</option>
														<option value="20">분실</option>
														<option value="30">욕설</option>
														<option value="40">광고</option>
														<option value="40">기타</option>
													</select>
												</td>
												<td width="5%">벌점</td>
												<td width="20%">
												<input type="number" name="startPoint" style="width:100px"> 
												 ~ <input type="number" name="endPoint" style="width:100px">
												</td>
												<td width="5%">신고일</td>
												<td width="25%">
												<input type="date" name="startDate" style="width:140px"> 
												 ~ <input type="date" name="endDate" style="width:140px">
												</td>
												<td width="5%">상태</td>
												<td width="5%">
													<select>
														<option value="A">전체</option>
														<option value="Y">적합</option>
														<option value="N">부적합</option>
													</select>
												</td>
											</tr>
										</table>
										<br>
										<div align="center">
											<button type="submit">조회하기</button> &nbsp;&nbsp;
											<button type="reset">초기화</button>
										</div>	
									</form>
								</div>
							</div>
							<br>
							<br>
							<div class="row">
								<div class="col-sm-12">
									<table class="table table-bordered dataTable" id="dataTable"
										width="100%" cellspacing="0" role="grid"
										aria-describedby="dataTable_info" style="width: 100%;" style="height:100px;">
										<thead>
											<tr role="row">
												<th class="sorting_asc" tabindex="0"
													aria-controls="dataTable" rowspan="1" colspan="1"
													aria-sort="ascending"
													aria-label="Name: activate to sort column descending"
													style="width: 10%;">회원ID</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="Position: activate to sort column ascending"
													style="width: 10%;">회원명</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="Office: activate to sort column ascending"
													style="width: 8%;">신고분류</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="Age: activate to sort column ascending"
													style="width: 32%;">사유</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="Start date: activate to sort column ascending"
													style="width: 10%;">신고일</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 10%;">벌점</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 10%;">상태</th>
											</tr>
										</thead>
										<tbody>
											
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12 col-md-5">
									
								</div>
								<div class="col-sm-12 col-md-7">
	
								</div>
							</div>
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

