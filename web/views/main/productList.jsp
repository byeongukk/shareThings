<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스-물품리스트</title>
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
	.filterArea {
		/* min-height:300px; */
	}
	.thumbnailArea {
		height:100%;
	}
	.thumbnail {
		margin:5px;
		height:300px;
	}
	.thumbnailImg {
		width:100%;
		height:80%;
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

			
			<div class="row filterArea">
				
				<div class="col" id="">
					
				</div>
				<div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12" id="notice5">
					
				</div>

			</div> <!-- end of filterArea -->
			<br><br>
			
			<div class="row thumbnailArea">
				<div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">
					<div class="thumbnail">
						<div class="ui fluid image thumbnailImg" style="background-image:url('/st/images/airfrier.jpg');
						background-size:cover; background-position:center; height:80%; border:1px solid lightgray">
							<a class="ui left corner label">
	        					<i class="heart red icon"></i>
	      					</a>
	      					<a class="ui circular red label" style="position:absolute; top:75%; left:70%;
	      					width:50px; height:50px">
	      						<i class="cart plus icon" style="font-size:30px; position:absolute; top:40%; left:10%"></i>
	      					</a>
							<!-- <img src="/st/images/airfrier.jpg" height="100%" style="max-width:100%"> -->
						</div>
						<div class="thumbnailCaption">
							<p>자취생 필수품 에어프라이어!</p>
						</div>
					</div>
				</div>
				<div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">
					<div class="thumbnail">
						<div class="ui fluid image thumbnailImg" style="background-image:url('/st/images/airfrier.jpg');
						background-size:cover; background-position:center; height:80%; border:1px solid lightgray">
							<a class="ui left corner label">
	        					<i class="heart red icon"></i>
	      					</a>
	      					<a class="ui circular red label" style="position:absolute; top:75%; left:70%;
	      					width:50px; height:50px">
	      						<i class="cart plus icon" style="font-size:30px; position:absolute; top:40%; left:10%"></i>
	      					</a>
							<!-- <img src="/st/images/airfrier.jpg" height="100%" style="max-width:100%"> -->
						</div>
						<div class="thumbnailCaption">
							<p>자취생 필수품 에어프라이어!</p>
						</div>
					</div>
				</div>
				<div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">
					<div class="thumbnail">
						<div class="ui fluid image thumbnailImg" style="background-image:url('/st/images/airfrier.jpg');
						background-size:cover; background-position:center; height:80%; border:1px solid lightgray">
							<a class="ui left corner label">
	        					<i class="heart red icon"></i>
	      					</a>
	      					<a class="ui circular red label" style="position:absolute; top:75%; left:70%;
	      					width:50px; height:50px">
	      						<i class="cart plus icon" style="font-size:30px; position:absolute; top:40%; left:10%"></i>
	      					</a>
							<!-- <img src="/st/images/airfrier.jpg" height="100%" style="max-width:100%"> -->
						</div>
						<div class="thumbnailCaption">
							<p>자취생 필수품 에어프라이어!</p>
						</div>
					</div>
				</div>
				<div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">
					<div class="thumbnail">
						<div class="ui fluid image thumbnailImg" style="background-image:url('/st/images/airfrier.jpg');
						background-size:cover; background-position:center; height:80%; border:1px solid lightgray">
							<a class="ui left corner label">
	        					<i class="heart red icon"></i>
	      					</a>
	      					<a class="ui circular red label" style="position:absolute; top:75%; left:70%;
	      					width:50px; height:50px">
	      						<i class="cart plus icon" style="font-size:30px; position:absolute; top:40%; left:10%"></i>
	      					</a>
							<!-- <img src="/st/images/airfrier.jpg" height="100%" style="max-width:100%"> -->
						</div>
						<div class="thumbnailCaption">
							<p>자취생 필수품 에어프라이어!</p>
						</div>
					</div>
				</div>
				<div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">
					<div class="thumbnail">
						<div class="ui fluid image thumbnailImg" style="background-image:url('/st/images/airfrier.jpg');
						background-size:cover; background-position:center; height:80%; border:1px solid lightgray">
							<a class="ui left corner label">
	        					<i class="heart red icon"></i>
	      					</a>
	      					<a class="ui circular red label" style="position:absolute; top:75%; left:70%;
	      					width:50px; height:50px">
	      						<i class="cart plus icon" style="font-size:30px; position:absolute; top:40%; left:10%"></i>
	      					</a>
							<!-- <img src="/st/images/airfrier.jpg" height="100%" style="max-width:100%"> -->
						</div>
						<div class="thumbnailCaption">
							<p>자취생 필수품 에어프라이어!</p>
						</div>
					</div>
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
		$(".thumbnail").click(function() {
			location.href="/st/views/main/productDetail.jsp";
		});
		
	</script>
</body>
</html>








