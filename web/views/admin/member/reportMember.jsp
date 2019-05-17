<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.st.member.model.vo.*, com.kh.st.common.*"%>
<%
	ArrayList<Report> list = (ArrayList<Report>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");

	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
#filter {
	margin-top: 50px;
}

#filterArea td {
	padding: 5px;
}

.paging {
	margin-left: auto;
	margin-right: auto;
}

#dataTables-detail td {
	padding: 8px;
}

.MTR {
	color: black;
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
					<h1 class="h3 mb-2 text-gray-800">신고이력관리</h1>
					<img src="<%=request.getContextPath()%>/resource/img/adminHr.png"
						width="100%">
					<div class="row" id="filter" align="center">
						<div class="col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3">조회 필터</div>
								<div class="card-body">
									<table class="col-lg-12" id="filterArea">
										<tr>
											<td width="6%">회원ID :</td>
											<td width="19%"><input type="text" name="memberId"
												style="width: 80%"></td>
											<td width="6%">분류 :</td>
											<td width="19%"><select
												style="heigth: 30px; width: 80%;">
													<option value="A">전체</option>
													<option value="10">파손</option>
													<option value="20">분실</option>
													<option value="30">욕설</option>
													<option value="40">광고</option>
													<option value="40">기타</option>
											</select></td>
											<td width="8%">처리결과 :</td>
											<td width="17%"><select
												style="heigth: 30px; width: 80%;">
													<option value="A">전체</option>
													<option value="N">부적합</option>
													<option value="Y">적합</option>
											</select></td>
											<td width="5%">상태 :</td>
											<td width="20%"><select
												style="heigth: 30px; width: 80%;">
													<option value="A">전체</option>
													<option value="N">처리대기</option>
													<option value="Y">처리완료</option>
											</select></td>
										</tr>
										<tr>
											<td width="8%">누적벌점 :</td>
											<td><input type="number" name="startP"
												style="width: 25%"> &nbsp;&nbsp;&nbsp; ~
												&nbsp;&nbsp;&nbsp; <input type="number" name="endP"
												style="width: 25%"></td>
											<td width="6%">신고일 :</td>
											<td colspan="3"><input type="date" name="startD"
												style="width: 40%"> &nbsp;&nbsp;&nbsp; ~
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
													<div align="left">
														<a href="#" class="btn btn-success btn-circle btn-sm"
															onclick="ok()"> <i class="fas fa-check"></i></a>
														&nbsp;&nbsp; <a href="#"
															class="btn btn-danger btn-circle btn-sm" id="no"
															data-toggle="modal" data-target="#noModal"><i
															class="fas fa-trash"></i> </a>
													</div>
													<br>
													<table class="table table-bordered dataTable"
														id="dataTable" width="100%" cellspacing="0" role="grid"
														aria-describedby="dataTable_info" style="width: 100%;"
														style="height:100px;">
														<thead>
															<tr role="row" align="center">
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-sort="ascending"
																	aria-label="Name: activate to sort column descending"
																	style="width: 1%;"><input type="checkbox"
																	id="checkAll"></th>
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-sort="ascending"
																	aria-label="Name: activate to sort column descending"
																	style="width: 2%;">No.</th>
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-sort="ascending"
																	aria-label="Name: activate to sort column descending"
																	style="width: 10%;">회원ID</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Office: activate to sort column ascending"
																	style="width: 8%;">신고분류</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Age: activate to sort column ascending"
																	style="width: 25%;">사유</th>
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-sort="ascending"
																	aria-label="Name: activate to sort column descending"
																	style="width: 10%;">신고인ID</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Start date: activate to sort column ascending"
																	style="width: 10%;">신고일</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 8%;">상태</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Start date: activate to sort column ascending"
																	style="width: 10%;">처리일</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 8%;">처리결과</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 10%;">벌점</th>
															</tr>
														</thead>
														<tbody>
															<%
																for (Report r : list) {
															%>
															<tr role="row" class="even" align="center">
																<td class="sorting_1"><input type="checkbox"
																	class="check"></td>
																<td data-toggle="modal" data-target="#detail"><%=r.getReportNo()%></td>
																<td data-toggle="modal" data-target="#detail"><%=r.getTargetUser()%></td>
																<td data-toggle="modal" data-target="#detail"><%=r.getReportName()%></td>
																<td data-toggle="modal" data-target="#detail"><%=r.getReportContent()%></td>
																<td data-toggle="modal" data-target="#detail"><%=r.getReportUser()%></td>
																<td data-toggle="modal" data-target="#detail"><%=r.getReportDate()%></td>
																<td data-toggle="modal" data-target="#detail"><%=r.getStatus()%></td>
																<td data-toggle="modal" data-target="#detail"><%=r.getComplateDate()%></td>
																<td data-toggle="modal" data-target="#detail"><%=r.getReportResult()%></td>
																<td data-toggle="modal" data-target="#detail"><%=r.getPenalty()%></td>
															</tr>
															<%
																}
															%>
														</tbody>
													</table>
												</div>
											</div>
											<div class="row">
												<div class="paging">
													<div class="col-lg-12">
														<div class="dataTables_paginate paging_simple_numbers"
															id="dataTable_paginate">
															<ul class="pagination">
																<li class="paginate_button page-item"
																	id="dataTable_first"><a
																	href="<%=request.getContextPath()%>/selectReport.me?currentPage=1"
																	aria-controls="dataTable" data-dt-idx="0" tabindex="0"
																	class="page-link">First</a></li>

																<%
																	if (currentPage <= 1) {
																%>
																<li class="paginate_button page-item disabled"
																	id="dataTable_previous"><a
																	href="<%=request.getContextPath()%>/selectReport.me?currentPage=<%=currentPage - 1%>"
																	aria-controls="dataTable" data-dt-idx="0" tabindex="0"
																	class="page-link">Previous</a></li>
																<%
																	} else {
																%>
																<li class="paginate_button page-item"
																	id="dataTable_previous"><a
																	href="<%=request.getContextPath()%>/selectReport.me?currentPage=<%=currentPage - 1%>"
																	aria-controls="dataTable" data-dt-idx="0" tabindex="0"
																	class="page-link">Previous</a></li>
																<%
																	}
																%>
																<%
																	for (int p = startPage; p <= endPage; p++) {
																		if (p == currentPage) {
																%>
																<li class="paginate_button page-item disabled"><a
																	href="<%=request.getContextPath()%>/selectReport.me?currentPage=<%=p%>"
																	aria-controls="dataTable" data-dt-idx="1" tabindex="0"
																	class="page-link"><%=p%></a></li>
																<%
																	} else {
																%>
																<li class="paginate_button page-item active"><a
																	href="<%=request.getContextPath()%>/selectReport.me?currentPage=<%=p%>"
																	aria-controls="dataTable" data-dt-idx="1" tabindex="0"
																	class="page-link"><%=p%></a></li>
																<%
																	}
																%>


																<%
																	}
																%>

																<%
																	if (currentPage >= maxPage) {
																%>
																<li class="paginate_button page-item disabled"
																	id="dataTable_next"><a
																	href="<%=request.getContextPath()%>/selectReport.me?currentPage=<%=currentPage + 1%>"
																	aria-controls="dataTable" data-dt-idx="7" tabindex="0"
																	class="page-link">Next</a></li>
																<%
																	} else {
																%>
																<li class="paginate_button page-item next"
																	id="dataTable_next"><a
																	href="<%=request.getContextPath()%>/selectReport.me?currentPage=<%=currentPage + 1%>"
																	aria-controls="dataTable" data-dt-idx="7" tabindex="0"
																	class="page-link">Next</a></li>
																<%
																	}
																%>
																<li class="paginate_button page-item next"
																	id="dataTable_end"><a
																	href="<%=request.getContextPath()%>/selectReport.me?currentPage=<%=maxPage%>"
																	aria-controls="dataTable" data-dt-idx="7" tabindex="0"
																	class="page-link">End</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="modal fade" id="detail" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title MTR">신고내역 상세보기</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<div class="row">
										<div class="col-md-12 col-lg-12">
											<div class="modal-body">
												<div class="panel-body">
													<table width="100%" id="dataTables-detail">
														<tbody>
															<tr>
																<td width="20%" class="MTR">신고번호</td>
																<td id="noTd" width="13%"></td>
																<td width="15%" class="MTR">구분</td>
																<td id="ftTd" width="13%"></td>
																<td width="20%" class="MTR">처리상태</td>
																<td id="stTd" width="18%"></td>
															</tr>
															<tr>
																<td class="MTR">신고일</td>
																<td id="rdTd" colspan="2"></td>
																<td class="MTR hide hideOk" style="display: none">처리일</td>
																<td class="hide hideOk" id="cdTd" colspan="2"
																	style="display: none"></td>

															</tr>
															<tr>
																<td class="MTR">Target</td>
																<td id="tiTd" colspan="2"></td>
																<td class="MTR">Report</td>
																<td id="riTd" colspan="2"></td>
															</tr>
															<tr>
																<td colspan="6" class="MTR">- 신고 사유</td>
															</tr>
															<tr>
																<td colspan="6"><textarea id="ctTa"
																		class="col-lg-12" rows="3" readonly></textarea></td>
															</tr>
															<tr class="hide" style="display: none">
																<td colspan="6" class="MTR">- 부적합 사유</td>
															</tr>
															<tr class="hide" style="display: none">
																<td colspan="6"><textarea id="rejectTd"
																		class="col-lg-12" rows="3" readonly></textarea></td>
															</tr>
														</tbody>
													</table>
												</div>
												<br> <br>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>

						<div class="modal fade" id="noModal" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title MTR">부적합 처리</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<div class="row">
										<div class="col-md-12 col-lg-12">
											<div class="modal-body">
												<div class="panel-body">
													<table width="100%" id="dataTables-no">
														<thead>
															<tr class="MTR">
																<th>선택된 신고No.</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td id="numsTd"></td>
															</tr>
															<tr>
																<td class="MTR"><b>부적합 사유</b></td>
															</tr>
															<tr>
																<td><textarea id="inputReject" class="col-lg-12"
																		rows="3"></textarea></td>
															</tr>
														</tbody>
													</table>
												</div>
												<br> <br>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-default"
													id="completeNo" data-dismiss="modal">완료</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>




						<script>
						$(function () {
					         $("#checkAll").click(function() {
					            var check = $(this).is(":checked");
					            if(check) {
					               $(".check").prop("checked", true);
					            } else {
					               $(".check").prop("checked", false);
					            }
					         });
					         
					         $(".sorting_1").click(function() {
					             $(this).parent().each(function() {
					                var check = $(this).find(".check").is(":checked");
					                if(!check) {
					                   $(this).find(".check").prop("checked", true);
					                } else {
					                   $(this).find(".check").prop("checked", false);
					                }
					             });
					          });
					         
					         $(".even").mouseenter(function(){
						    		$(this).css({"background":"lightblue", "color":"black" ,"cursor":"pointer"})
						    	}).mouseout(function(){
						    		$(this).css({"background":"white", "color":"gray"})
						    	});
					         
					         $(".sorting_1").siblings().click(function(){
							    		var no = $(this).parent().children().eq(1).text();
										console.log(no);
										$.ajax({
											url:"selectOneReport.me?no=" + no,
											type:"post",
											success:function(data){
												$(".hide").hide();
												for(var key in data){
													if(data[key].status == "처리대기"){
														$("#noTd").text("No." + data[key].reportNo);
														$("#ftTd").text(data[key].reportName);
														$("#stTd").text(data[key].status);
														$("#rdTd").text(data[key].reportDate);
														$("#tiTd").text(data[key].targetId + "(" + data[key].targetName + ")");
														$("#riTd").text(data[key].repId + "(" + data[key].repName + ")");
														$("#ctTa").val(data[key].reportContent);
													}else{
														if(data[key].reportResult == "적합"){
															$(".hideOk").show();
															$("#noTd").text("No." + data[key].reportNo);
															$("#ftTd").text(data[key].reportName);
															$("#stTd").text(data[key].status);
															$("#rdTd").text(data[key].reportDate);
															$("#cdTd").text(data[key].completeDate);
															$("#tiTd").text(data[key].targetId + "(" + data[key].targetName + ")");
															$("#riTd").text(data[key].repId + "(" + data[key].repName + ")");
															$("#ctTa").val(data[key].reportContent);
														}else{
															$(".hide").show();
															$("#noTd").text("No." + data[key].reportNo);
															$("#ftTd").text(data[key].reportName);
															$("#stTd").text(data[key].status);
															$("#rdTd").text(data[key].reportDate);
															$("#cdTd").text(data[key].completeDate);
															$("#tiTd").text(data[key].targetId + "(" + data[key].targetName + ")");
															$("#riTd").text(data[key].repId + "(" + data[key].repName + ")");
															$("#ctTa").val(data[key].reportContent);
															$("#rejectTd").val(data[key].reject);
														}
													}
												}
												
											}
										
										});
							   		 });
					         
					        	 $("#no").click(function(){
							    	$("#numsTd").text("");
							    	var result = "";
							    	$(".even").each(function(){
							    		if($(this).find(".check").is(":checked")){
							    			result += $(this).find("td").eq(1).text() + " ";
							    		}	
							    	});
							    	$("#numsTd").text(result);
							    });
								
							    $("#completeNo").click(function(){
							    	var nums = $("#numsTd").text();
							    	console.log(nums);
							    	var inputReject = $("#inputReject").val();
							    	console.log(inputReject);
							    	location = "<%=request.getContextPath()%>/reportNo.me?nums=" + nums + "&inputReject=" + inputReject;
							    });
					      });
						
						function ok() {
					         var result = confirm("정말 승인하시겠습니까?");
					         if(result) {
					            var no = new Array();
					            $(".even").each(function() {
					               if($(this).find(".check").is(":checked")) {   
					                  console.log($(this).find("td").eq(1).text());
					                  no.push($(this).find("td").eq(1).text());
					               }
					                  
					            });
					            console.log(no);
					            location = "<%=request.getContextPath()%>/reportOk.me?no="+ no;
								} else {
									location = location;
								}
							};
						</script>
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

