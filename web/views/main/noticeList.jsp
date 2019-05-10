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
				<h1 class="ui center aligned icon header">공지사항
					<i class=""></i>
				</h1>
				<table class="ui red table">
					<thead>
						<tr>
							<th>Food</th>
							<th>Calories</th>
							<th>Protein</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Apples</td>
							<td>200</td>
							<td>0g</td>
						</tr>
						<tr>
							<td>Orange</td>
							<td>310</td>
							<td>0g</td>
						</tr>
					</tbody>
				</table>

			</div> <!-- end of filterArea -->
			<br><br>
			
			<div class="row thumbnailArea">
				<div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">
					
					
					
					
					
				</div>
				

			</div>
			


		</div> <!-- end of 메인바디 -->

		<!-- 푸터 -->
		<div class="footer">
			<%@ include file="../common/footer.jsp"%>
		</div>

	</div>
	<div class="rightArea col col-lg-1 col-md-1">
	</div>
	
	
	<script>
		
		
	</script>
</body>
</html>








