<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.st.request.model.vo.ReqProduct, 
	com.kh.st.common.*"%>
<%
	ArrayList<ReqProduct> list =
		(ArrayList<ReqProduct>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listOkCount = (int) request.getAttribute("listOkCount");
	
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
.rejectImg {
	display:inline-block;
	margin:30px;
}
#fileRejectArea:hover {
	cursor:pointer;
}
#hidden {
	display:none;
}
.confirmImg {
	display:inline-block;
	margin:30px;
}
#fileConfirmArea:hover {
	cursor:pointer;
}
#textResult, #textResult1 {
	resize:none;
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
					<h1 class="h3 mb-2 text-gray-800">등록현황 관리</h1>
					<img src="<%=request.getContextPath()%>/resource/img/adminHr.png"
						width="100%">
					<div class="row" class="col-lg-12">
						<div class="col-sm-12 col-lg-12">
							<div class="card shadow mb-4"  id="filter" align="center">
								<div class="card-header py-3">조회 필터</div>
								<div class="card-body">
									<table class="col-lg-12" id="filterArea">
										<tr style="height: 20px">
											<td style="width: 90px">검수상태 :</td>
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
											</select>&nbsp;&nbsp;&nbsp;
											<input type="text" name="userId" style="width: 20%">
											</td>
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
							<h6 class="m-0 font-weight-bold text-primary"><%= listOkCount %>건</h6>
						</div>
							<div class="card-body">
							<a href="#" class="btn btn-info btn-icon-split" id="ok" data-toggle="modal" data-target="#okModal">
								<span class="icon text-white-50"> <i
									class="fas fa-info-circle"></i>
							</span> <span class="text">검수 승인</span>
							</a> <a href="#" class="btn btn-danger btn-icon-split" id="no"
								data-toggle="modal" data-target="#cancelModal"> <span
								class="icon text-white-50"> <i class="fas fa-trash"></i>
							</span> <span class="text">검수 거절</span>
							</a>
								<div class="table-responsive">
									<div id="dataTable_wrapper"
										class="dataTables_wrapper dt-bootstrap4">
										<div class="row">
											<div class="col-sm-12">
												<table class="table table-bordered dataTable" id="dataTable"
													width="100%" cellspacing="0" role="grid"
													aria-describedby="dataTable_info" style="width: 100%;">
													<br>
													<thead>
														<tr role="row" align="center">
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 10px;"
																aria-label="Name: activate to sort column ascending"
																rowspan="1" colspan="1"><input type="checkBox" id="checkAll"></th>
															<th class="sorting_asc" tabindex="0"
																aria-controls="dataTable" rowspan="1" colspan="1"
																aria-label="Name: activate to sort column descending"
																aria-sort="ascending" style="width: 30px;">글번호</th>
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
																style="width: 10px;">검수상태</th>
														</tr>
													</thead>

													<tbody>
													<% for(ReqProduct rp : list) { %>
															<tr role="row" class="even" align="center">
																<td class="sorting_1"><input type="checkbox" class="check"></td>
																<td><%= rp.getbNo() %></td>
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
												<div id="result-null">
													<% if(list.size() <= 0){ %>
														<br><br><br><br><br><br>
														<h3 align="center"> 조회 결과가 없습니다.</h3>
														<br><br><br><br><br><br>
													<% } %>
												</div>
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
							href="<%=request.getContextPath()%>/reqOkProduct.bo?currentPage=1"
							aria-controls="dataTable" data-dt-idx="0" tabindex="0"
							class="page-link">First</a></li>

						<%
								if (currentPage <= 1) {
						%>
						<li class="paginate_button page-item disabled"
							id="dataTable_previous"><a
							href="<%=request.getContextPath()%>/reqOkProduct.bo?currentPage=<%=currentPage - 1%>"
							aria-controls="dataTable" data-dt-idx="0" tabindex="0"
							class="page-link">Previous</a></li>
						<%
								} else {
						%>
						<li class="paginate_button page-item"
							id="dataTable_previous"><a
							href="<%=request.getContextPath()%>/reqOkProduct.bo?currentPage=<%=currentPage - 1%>"
							aria-controls="dataTable" data-dt-idx="0" tabindex="0"
							class="page-link">Previous</a></li>
						<%
								}
						%>
						<%
								for (int p = startPage; p <= endPage; p++) {
								    if (p == currentPage) {
						%>
						<li class="paginate_button page-item disabled"><a href="<%=request.getContextPath()%>/reqOkProduct.bo?currentPage=<%=p%>"
							aria-controls="dataTable" data-dt-idx="1" tabindex="0"
							class="page-link"><%=p%></a></li>
						<%
								} else {
						%>
						<li class="paginate_button page-item active"><a href="<%=request.getContextPath()%>/reqOkProduct.bo?currentPage=<%=p%>"
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
							href="<%=request.getContextPath()%>/reqOkProduct.bo?currentPage=<%=currentPage + 1%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
							class="page-link">Next</a></li>
						<%
								} else {
						%>
						<li class="paginate_button page-item next" id="dataTable_next"><a
							href="<%=request.getContextPath()%>/reqOkProduct.bo?currentPage=<%=currentPage + 1%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
							class="page-link">Next</a></li>
						<%      }     %>
						<li class="paginate_button page-item next" id="dataTable_end"><a
							href="<%=request.getContextPath()%>/reqOkProduct.bo?currentPage=<%=maxPage%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
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
					<!-- reqPeject.tn -->
					<form action="<%= request.getContextPath() %>/reqReject.tn" method="post"
							encType="multipart/form-data">
					<div class="modal fade" id="cancelModal" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">검수 거절 처리</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="row">
									<div class="col-md-12 col-lg-12">
										<div class="modal-body">
											<p>물품명과 검수상태를 확인하고 처리하세요</p>
											<div class="panel-body">
												<table width="100%"
													class="table table-striped table-bordered table-hover"
													id="dataTables-example">
													<thead>
														<tr>
															<th style="text-align: center;" class="text-black-50 small">등록요청번호</th>
															<th style="text-align: center;" class="text-black-50 small">물품명</th>
															<th style="text-align: center;" class="text-black-50 small">등록자</th>
														</tr>
													</thead>
													<tbody>
												
													</tbody>
												</table>
											</div>
											<hr>
											<h5>*검수사진</h5>	
												<div id="fileRejectArea" class="col-md-12 col-lg-12">
													<div class="rejectImg" id="reject1">
														<img id="rejectImg1" width="150" height="150">
													</div>
													<div class="rejectImg" id="reject2">
														<img id="rejectImg2" width="150" height="150">
													</div>
													<div class="rejectImg" id="reject3">
														<img id="rejectImg3" width="150" height="150">
													</div>
													<div class="rejectImg" id="reject4">
														<img id="rejectImg4" width="150" height="150">
													</div>
												</div>
												<div id="fileArea">
													<input type="file" id="img1" name="img1" onchange="loadImg(this, 1);">
													<input type="file" id="img2" name="img2" onchange="loadImg(this, 2);">
													<input type="file" id="img3" name="img3" onchange="loadImg(this, 3);">
													<input type="file" id="img4" name="img4" onchange="loadImg(this, 4);">
												</div>
											<hr>
											<h5>*거절상세사유</h5>
												<input type="hidden" name="checker" value="<%= loginUser.getUno() %>">
												<textarea id="textResult" required name="textResult" class="col-lg-12" placeholder="EX)거짓 정보 등록"></textarea>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-default">거절처리</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					</form>
					<form action="<%= request.getContextPath() %>/reqConfirm.tn" method="post"
							encType="multipart/form-data">
					<div class="modal fade" id="okModal" role="dialog">
						<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">검수승인 처리</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="row">
					<div class="col-md-12 col-lg-12">
						<div class="modal-body">
							<p>물품명을 확인하고 처리하세요</p>
							<div class="panel-body">
								<table width="100%"
									class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th style="text-align: center;" class="text-black-50 small">등록요청번호</th>
											<th style="text-align: center;" class="text-black-50 small">물품명</th>
											<th style="text-align: center;" class="text-black-50 small">등록자</th>
										</tr>
									</thead>
									<tbody>
										
									</tbody>
								</table>
							</div>
							<hr>
							<h5>*검수사진</h5>	
								<div id="fileConfirmArea" class="col-md-12 col-lg-12">
									<div class="confirmImg" id="confirm1">
										<img id="confirmImg1" width="150" height="150">
									</div>
									<div class="confirmImg" id="confirm2">
										<img id="confirmImg2" width="150" height="150">
									</div>
									<div class="confirmImg" id="confirm3">
										<img id="confirmImg3" width="150" height="150">
									</div>
									<div class="confirmImg" id="confirm4">
										<img id="confirmImg4" width="150" height="150">
									</div>
								</div>
								<div id="fileArea1">
									<input type="file" id="img5" name="img5" onchange="loadImg(this, 5);">
									<input type="file" id="img6" name="img6" onchange="loadImg(this, 6);">
									<input type="file" id="img7" name="img7" onchange="loadImg(this, 7);">
									<input type="file" id="img8" name="img8" onchange="loadImg(this, 8);">
								</div>
							<hr>
							<h5>*검수내용</h5>
								<input type="hidden" name="checker" value="<%= loginUser.getUno() %>">
								<textarea id="textResult1" required name="textResult1" class="col-lg-12" placeholder="검수내용"></textarea>
							<h5>*물품상태</h5>
							<select id="product" name="product">
								<option value="최상">최상급</option>
								<option value="상">상급</option>
								<option value="중">중급</option>
								<option value="하">하급</option>

							</select>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-default">승인처리</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
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
			//전체 선택, 해제
			$("#checkAll").click(function() {
				var check = $(this).is(":checked");
				var result = $(".even").find("td").eq(6).text();
				if(check) {
					$(".check").prop("checked", true);
				} else {
					$(".check").prop("checked", false);
				}
			});
			
			//체크박스 클릭해도 동작 X(해당 번호 가져옴)
			$(".sorting_1").siblings().click(function() {
				$(this).parent().each(function() {
					console.log($(this).find("td").eq(1).text());
					var reqNum = $(this).find("td").eq(1).text();
					location = "<%= request.getContextPath()%>/confirmProductDetail.bo?reqNum=" + reqNum;
				});
			});
			
			//td클릭해도 체크되게
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
			
			//검수사진(거절)
			$("#fileArea").hide();
			$("#reject1").click(function() {
				$("#img1").click();
			});
			$("#reject2").click(function() {
				$("#img2").click();
			});
			$("#reject3").click(function() {
				$("#img3").click();
			});
			$("#reject4").click(function() {
				$("#img4").click();
			});
			
			//검수사진(승인)
			$("#fileArea1").hide();
			$("#confirm1").click(function() {
				$("#img5").click();
			});
			$("#confirm2").click(function() {
				$("#img6").click();
			});
			$("#confirm3").click(function() {
				$("#img7").click();
			});
			$("#confirm4").click(function() {
				$("#img8").click();
			});
		});
		
		//검수 거절 ajax
		$("#no").click(function () {
			var status = new Array();
			$(".even").each(function() {
				if($(this).find(".check").is(":checked")) {	
					console.log($(this).find("td").eq(2).text());
					status.push($(this).find("td").eq(2).text());
					var confirm = $(this).find("td").eq(7).text();
					if(confirm == "등록 검수 불통과") {
						alert("이미 거절된 물품입니다.");
						return false;
					}
				}
			});
			if(status.length > 1) {
				alert("한개만 선택하세요");
				return false;
			}
			$.ajax({
				url:"reqRejectSelect.bo?status=" + status,
				type:"get",
				success:function(data) {
					console.log(data);

					var $dataTables = $("#dataTables-example tbody");
					//기존 테이블 행 제거
					$("#dataTables-example > tbody > tr").remove();

					var $tr = $("<tr class='odd gradeX'>");
					var $upNoTd = $("<td>").text(data.upNo);
					var $hidden = $("<textarea id='hidden' name='reqNo'>").text(data.upNo);
					var $bWriterTd = $("<td>").text(data.bWriter);
					var $productNameTd = $("<td>").text(data.productName);
						
					$tr.append($upNoTd);
					$tr.append($bWriterTd);
					$tr.append($productNameTd);
						
					$dataTables.append($tr);
					$dataTables.append($hidden);
					
					console.log($hidden);
				},
				error:function(data) {
					console.log("실패");
				}
			});
		});
		
		//검수 승인 ajax
		$("#ok").click(function() {
			var status = new Array();
			$(".even").each(function() {
				if($(this).find(".check").is(":checked")) {	
					console.log($(this).find("td").eq(2).text());
					status.push($(this).find("td").eq(2).text());
					var confirm = $(this).find("td").eq(7).text();
					if(confirm == "등록 검수 불통과") {
						alert("검수 거절 물품은 선택할 수 없습니다.");
						return false;
					}
				}
			});
			if(status.length > 1) {
				alert("한개만 선택하세요");
				return false;
			}
			console.log(status);
			$.ajax({
				url:"reqConfirmSelect.bo?status=" + status,
				type:"get",
				success:function(data) {
					console.log(data);

					var $dataTables = $("#dataTables-example tbody");
					//기존 테이블 행 제거
					$("#dataTables-example > tbody > tr").remove();

					var $tr = $("<tr class='odd gradeX'>");
					var $upNoTd = $("<td>").text(data.upNo);
					var $hidden = $("<textarea id='hidden' name='reqNo'>").text(data.upNo);
					var $bWriterTd = $("<td>").text(data.bWriter);
					var $productNameTd = $("<td>").text(data.productName);
						
					$tr.append($upNoTd);
					$tr.append($bWriterTd);
					$tr.append($productNameTd);
						
					$dataTables.append($tr);
					$dataTables.append($hidden);
					
					console.log($hidden);
				},
				error:function(data) {
					console.log("실패");
				}
			});
		});
		
		//사진 등록
		function loadImg(value, num) {
			if(value.files && value.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					switch(num) {
					case 1 :
						$("#rejectImg1").attr("src", e.target.result);
						break;
					case 2 :
						$("#rejectImg2").attr("src", e.target.result);
						break;
					case 3 :
						$("#rejectImg3").attr("src", e.target.result);
						break;
					case 4 :
						$("#rejectImg4").attr("src", e.target.result);
						break;
					case 5 :
						$("#confirmImg1").attr("src", e.target.result);
						break;
					case 6 :
						$("#confirmImg2").attr("src", e.target.result);
						break;
					case 7 :
						$("#confirmImg3").attr("src", e.target.result);
						break;
					case 8 :
						$("#confirmImg4").attr("src", e.target.result);
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
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

