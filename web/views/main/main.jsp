<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스</title>
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
		margin:0;
		width:100%;
	}
	.row1 {
		min-height:300px;
	}
	#top5 {
		height:300px;
		padding:15px; 
	}
	#notice5 {
		padding:0 0 15px 35px;
	}
	
	#notice5>table th {
		border-bottom:2px solid gray;
	}
	#notice5>table td {
		vertical-align:middle;
	}
	.row2 {
		min-height:300px;	
	}
	.categoryTop5 {
		width:19%;
		padding:0;	
	}
	.tab-content {
		/* height:200px; */
		padding:15px 0;
		border:2px solid #0CB6F4;
		border-bottom-right-radius:5px;
		border-bottom-left-radius:5px;
	}
	.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
		color: white !important;
    	cursor: default;
   		background-color: #0CB6F4 !important;
    	border: 2px solid #0CB6F4 !important;
    	border-bottom-color: transparent;
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

			<!-- top5, 공지사항 행 -->
			<div class="row row1">
				<!-- top5 상품 캐러셀 -->
				<div id="top5"
					class="carousel slide col col-lg-6 col-md-6 col-sm-6 col-xs-12"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#top5" data-slide-to="0" class="active"></li>
						<li data-target="#top5" data-slide-to="1"></li>
						<li data-target="#top5" data-slide-to="2"></li>
						<li data-target="#top5" data-slide-to="3"></li>
						<li data-target="#top5" data-slide-to="4"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" style="height: 100%">

						<div class="item active" style="height: 100%" align="center">
							<img src="/st/images/airfrier.jpg" alt=""
								style="height: 100%; width: auto">
							<div class="carousel-caption">
								<h3>에어프라이어</h3>
								<p>LA is always so much fun!</p>
							</div>
						</div>

						<div class="item" style="height: 100%" align="center">
							<img src="/st/images/laptop.jpg" alt=""
								style="height: 100%; width: auto;">
							<div class="carousel-caption">
								<h3>노트북</h3>
								<p>Thank you, Chicago!</p>
							</div>
						</div>

						<div class="item" style="height: 100%" align="center">
							<img src="/st/images/camping.jpg" alt=""
								style="height: 100%; width: auto;">
							<div class="carousel-caption">
								<h3>캠핑용품</h3>
								<p>We love the Big Apple!</p>
							</div>
						</div>
						<div class="item" style="height: 100%" align="center">
							<img src="/st/images/laptop.jpg" alt=""
								style="width: auto; height: 300px;">
							<div class="carousel-caption">
								<h3>노트북</h3>
								<p>Thank you, Chicago!</p>
							</div>
						</div>

						<div class="item" style="height: 100%" align="center">
							<img src="/st/images/camping.jpg" alt=""
								style="width: auto; height: 300px;">
							<div class="carousel-caption">
								<h3>캠핑용품</h3>
								<p>We love the Big Apple!</p>
							</div>
						</div>

					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#top5" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#top5" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>

				</div>
				<!-- end of top5 상품 캐러셀 -->

				<!-- 공지사항 -->
				<div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12" id="notice5">
					<table class="table table-hover"
						style="width: 100%;">
						<caption style="font-size:1.5em">공지사항
							<button class="ui button" onclick="goToNotice();"
							style="float:right">전체보기</button>
						</caption>
						<tr>
							<th width="10%">No.</th>
							<th width="70%">Title</th>
							<th width="20%">Date</th>
						</tr>
						<tr>
							<td>1.</td>
							<td>공지사항 1</td>
							<td>2019-04-29</td>
						</tr>
						<tr>
							<td>2.</td>
							<td>공지사항 2</td>
							<td>2019-04-29</td>
						</tr>
						<tr>
							<td>3.</td>
							<td>공지사항 3</td>
							<td>2019-04-29</td>
						</tr>
						<tr>
							<td>4.</td>
							<td>공지사항 4</td>
							<td>2019-04-29</td>
						</tr>
						<tr>
							<td>5.</td>
							<td>공지사항 5</td>
							<td>2019-04-29</td>
						</tr>
					</table>
				</div><!-- end of 공지사항 -->

			</div> <!-- end of row1 -->
			<br><br>
			<!-- 카테고리별 toP5 -->
			<div class="row row2">
				<h3>카테고리별 TOP5</h3>
							
				<div class="">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#electronic">전자기기</a></li>
						<li><a data-toggle="tab" href="#hobby">취미레저</a></li>
						<li><a data-toggle="tab" href="#fashion">패션뷰티</a></li>
						<li><a data-toggle="tab" href="#baby">유아동</a></li>
						<li><a data-toggle="tab" href="#pet">반려동물</a></li>
					</ul>
					<div class="tab-content">
						<div id="electronic" class="tab-pane fade in active" align="center">
							<img src="/st/images/laptop.jpg" class="categoryTop5">
							<img src="/st/images/laptop.jpg" class="categoryTop5">
							<img src="/st/images/laptop.jpg" class="categoryTop5">
							<img src="/st/images/laptop.jpg" class="categoryTop5">
							<img src="/st/images/laptop.jpg" class="categoryTop5">
						</div>
						<div id="hobby" class="tab-pane fade" align="center">
							<img src="/st/images/camping.jpg" class="categoryTop5">
							<img src="/st/images/camping.jpg" class="categoryTop5">
							<img src="/st/images/camping.jpg" class="categoryTop5">
							<img src="/st/images/camping.jpg" class="categoryTop5">
							<img src="/st/images/camping.jpg" class="categoryTop5">
						</div>
						<div id="fashion" class="tab-pane fade" align="center">
							<img src="/st/images/man.jpg" class="categoryTop5">
							<img src="/st/images/man.jpg" class="categoryTop5">
							<img src="/st/images/man.jpg" class="categoryTop5">
							<img src="/st/images/man.jpg" class="categoryTop5">
							<img src="/st/images/man.jpg" class="categoryTop5">
						</div>
						<div id="baby" class="tab-pane fade" align="center">
							<img src="/st/images/croller.jpg" class="categoryTop5">
							<img src="/st/images/croller.jpg" class="categoryTop5">
							<img src="/st/images/croller.jpg" class="categoryTop5">
							<img src="/st/images/croller.jpg" class="categoryTop5">
							<img src="/st/images/croller.jpg" class="categoryTop5">
						</div>
						<div id="pet" class="tab-pane fade" align="center">
							<img src="/st/images/cat.jpg" class="categoryTop5">
							<img src="/st/images/cat.jpg" class="categoryTop5">
							<img src="/st/images/cat.jpg" class="categoryTop5">
							<img src="/st/images/cat.jpg" class="categoryTop5">
							<img src="/st/images/cat.jpg" class="categoryTop5">
						</div>
						
					</div>
				</div>
				
				
			</div> <!-- end of row2 -->
			


		</div> <!-- end of 메인바디 -->

		<!-- 푸터 -->
		<div class="footer">
			<%@ include file="../common/footer.jsp"%>
		</div>

	</div>
	<div class="rightArea col col-lg-1 col-md-1">
	</div>
	
	
	<script>
		/* $(document).ready(function(){
	   		$('.menu .item').tab();
	   		$('.ui .item').on('click', function() {
	   		   $('.ui .item').removeClass('active');
	   		   $(this).addClass('active');

	   		});
		}); */
		function goToNotice() {
			location.href="/st/views/main/noticeList.jsp";
		}
	</script>
</body>
</html>








