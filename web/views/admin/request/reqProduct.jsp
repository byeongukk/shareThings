<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.st.request.model.vo.ReqProduct, 
	com.kh.st.common.*"%>
<% 
	ArrayList<ReqProduct> list =
		(ArrayList<ReqProduct>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = (int) request.getAttribute("listCount");

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
.even:hover {
	cursor: pointer;
}

#dataTable_wrapper {
	overflow: hidden;
}
.paging {
	margin-left: auto;
	margin-right: auto;
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
					<h1 class="h3 mb-2 text-gray-800">등록요청 관리</h1>
					<img src="<%=request.getContextPath()%>/resource/img/adminHr.png"
						width="100%">
					<div class="row" class="col-lg-12">
						<div class="col-sm-12 col-lg-12">
							<div class="card shadow mb-4" id="filter" align="center" >
								<div class="card-header py-3">조회 필터</div>
								<div class="card-body">
									<table class="col-lg-12" id="filterArea">
										<tr style="height: 20px">
											<!-- <td style="width: 70px">회원ID :</td>
											<td style="width: 70px">회원명 :</td>
											<td><input type="text" name="userName"
												style="width: 80%"></td> -->
											<td style="width: 90px">승인상태 :</td>
											<td><select style="heigth: 30px; width: 40%;">
													<option>승인</option>
													<option>승인대기</option>
													<option>거절</option>
											</select></td>
											<td style="width: 90px">상세조건 :</td>
											<td><select style="heigth: 30px; width: 20%;">
													<option>요청번호</option>
													<option>등록자명</option>
													<option>물품명</option>
											</select>&nbsp;&nbsp;&nbsp; <input type="text" name="userId"
												style="width: 20%"></td>
										</tr>
										<tr>
											<td style="width: 70px">등록기간 :</td>
											<td colspan="3"><input type="date" name="startD">&nbsp;&nbsp;&nbsp;
												~ &nbsp;&nbsp;&nbsp; <input type="date" name="endD">
											</td>
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
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary"><%= listCount %>건</h6>
								</div>
								<div class="card-body">
									<a href="#" class="btn btn-info btn-icon-split" onclick="ok();" >
										<span class="icon text-white-50"> <i
											class="fas fa-info-circle"></i>
									</span> <span class="text">요청 승인</span>
									
									</a> <a href="#" class="btn btn-danger btn-icon-split" id="no"
										data-toggle="modal" data-target="#cancelModal""> <span
										class="icon text-white-50"> <i class="fas fa-trash"></i>
									</span> <span class="text">요청 거절</span>
									</a>
									<div class="table-responsive">
										<div id="dataTable_wrapper"
											class="dataTables_wrapper dt-bootstrap4">
											<div class="row">
												<div class="col-sm-12">
												<br>
													<table class="table table-bordered dataTable"
														id="dataTable" width="100%" cellspacing="0" role="grid"
														aria-describedby="dataTable_info" style="width: 100%;">
														<thead>
															<tr role="row">
																<th tabindex="0" class="sorting"
																	aria-controls="dataTable" style="width: 10px;"
																	aria-label="Name: activate to sort column ascending"
																	rowspan="1" colspan="1"><input type="checkBox" id="checkAll"></th>
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Name: activate to sort column descending"
																	aria-sort="ascending" style="width: 30px;">요청번호</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Position: activate to sort column ascending"
																	style="width: 30px;">등록자</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Office: activate to sort column ascending"
																	style="width: 30px;">물품명</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Age: activate to sort column ascending"
																	style="width: 30px;">요청날짜</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Start date: activate to sort column ascending"
																	style="width: 30px;">글제목</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 10px;">승인상태</th>
															</tr>
														</thead>

														<tbody>
														<% for(ReqProduct rp : list) { %>
															<tr role="row" class="even">
																<td class="sorting_1"><input type="checkbox" class="check"></td>
																<td><%= rp.getUpNo() %></td>
																<td><%= rp.getbWriter() %></td>
																<td><%= rp.getProductName() %></td>
																<td><%= rp.getReqDate() %></td>
																<td><%= rp.getbTitle() %></td>
																<td><%= rp.getStatus() %></td>
															</tr>
															<% } %>
														</tbody>
													</table>
												</div>
											</div>
											<div class="row">
		<div class="paging">
			<div class="col-sm-12 col-md-3">
				<div class="dataTables_paginate paging_simple_numbers"
					id="dataTable_paginate">
					<ul class="pagination">
						<li class="paginate_button page-item"
							id="dataTable_first"><a
							href="<%=request.getContextPath()%>/reqProduct.bo?currentPage=1"
							aria-controls="dataTable" data-dt-idx="0" tabindex="0"
							class="page-link">First</a></li>

						<%
								if (currentPage <= 1) {
						%>
						<li class="paginate_button page-item disabled"
							id="dataTable_previous"><a
							href="<%=request.getContextPath()%>/reqProduct.bo?currentPage=<%=currentPage - 1%>"
							aria-controls="dataTable" data-dt-idx="0" tabindex="0"
							class="page-link">Previous</a></li>
						<%
								} else {
						%>
						<li class="paginate_button page-item"
							id="dataTable_previous"><a
							href="<%=request.getContextPath()%>/reqProduct.bo?currentPage=<%=currentPage - 1%>"
							aria-controls="dataTable" data-dt-idx="0" tabindex="0"
							class="page-link">Previous</a></li>
						<%
								}
						%>
						<%
								for (int p = startPage; p <= endPage; p++) {
								    if (p == currentPage) {
						%>
						<li class="paginate_button page-item disabled"><a href="<%=request.getContextPath()%>/reqProduct.bo?currentPage=<%=p%>"
							aria-controls="dataTable" data-dt-idx="1" tabindex="0"
							class="page-link"><%=p%></a></li>
						<%
								} else {
						%>
						<li class="paginate_button page-item active"><a href="<%=request.getContextPath()%>/reqProduct.bo?currentPage=<%=p%>"
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
						<li class="paginate_button page-item disabled" id="dataTable_next"><a
							href="<%=request.getContextPath()%>/reqProduct.bo?currentPage=<%=currentPage + 1%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
							class="page-link">Next</a></li>
						<%
								} else {
						%>
						<li class="paginate_button page-item next" id="dataTable_next"><a
							href="<%=request.getContextPath()%>/reqProduct.bo?currentPage=<%=currentPage + 1%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
							class="page-link">Next</a></li>
						<%      }     %>
						<li class="paginate_button page-item next" id="dataTable_end"><a
							href="<%=request.getContextPath()%>/reqProduct.bo?currentPage=<%=maxPage%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
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
						<div class="modal fade" id="cancelModal" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
							<form action="<%= request.getContextPath() %>/reqNo.bo" method="get">
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
																<th style="text-align: center;"
																	class="text-black-50 small">등록요청번호</th>
																<th style="text-align: center;"
																	class="text-black-50 small">물품명</th>
																<th style="text-align: center;"
																	class="text-black-50 small">등록자</th>
															</tr>
														</thead>
														<tbody>
															<tr class="odd gradeX">
																<td><input type="checkBox">
																<td></td>
																<td></td>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
												<h5>*거절상세사유</h5>
												<textarea id="textResult" name="textResult" class="col-lg-12" placeholder="EX)거짓 정보 등록"></textarea>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-default"
													data-dismiss="modal" id="result">거절처리</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div>
							</form>
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
		$(function () {
			$("#checkAll").click(function() {
				var check = $(this).is(":checked");
				var result = $(".even").find("td").eq(6).text();
				if(check) {
					$(".check").prop("checked", true);
				} else {
					$(".check").prop("checked", false);
				}
			});
		});
		
		function ok() {
			var result = confirm("정말 승인하시겠습니까?");
			if(result) {
				var status = new Array();
				$(".even").each(function() {
					if($(this).find(".check").is(":checked")) {	
						console.log($(this).find("td").eq(1).text());
						status.push($(this).find("td").eq(1).text());
					}
						
				});
				console.log(status);
				location = "<%= request.getContextPath() %>/reqOk.bo?status=" + status;
			} else {
				location = location;
			}
		}
		
		$("#no").click(function () {
			var status = new Array();
			$(".even").each(function() {
				if($(this).find(".check").is(":checked")) {	
					//console.log($(this).find("td").eq(1).text());
					status.push($(this).find("td").eq(1).text());
				}
					
			});
			$.ajax({
				url:"reqNoSelect.bo?status=" + status,
				type:"get",
				success:function(data) {
					console.log(data);
					
					var $dataTables = $("#dataTables-example tbody");
					var $textarea = $("<textarea id='textResult' name='textResult' class='col-lg-12' placeholder='EX)거짓 정보 등록'></textarea>");
					
					//기존 테이블 행 제거
					$("#dataTables-example > tbody > tr").remove();
					$textarea.remove();
					
					for(var key in data) {
						var $tr = $("<tr class='odd gradeX'>");
						var $upNoTd = $("<td>").text(data[key].upNo);
						var $bWriterTd = $("<td>").text(data[key].bWriter);
						var $productNameTd = $("<td>").text(data[key].productName);
						
						$tr.append($upNoTd);
						$tr.append($bWriterTd);
						$tr.append($productNameTd);
						
						$dataTables.append($tr);
					}
					$("#modal-body").append($textarea);
				},
				error:function(data) {
					console.log("실패");
				}
			});
		});
		
		$("#result").click(function() {
			var nums = new Array();
			$(".gradeX").each(function() {
				console.log($(this).find("td").eq(0).text());
				nums.push($(this).find("td").eq(0).text());
			});
			alert($("#textResult").val());
			var textResult = $("#textResult").val();
			location = "<%= request.getContextPath() %>/reqNo.bo?nums=" + nums + "&textResult=" + textResult;
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

