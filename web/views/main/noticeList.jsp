<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스-공지사항</title>
<style>
	.header {
		width:100%;
		background:white;
	}
	.main {
		padding:20px 10px 20px 10px;
		margin:0;
		width:100%;
		height:auto;
	}
	.footer {
		padding:0;
	}
	.noticeTable tr:last-child {
		border-bottom:2px solid red;
	}
	.noticeTable>tbody tr:hover {
		cursor:pointer;
	}
	
</style>
</head>
<body>
	<div class="leftArea col col-lg-1 col-md-1">
	</div>
	<div class="pageWrapper col col-lg-10 col-md-10">
		<!-- 헤더 -->
		<div class="header">
			<%@ include file="../common/header.jsp"%>
		</div>


		<!-- 메인바디 -->
		<div class="main">

			
			<div class="row noticeArea">
				<br><br>
				<h1 class="ui center aligned icon header">
					<i class="clipboard list icon"></i>
					공지사항
				</h1>
				<br><br>
				<div class="col col-lg-1 col-md-1"></div>
				<div class="col col-lg-10 col-md-10 col-sm-12 col-xs-12">
					<table class="table table-hover noticeTable">
						<thead>
							<tr style="border-top:2px solid red; background:whitesmoke">
								<th width="15%">번호</th>
								<th width="45%">제목</th>
								<th width="20%">작성자</th>
								<th width="20%">작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>(필독)이용약관</td>
								<td>관리자</td>
								<td>2019-05-11</td>
							</tr>
							<tr>
								<td>2</td>
								<td>(필독)이용약관</td>
								<td>관리자</td>
								<td>2019-05-11</td>
							</tr>
							<tr>
								<td>3</td>
								<td>(필독)이용약관</td>
								<td>관리자</td>
								<td>2019-05-11</td>
							</tr>
							<tr>
								<td>4</td>
								<td>(필독)이용약관</td>
								<td>관리자</td>
								<td>2019-05-11</td>
							</tr>
							<tr>
								<td>5</td>
								<td>(필독)이용약관</td>
								<td>관리자</td>
								<td>2019-05-11</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div> <!-- end of noticeArea -->
			<br><br><br><br>
			
			


		</div> <!-- end of 메인바디 -->

		<!-- 푸터 -->
		<div class="footer">
			<%@ include file="../common/footer.jsp"%>
		</div>

	</div>
	<div class="rightArea col col-lg-1 col-md-1">
	</div>
	
	
	<script>
		$(".noticeTable").children("tbody").children("tr").click(function() {
			location.href="<%= request.getContextPath() %>/views/main/noticeDetail.jsp";
		});
		
	</script>
</body>
</html>








