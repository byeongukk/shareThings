<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.st.member.model.vo.*, com.kh.st.common.*"%>
<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
	/* PageInfo pi = (PageInfo) request.getAttribute("pi");

	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); */
%> 
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

#filter {
	margin-top: 50px;
}

#filterArea td {
	padding: 5px;
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
					<img src="<%=request.getContextPath()%>/resource/img/adminHr.png"
						width="100%">
					<div class="row" id="filter" align="center">
						<div class="col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3">조회 필터</div>
								<div class="card-body">
									<table class="col-lg-12" id="filterArea">
										<tr style="height: 20px">
											<td style="width: 70px">회원ID :</td>
											<td><input type="text" name="userId" style="width: 80%"></td>
											<td style="width: 70px">회원명 :</td>
											<td><input type="text" name="userName"
												style="width: 80%"></td>
											<td style="width: 90px">회원등급 :</td>
											<td><select style="heigth: 30px; width: 80%;">
													<option>전체</option>
													<option>브론즈</option>
													<option>실버</option>
													<option>골드</option>
													<option>VIP</option>
													<option>VVIP</option>
											</select></td>
											<td style="width: 60px">상태 :</td>
											<td><select style="heigth: 30px; width: 80%;">
													<option>전체</option>
													<option>가입</option>
													<option>탈퇴</option>
											</select></td>
										</tr>
										<tr>
											<td style="width: 70px">수익금 :</td>
											<td colspan="3"><input type="number" name="startM"
												style="width: 40%">&nbsp;&nbsp;&nbsp; ~
												&nbsp;&nbsp;&nbsp; <input type="number" name="endM"
												style="width: 40%"></td>
											<td style="width: 70px">적립금 :</td>
											<td colspan="3"><input type="number" name="startM"
												style="width: 40%">&nbsp;&nbsp;&nbsp; ~
												&nbsp;&nbsp;&nbsp; <input type="number" name="endM"
												style="width: 40%"></td>
										</tr>
										<tr>
											<td style="width: 70px">가입일 :</td>
											<td colspan="3"><input type="date" name="startD"
												style="width: 40%">&nbsp;&nbsp;&nbsp; ~
												&nbsp;&nbsp;&nbsp; <input type="date" name="endD"
												style="width: 40%"></td>
										</tr>
									</table>
									<div>
										<button>조회하기</button>
										&nbsp;&nbsp;&nbsp;
										<button>초기화</button>
									</div>
								</div>
							</div>
							<div class="card shadow mb-4">
								<div class="card-body">
									<div class="table-responsive">
										<div id="dataTable_wrapper"
											class="dataTables_wrapper dt-bootstrap4">
											<div class="row">
												<div class="col-sm-12">
													<div>
														<p align="left">
															표기된 회원 수 :
															<%=list.size()%>명
														</p>
													</div>
													<table class="table table-bordered dataTable"
														id="dataTable" width="100%" cellspacing="0" role="grid"
														aria-describedby="dataTable_info" style="width: 100%;">
														<thead>
															<tr role="row">
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Name: activate to sort column descending"
																	aria-sort="ascending" style="width: 30px;">회원No</th>
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Name: activate to sort column descending"
																	aria-sort="ascending" style="width: 30px;">회원ID</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Position: activate to sort column ascending"
																	style="width: 30px;">회원명</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Office: activate to sort column ascending"
																	style="width: 30px;">전화번호</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Age: activate to sort column ascending"
																	style="width: 30px;">주소</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Start date: activate to sort column ascending"
																	style="width: 30px;">보유 수익금</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 10px;">보유 적립금</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 10px;">보유 벌점</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 10px;">가입일</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 10px;">상태</th>
															</tr>
														</thead>

														<tbody>
															<%
																for (Member m : list) {
															%>
															<tr>
																<td><%=m.getUno()%></td>
																<td><%=m.getUserId()%></td>
																<td><%=m.getUserName()%></td>
																<td><%=m.getPhone()%></td>
																<td><%=m.getAddress()%></td>
																<td><%=m.getProfits()%></td>
																<td><%=m.getPoint()%></td>
																<td><%=m.getPenalty()%></td>
																<td><%=m.getEnrollDate()%></td>
																<td><%=m.getStatus()%></td>
															</tr>
															<%
																}
															%>
														</tbody>
													</table>
												</div>
											</div>
											<%@ include file = "../common/paging.jsp" %>
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

