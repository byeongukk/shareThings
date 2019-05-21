<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.st.member.model.vo.*, com.kh.st.common.*"%>
<%
	ArrayList<Refund> list = (ArrayList<Refund>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
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

#filter {
	margin-top: 50px;
}

#filterArea td {
	padding: 5px;
}
.paging {
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
					<h1 class="h3 mb-2 text-gray-800">회원환불</h1>
					<img src="<%=request.getContextPath()%>/resource/img/adminHr.png"
						width="100%">
					<div class="row" id="filter" align="center">
						<div class="col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3">조회 필터</div>
								<div class="card-body">
									<table class="col-lg-12" id="filterArea">
										<tr>
											<td width="5%">회원ID :</td>
											<td><input type="text" id="userIdF"
												style="width: 50%"></td>
											<td width="5%">구분 :</td>
											<td><select style="width: 50%" id="typeF">
													<option value="0">전체</option>
													<option value="A">예약취소</option>
													<option value="P">중간환불</option>
											</select></td>
											<td width="5%">판정 :</td>
											<td><select style="width: 50%" id="typeF">
													<option value="0">전체</option>
													<option value="Y">적합</option>
													<option value="N">부적합</option>
											</select></td>
											<td width="5%">상태 :</td>
											<td><select style="width: 50%" id="statusF">
													<option value="0">전체</option>
													<option value="N">처리대기</option>
													<option value="Y">처리완료</option>
											</select></td>
										</tr>
										<tr>
											<td width="6%">신청일 :</td>
											<td colspan="3"><input type="date" id="startReqDF"
												style="width: 40%"> &nbsp;&nbsp;&nbsp; ~
												&nbsp;&nbsp;&nbsp; <input type="date" id="endReqDF"
												style="width: 40%"></td>
											<td width="6%">처리일 :</td>
											<td colspan="3"><input type="date" id="startPbDF"
												style="width: 40%"> &nbsp;&nbsp;&nbsp; ~
												&nbsp;&nbsp;&nbsp; <input type="date" id="endPbDF"
												style="width: 40%"></td>
										</tr>
									</table>
									<div>
										<button type="button" onclick="filteringP(1)">조회하기</button>
										&nbsp;&nbsp;&nbsp;
										<button type="reset">초기화</button>
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
														<a href="#" class="btn btn-success btn-circle btn-sm" onclick="ok()">
										                    <i class="fas fa-check"></i></a> &nbsp;
														<a href="#" class="btn btn-info btn-circle btn-sm">
										                    <i class="fas fa-flag"></i> </a>
													</div>
													<br>
													<table class="table table-bordered dataTable"
														id="dataTable" width="100%" cellspacing="0" role="grid"
														aria-describedby="dataTable_info" style="width: 100%;"
														style="height:100px;">
														<thead align="center">
															<tr role="row">
																<th width="1%"><input type="checkbox" id="checkAll"></th>
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-sort="ascending"
																	aria-label="Name: activate to sort column descending"
																	style="width: 3%;">No.</th>
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-sort="ascending"
																	aria-label="Name: activate to sort column descending"
																	style="width: 5%;">회원ID</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Office: activate to sort column ascending"
																	style="width: 7%;">결제번호</th>
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-sort="ascending"
																	aria-label="Name: activate to sort column descending"
																	style="width: 20%;">환불사유</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 10%;">금액</th>
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-sort="ascending"
																	aria-label="Name: activate to sort column descending"
																	style="width: 5%;">구분</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Office: activate to sort column ascending"
																	style="width: 10%;">신청일</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 7%;">판정</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Age: activate to sort column ascending"
																	style="width: 10%;">환불일</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 7%;">상태</th>
															</tr>
														</thead>
														<tbody>
															<% for(Refund r : list){ %>
																<tr align="center" class="even">
																	<td class="sorting_1"><input type="checkbox" class="check"></td>
																	<td class="sorting_2" data-toggle="modal" data-target="#detail"><%= r.getRfNo() %></td>
																	<td class="sorting_2" data-toggle="modal" data-target="#detail"><%= r.getUserId() %></td>
																	<td class="sorting_2" data-toggle="modal" data-target="#detail"><%= r.getVerifyCode() %></td>
																	<td class="sorting_2" data-toggle="modal" data-target="#detail"><%= r.getRfReason() %></td>
																	<td class="sorting_2" data-toggle="modal" data-target="#detail"><%= r.getPrice() %></td>
																	<td class="sorting_2" data-toggle="modal" data-target="#detail"><%= r.getRfType() %></td>
																	<td class="sorting_2" data-toggle="modal" data-target="#detail"><%= r.getReqDate() %></td>
																	<td class="sorting_2" data-toggle="modal" data-target="#detail"><%= r.getRfResult() %></td>
																	<td class="sorting_2" data-toggle="modal" data-target="#detail"><%= r.getRfDate() %></td>
																	<td class="sorting_2" data-toggle="modal" data-target="#detail"><%= r.getRfStatus() %></td>
																</tr>
															<% } %>
														</tbody>
													</table>
												</div>
											</div>
											<div class="row">
												<div class="paging">
													<div class="col-lg-12">
														<div class="dataTables_paginate paging_simple_numbers"
															id="dataTable_paginate">
															<ul class="pagination" id="pagingUl">
																<li class="paginate_button page-item"
																	id="dataTable_first"><a
																	href="<%=request.getContextPath()%>/selectRefundList.me?currentPage=1"
																	aria-controls="dataTable" data-dt-idx="0" tabindex="0"
																	class="page-link">First</a></li>
										
																<%
																		if (currentPage <= 1) {
																%>
																<li class="paginate_button page-item disabled"
																	id="dataTable_previous"><a
																	href="<%=request.getContextPath()%>/selectRefundList.me?currentPage=<%=currentPage - 1%>"
																	aria-controls="dataTable" data-dt-idx="0" tabindex="0"
																	class="page-link">Previous</a></li>
																<%
																		} else {
																%>
																<li class="paginate_button page-item"
																	id="dataTable_previous"><a
																	href="<%=request.getContextPath()%>/selectRefundList.me?currentPage=<%=currentPage - 1%>"
																	aria-controls="dataTable" data-dt-idx="0" tabindex="0"
																	class="page-link">Previous</a></li>
																<%
																		}
																%>
																<%
																		for (int p = startPage; p <= endPage; p++) {
																		    if (p == currentPage) {
																%>
																<li class="paginate_button page-item disabled"><a href="<%=request.getContextPath()%>/selectRefundList.me?currentPage=<%=p%>"
																	aria-controls="dataTable" data-dt-idx="1" tabindex="0"
																	class="page-link"><%=p%></a></li>
																<%
																		} else {
																%>
																<li class="paginate_button page-item active"><a href="<%=request.getContextPath()%>/selectRefundList.me?currentPage=<%=p%>"
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
																	href="<%=request.getContextPath()%>/selectRefundList.me?currentPage=<%=currentPage + 1%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
																	class="page-link">Next</a></li>
																<%
																		} else {
																%>
																<li class="paginate_button page-item next" id="dataTable_next"><a
																	href="<%=request.getContextPath()%>/selectRefundList.me?currentPage=<%=currentPage + 1%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
																	class="page-link">Next</a></li>
																<%      }     %>
																<li class="paginate_button page-item next" id="dataTable_end"><a
																	href="<%=request.getContextPath()%>/selectRefundList.me?currentPage=<%=maxPage%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
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
										<h4 class="modal-title MTR">환불내역 상세보기</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<div class="row">
										<div class="col-md-12 col-lg-12">
											<div class="modal-body">
												<div class="panel-body">
													<table width="100%" id="dataTables-detail">
														<tbody>
															<tr>
																<td width="20%" class="MTR">환불No.</td>
																<td id="noTd" width="13%"></td>
																<td width="15%" class="MTR">구분</td>
																<td id="ftTd" width="13%"></td>
																<td width="20%" class="MTR">처리상태</td>
																<td id="stTd" width="18%"></td>
															</tr>
															<tr>
																<td class="MTR">신청일</td>
																<td id="rdTd" colspan="2"></td>
																<td class="MTR hide hideOk" style="display: none">처리일</td>
																<td class="hide hideOk" id="cdTd" colspan="2"
																	style="display: none"></td>

															</tr>
															<tr>
																<td class="MTR">신청인</td>
																<td id="tiTd" colspan="2"></td>
																<td class="MTR">결제No.</td>
																<td id="riTd" colspan="2"></td>
															</tr>
															<tr>
																<td colspan="6" class="MTR">- 환불 사유</td>
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
		        });
				
				
				function ok() {
			         var result = confirm("처리완료 하시겠습니까?");
			         if(result) {
			            var no = new Array();
			            $(".even").each(function() {
			               if($(this).find(".check").is(":checked")) {   
			                  console.log($(this).find("td").eq(1).text());
			                  no.push($(this).find("td").eq(1).text());
			               }
			                  
			            });
			            console.log(no);
			            location = "<%=request.getContextPath()%>/refundOk.me?no="+ no;
						} else {
							location = location;
						}
					};
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

