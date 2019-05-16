<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%
	ArrayList<HashMap<String, Object>> list = 
	(ArrayList<HashMap<String, Object>>) request.getAttribute("list");
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
<!-- Bootstrap core JavaScript-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<title>Share Things</title>
<style>
/*  input number 스피너 제거  */
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

#filter {
	margin-top: 30px;
}

#filterArea td {
	padding: 20px;
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
					<h1>대여 관리</h1>
					<div class="container-fluid">
						<hr>

						<!-- Page Heading -->
						<h1 class="h3 mb-2 text-gray-800">발송 관리</h1>
						<hr>
						<div class="card-body">
							<div id="dataTable_wrapper"
								class="dataTables_wrapper dt-bootstrap4">
								<div class="row">
									<div class="col-sm-12 col-md-12" align="center">
										<div class="card shadow mb-4">
											<div class="card-header py-3">조회 필터</div>
											<div class="card-body">
												<form id="filterArea">
													<table class="col-lg-12" id="filter">
														<tr>
															<td width="10%">배송상태</td>
															<td width="15%"><select class="form-control">
																	<option value="hidden">배송상태</option>
																	<option value="0">배송중</option>
																	<option value="10">배송완료</option>
															</select></td>
															<td width="10%">상세조건</td>
															<td width="15%"><select class="form-control">
																	<option>상세조건</option>
																	<option value="0">대여주문번호</option>
																	<option value="10">대여자이름</option>
																	<option value="20">물품명</option>
																	<option value="30">물품번호</option>
															</select></td>
															<td width="15%"><input type="text"
																class="form-control" placeholder="상세정보입력"></td>

														</tr>

														<tr>
															<td>대여기간</td>
															<td width="35%">
																<input type="date"  name="startDate" style="width: 150px"> &nbsp; ~ &nbsp;
																<input type="date"  name="endDate" style="width: 150px">
															</td>
															<td></td>
															<td></td>
															<td></td>
														</tr>
													</table>
													<br>
													<div align="center">
														<button type="submit">조회하기</button>
														&nbsp;&nbsp;
														<button type="reset">초기화</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 리스트 테이블  -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h5 class="m-0 font-weight-bold text-primary" id="listSize"><%= list.size()%>건</h5>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-6 mb-1">
										<form class="form-inline">
											<div class="form-group">
												<span>송장 정보 입력 : </span>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<select class="form-control">
													<option>택배사</option>
													<option>대한통운</option>
													<option>로젠택배</option>
													<option>ㅁㄴㅇㄴㅁ</option>
												</select> &nbsp;&nbsp;&nbsp;&nbsp; <span> <input type="number"
													class="form-control" placeholder="송장번호">
												</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<button class="btn btn-success btn-icon-split btn-sm">
													<span class="icon text-white-50"> <i
														class="fas fas fa-check"></i>
													</span> <span class="text">적용하기</span>
												</button>
											</div>
										</form>
										<br>
										<form>
											<button class="btn btn-secondary btn-icon-split btn-sm">
												<span class="icon text-white-50"> <i
													class="fas fas fa-arrow-right"></i>
												</span> <span class="text">발송처리</span>
											</button>
											&nbsp;&nbsp;&nbsp;

											<button type="button"
												class="btn btn-danger btn-icon-split btn-sm" id="cancelBtn"
												data-toggle="modal" data-target="#cancelModal">
												<span class="icon text-white-50"> <i
													class="fas fas fa-trash"></i>
												</span> <span class="text">대여취소</span>
											</button>
										</form>
									</div>

								</div>
								<br>
								<div class="table-responsive">
									<div class="dataTables_wrapper dt-bootstrap4"
										id="dataTable_wrapper">

										<div class="row">
											<div class="col-sm-12">
												<table width="100%"
													class="table table-bordered dataTable table-hover"
													id="dataTable" role="grid"
													aria-describedby="dataTable_info" style="width: 100%;"
													cellspacing="0">
													<thead>
														<tr role="row" align="center">
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 10px;"
																aria-label="Name: activate to sort column ascending"
																rowspan="1" colspan="1"><input type="checkBox"></th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 68px;"
																rowspan="1" colspan="1">대여주문번호</th>
															<th tabindex="0" class="sorting_asc"
																aria-controls="dataTable" style="width: 50px;"
																aria-sort="ascending" rowspan="1" colspan="1">물품번호</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 67px;"
																rowspan="1" colspan="1">대여요청일시</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 45px;"
																rowspan="1" colspan="1">대여자 ID</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 45px;"
																rowspan="1" colspan="1">대여자 이름</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 55px;"
																rowspan="1" colspan="1">대여자 연락처</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 68px;"
																rowspan="1" colspan="1">배송지</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 67px;"
																rowspan="1" colspan="1">주문상태</th>

														</tr>
													</thead>
													<tbody>
														<% for(int i = 0; i<list.size(); i++){
															HashMap<String, Object> hmap = list.get(i);	
														
														%> 
														
														<tr class="odd" role="row" align="center">
															<td><input type="checkBox" class="check"></td>
															<td><%= hmap.get("rno") %></td>
															<td><%= hmap.get("pno")%></td>
															<td><%= hmap.get("rtReqDate")%></td>
															<td><%= hmap.get("userId")%></td>
															<td><%= hmap.get("userName")%></td>
															<td><%= hmap.get("phone")%></td>
															<td><%= hmap.get("address")%></td>
															<td><%= hmap.get("rtStatus")%></td>
														</tr>
														<% } %>
													</tbody>
												</table>
												<div id="result-null">
												<% if(list.size() <= 0){ %>
													<br><br><br><br><br><br>
													<h3 align="center"> 조회 결과가 없습니다.</h3>
													<br><br><br><br><br><br>
												<% } %>
												</div>
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
	<!-- 대여취소  Modal -->
	<div class="modal fade" id="cancelModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">대여 취소처리</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="row">
					<div class="col-md-12 col-lg-12">
						<div class="modal-body">
							<p>물품명과 주문상태를 확인하고 처리하세요</p>
							<div class="panel-body">
								<table width="100%"
									class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th style="text-align: center;" class="text-black-50 small">등록요청번호</th>
											<th style="text-align: center;" class="text-black-50 small">요청인</th>
											<th style="text-align: center;" class="text-black-50 small">물품번호</th>
											<th style="text-align: center;" class="text-black-50 small">모델명</th>
											<th style="text-align: center;" class="text-black-50 small">요청자ID</th>
											<th style="text-align: center;" class="text-black-50 small">상태</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd" role="row" align="center">
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
							<h5>*취소상세사유</h5>
							<textarea class="col-lg-12" placeholder="EX)고객요청으로 인한 취소"></textarea>

						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-default"
								data-dismiss="modal">취소처리</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script>
			
			$("#cancelBtn").click(function() {
				console.log("b");
				var status = new Array();
				$(".odd").each(function() {
					if($(this).find(".check").is(":checked")) {	
						status.push($(this).find("td").eq(1).text());
					}
				});
				$.ajax({
					url:"selectShpNum.rt?status=" + status,
					type:"get",
					success:function(data) {
						var $dataTables = $("#dataTables-example tbody");
						var $textarea = $("<textarea id='textResult' name='textResult' class='col-lg-12' placeholder='EX)거짓 정보 등록'></textarea>");
						//기존 테이블 행 제거
						$("#dataTables-example > tbody > tr").remove();
						$textarea.remove();
						
						console.log(data);
						for(var key in data) {
							console.log(data[key]);
							var $tr = $("<tr class='odd gradeX'>");
							var $rnoTd =  $("<td>").text(data[key].rnoTd);
							var $pnoTd =  $("<td>").text(data[key].pnoTd);
							var $modelTd =  $("<td>").text(data[key].modelTd);
							var $userNameTd =  $("<td>").text(data[key].userNameTd);
							var $userIdTd =  $("<td>").text(data[key].userIdTd);
							var $rtStatusTd =  $("<td>").text(data[key].rtStatusTd);
							
							$tr.append($rnoTd);
							$tr.append($pnoTd);
							$tr.append($modelTd);
							$tr.append($userNameTd);
							$tr.append($userIdTd);
							$tr.append($rtStatusTd);
							$dataTables.append($tr);
						}
					},
					error:function(data){
						console.log("에러");
					}
				
				});
				
				
				/* $.ajax({
					console.log("ajax");
					url:"selectShpNum.rt?status=" + status,
					type:"get",
					success:function(data) {
						var $dataTables = $("#dataTables-example tbody");
						var $textarea = $("<textarea id='textResult' name='textResult' class='col-lg-12' placeholder='EX)거짓 정보 등록'></textarea>");
						
						//기존 테이블 행 제거
						$("#dataTables-example > tbody > tr").remove();
						$textarea.remove();
					
					},
					error:function(data) {
						console.log("실패");
					}
				});  */
			});
		
	
	</script>
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
