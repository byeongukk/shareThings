<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스-물품상세</title>
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
	.productTitleArea {
		min-height:300px;
	}
	img {
	  vertical-align: middle;
	  max-width:100%;
	}
	.productImg {
	  position: relative;
	  align:center;
	  border:1px solid lightgray;
	  padding:5px;
	}
	.imgSlides {
	  display:none;
	  width:100%;
	  height:400px;
	  align:center;
	}
	.cursor {
	  cursor: pointer;
	}
	.prev, .next {
	  cursor: pointer;
	  position: absolute;
	  top: 40%;
	  width: auto;
	  padding: 16px;
	  margin-top: -50px;
	  color: orange;
	  font-weight: bold;
	  font-size: 20px;
	  border-radius: 0 3px 3px 0;
	  user-select: none;
	  -webkit-user-select: none;
	}
	.prev {
		left:0;
	}
	.next {
	  right: 0;
	  border-radius: 3px 0 0 3px;
	}
	.prev:hover, .next:hover {
	  background-color: rgba(0, 0, 0, 0.8);
	  color:white;
	}
	.imgListArea {
		background-color: rgba(0, 0, 0, 0.8);
		padding:10px 5px 10px 5px;
	}
	.imgList {
		padding:5px;
	}
	.row:after {
	  content: "";
	  display:table;
	  clear: both;
	}
 	.subImages {
	  opacity: 0.8;
	}
	.active, .subImages:hover {
	  opacity: 1;
	}
	.titleArea {
		padding:0 0 0 30px !important;
	}
	.titleBlock, .sellerBlock {
		 border:1px solid lightgray;
		 padding:10px;
	}
	.datePicker {
		width:50%;
	}
	.productInfo tr {
		height:50px;
	}
	.productInfo td {
		padding:5px;
	}
	#addCartBtn, #lendBtn {
		/* height:50px; */
		font-size:1.3em;
	}
	.productDetailArea, .QnAInputArea, .QnAListArea, .reviewInputArea, .reviewListArea {
		width:80%;
		padding:15px;
		margin:0 !important;
	}
	#QnAList tr, #reviewList tr {
		height:40px;
		border-top: 1px solid lightgray;
	}
	#QnAList tr:nth-of-type(2n), #reviewList tr:nth-of-type(2n) {
		height:80px;
	}
	#QnAList tr:last-child, #reviewList tr:last-child {
		border-bottom:2px solid #0CB6F4;
	}
	#QnAList >tbody tr:nth-of-type(2n-1):hover, #reviewList>tbody tr:nth-of-type(2n-1):hover {
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

			
			<div class="row productTitleArea">
				
				<div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12 productImg">
					
				 	<div class="imgSlides" align="center">
				    	<img src="/st/images/airfrier.jpg" height="100%" width="auto">
				  	</div>
				  	<div class="imgSlides" align="center">
				    	<img src="/st/images/laptop.jpg" height="100%" width="auto">
				  	</div>
				  	<div class="imgSlides" align="center">
				    	<img src="/st/images/camping.jpg" height="100%" width="auto">
				  	</div>
				    
				  	<a class="prev cursor" onclick="plusSlides(-1)">❮</a>
				  	<a class="next cursor" onclick="plusSlides(1)">❯</a>
				  		
				  	<div class="row imgListArea">
				    	<div class="col col-lg-2 col-md-2 col-sm-2 col-xs-2 imgList">
				      		<img class="subImages cursor" src="/st/images/airfrier.jpg" style="width:100%" onclick="currentSlide(1)" alt="에어프라이어">
				    	</div>
				    	<div class="col col-lg-2 col-md-2 col-sm-2 col-xs-2 imgList">
				    		<img class="subImages cursor" src="/st/images/laptop.jpg" style="width:100%" onclick="currentSlide(2)" alt="노트북">
				    	</div>
				    	<div class="col col-lg-2 col-md-2 col-sm-2 col-xs-2 imgList">
				      		<img class="subImages cursor" src="/st/images/camping.jpg" style="width:100%" onclick="currentSlide(3)" alt="캠핑용품">
				    	</div>
				    	<div class="col col-lg-2 col-md-2 col-sm-2 col-xs-2 imgList">
				      		<img class="subImages cursor" src="/st/images/airfrier.jpg" style="width:100%" onclick="currentSlide(1)" alt="에어프라이어">
				    	</div>
				    	<div class="col col-lg-2 col-md-2 col-sm-2 col-xs-2 imgList">
				      		<img class="subImages cursor" src="/st/images/laptop.jpg" style="width:100%" onclick="currentSlide(2)" alt="노트북">
				    	</div>
				    	<div class="col col-lg-2 col-md-2 col-sm-2 col-xs-2 imgList">
				      		<img class="subImages cursor" src="/st/images/camping.jpg" style="width:100%" onclick="currentSlide(3)" alt="캠핑용품">
				    	</div>
					</div>
				</div> <!-- end of productImg -->
				<div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12 titleArea">
					<div class="titleBlock">
						<form action="" method="post">
							<table class="productInfo" style="width:100%">
								<tr>
									<td colspan="4" align="right">
										<div class="ui labeled button" tabindex="0">
											<div class="ui red button">
												<i class="heart icon"></i> 찜하기
											</div>
											<a class="ui basic red left pointing label"> 1,048 </a>
										</div>
										<div class="ui labeled button" tabindex="0">
											<div class="ui basic blue button">
												<i class="chart bar icon"></i> 조회수
											</div>
											<a class="ui basic left pointing blue label"> 1,048 </a>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<h3><b>자취생의 필수품 에어프라이어</b></h3>
									</td>
								</tr>
								<tr>
									<td>
										<label style="color:#0CB6F4; font-wieght:bold; font-size:2em">1000원/일</label>
									</td>
									<td>
										<label style="color:gray; font-wieght:bold;">/ 보증금 20000원</label>
									</td>
								</tr>
								<tr>
									<td colspan="2"><label>모델명 : -----</label></td>
								</tr>
								<tr>
									<td><label>물품상태 : 최상</label></td>
									<td><label>구입시기 : 2019년 1월</label></td>
								</tr>
								<tr>
									<td width="50%">
										<div class="ui left icon fluid input datePicker" style="margin:0; width:100%">
											<input type="text" name="endDay" id="startDay" placeholder="대여 시작일">
											<i class="calendar alternate outline icon"></i>
										</div>
									</td>
									<td width="50%">
										<div class="ui left icon fluid input datePicker" style="margin:0; width:100%">
											<input type="text" name="endDay" id="endDay" placeholder="대여 종료일">
											<i class="calendar alternate outline icon"></i>
										</div>
									</td>
								</tr>
								<tr>
									<td><label>대여가격 : --</label></td>
									<td><label>(+ 배송비 : 3000원)</label></td>
								</tr>
								<tr>
									<td colspan="2" align="right">
										<label style="color:#F44A0C; font-wieght:bold; font-size:2em">총 -- 원</label>
									</td>
								</tr>
								<tr>
									<td>
										<div class="ui fluid negative button" id="addCartBtn">장바구니 추가</div>
									</td>
									<td>
										<div class="ui fluid primary button" id="lendBtn">바로 대여신청</div>
									</td>
								</tr>
							</table>
						</form>
					</div> <!-- end of TitleBlock -->
					<br><br>
					<div class="sellerBlock">
						<table class="sellerInfo" style="width:100%">
							<tr>
								<td colspan="3">
									<h4>물품 등록인 정보</h4>
								</td>
							</tr>
							<tr>
								<td>
									<div class="ui label">
										<i class="user outline icon"></i>
										<label>등록자명</label>
									</div>
								</td>
								<td><label>아이템 : 0</label></td>
								<td><label>후기 : 0</label></td>
							</tr>
						</table>
						<br><br>
					</div> <!-- end of SellerBlock -->
					
				</div><!-- end of titleArea -->

			</div> <!--  end of productTitleArea -->
			<br><br>
			
			<div class="row">
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#productDetailTab">상세정보</a></li>
					<li><a data-toggle="tab" href="#productQnATab">Q & A</a></li>
					<li><a data-toggle="tab" href="#productReviewTab">대여 후기</a></li>
				</ul>
				<br><br>
				
				<div class="tab-content">
					<!-- 상품 상세설명 탭 -->
					<div id="productDetailTab" class="tab-pane fade in active" align="center">
						<div class="productDetailArea">
							<p>물품 정보페이지</p>
							<p>사는가 무엇을 착목한는 어디 품에 튼튼하며, 그들의 품었기 말이다. 무엇이 옷을 그러므로 위하여서, 
							커다란 하였으며, 곳으로 것이다. 심장의 피어나기 청춘은 트고, 피다. 안고, 지혜는 봄날의 품에 되려니와, 
							그들에게 것이다. 가는 사랑의 낙원을 모래뿐일 무엇을 뜨고, 힘차게 무엇을 부패뿐이다. 더운지라 피가 속에 능히 가치를 
							쓸쓸하랴? 내는 가는 대한 인생의 생명을 가슴에 같으며, 이상 말이다. 그림자는 오직 과실이 위하여 우리 스며들어 
							오아이스도 우리의 사막이다. 되려니와, 천고에 청춘에서만 곳이 방황하여도, 평화스러운 그들의 그것을 풀이 약동하다. 
							황금시대를 끝에 때에, 수 보이는 봄바람이다.기쁘며, 평화스러운 역사를 소담스러운 이것이다. 봄바람을 실로 때까지 
							그들은 그리하였는가? 있는 없으면 것이 곳이 얼음과 관현악이며, 교향악이다. 것이다.보라, 꽃 아름답고 것은 붙잡아 
							구하기 청춘의 것이다. 장식하는 있는 방황하였으며, 인생을 보라. 열락의 사는가 바이며, 들어 영락과 약동하다. 
							속에 인간의 소리다.이것은 아름다우냐? 돋고, 그들은 이 노년에게서 있는 타오르고 불어 그들의 황금시대의 이것이다. 
							끓는 황금시대의 이상의 소리다.이것은 것이다. 웅대한 용기가 시들어 있음으로써 황금시대다. 돋고, 가슴에 방황하였으며, 
							찬미를 힘차게 쓸쓸하랴? 싸인 내는 봄날의 거친 붙잡아 바이며, 그들에게 것은 사는가 보라. 동산에는 청춘 커다란 길을 
							관현악이며, 아름다우냐? 주며, 거선의 불러 물방아 피어나는 눈이 있는가? 이상의 공자는 우리는 것이다. 
							꾸며 끝에 청춘의 아름다우냐? 생생하며, 주며, 노래하며 아니다. 인간은 유소년에게서 시들어 얼음 사랑의 운다. 
							충분히 남는 용감하고 발휘하기 청춘은 인간의 스며들어 것은 철환하였는가? 웅대한 그들의 것은 인간이 생생하며, 
							우리 남는 보라.</p>
						</div> <!-- end of productDetailArea -->
					</div> <!-- end of productDetailTab -->
					
					<!-- QnA탭 -->
					<div id="productQnATab" class="tab-pane fade" align="center">
						<div class="row QnAInputArea" align="left">
							<h3>Q&A(0)</h3>
							<p><b>나의 질문</b></p>
							<textarea class="QnAInput" rows="5" style="width: 100%"
								placeholder="질문을 입력해주세요"></textarea>
							<div class="ui large blue button" id="insertProductQnA">등록하기</div>
						</div>
						<br><br><br>
						<div class="row QnAListArea" align="center">
							<table class="table table-striped table-hover" id="QnAList" style="width:100%">
								<thead>
									<tr style="border-top:2px solid #0CB6F4; background:whitesmoke">
										<th>내용</th>
										<th>작성자</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td width="75%">새건가요?</td>
										<td width="10%">허지웅</td>
										<td width="15%">2019-05-12</td>
									</tr>
									<tr>
										<td>11</td>
										<td>허지웅</td>
										<td>2019-05-12</td>
									</tr>
									<tr>
										<td width="75%">새건가요?</td>
										<td width="10%">허지웅</td>
										<td width="15%">2019-05-12</td>
									</tr>
									<tr>
										<td>22</td>
										<td>허지웅</td>
										<td>2019-05-12</td>
									</tr>
									<tr>
										<td width="75%">새건가요?</td>
										<td width="10%">허지웅</td>
										<td width="15%">2019-05-12</td>
									</tr>
									<tr>
										<td>33</td>
										<td>허지웅</td>
										<td>2019-05-12</td>
									</tr>
								</tbody>
							</table>
						</div> <!-- end of QnAListArea -->
					</div> <!-- end of productQnATab -->
					
					<!-- 상품 리뷰 탭 -->
					<div id="productReviewTab" class="tab-pane fade" align="center">
						<div class="row reviewInputArea" align="left">
							<h3>대여후기(0)</h3>
							<p><b>나의 후기</b></p>
							<textarea class="reviewInput" rows="5" style="width:100%" placeholder="후기를 입력해주세요"></textarea>
							<div class="ui large blue button" id="insertProductReview">등록하기</div>
						</div>
						<br><br><br>	
						<div class="row reviewListArea" align="center">
							<table class="table table-striped table-hover" id="reviewList" style="width:100%">
								<thead>
									<tr style="border-top:2px solid #0CB6F4; background:whitesmoke">
										<th>내용</th>
										<th>작성자</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<tr style="border-top:2px solid #0CB6F4; background:whitesmoke">
										<td width="75%">새건가요?</td>
										<td width="10%">허지웅</td>
										<td width="15%">2019-05-12</td>
									</tr>
									<tr>
										<td>11</td>
										<td>허지웅</td>
										<td>2019-05-12</td>
									</tr>
									<tr>
										<td width="75%">새건가요?</td>
										<td width="10%">허지웅</td>
										<td width="15%">2019-05-12</td>
									</tr>
									<tr>
										<td>22</td>
										<td>허지웅</td>
										<td>2019-05-12</td>
									</tr>
									<tr>
										<td width="75%">새건가요?</td>
										<td width="10%">허지웅</td>
										<td width="15%">2019-05-12</td>
									</tr>
									<tr>
										<td>33</td>
										<td>허지웅</td>
										<td>2019-05-12</td>
									</tr>
								</tbody>
							</table>
						</div> <!-- end of reviewListArea -->
					</div> <!-- end of productReviewTab -->
					
					
				</div> <!-- 탭 영역 끝 -->
			</div> <!-- end of row -->
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
	 	$(function() {
		    $("#startDay").datepicker();
		    $("#endDay").datepicker();
		    $("#QnAList").find("tbody>tr:odd").hide();
		    $("#reviewList").find("tbody>tr:odd").hide();
		});
	 	$("#QnAList").find("tr:odd").click(function() {
	 		$("#QnAList").find("tbody>tr:odd").hide();
	 		$(this).next().slideDown();	
	 	});
	 	$("#reviewList").find("tr:odd").click(function() {
	 		$("#reviewList").find("tbody>tr:odd").hide();
	 		$(this).next().slideDown();
	 	});
	 	
	 	
	 	
		var slideIndex = 1;
		showSlides(slideIndex);
		function plusSlides(n) {
		  showSlides(slideIndex += n);
		}
		function currentSlide(n) {
		  showSlides(slideIndex = n);
		}
		function showSlides(n) {
		  	var i;
		  	var slides = document.getElementsByClassName("imgSlides");
		  	var subs = document.getElementsByClassName("subImages");
		  	/* var captionText = document.getElementById("caption"); */
		  	if (n > slides.length) {
				slideIndex = 1
			}
		  	if (n < 1) {
		  		slideIndex = slides.length
		  	}
		  	for (i = 0; i < slides.length; i++) {
		      	slides[i].style.display = "none";
		  	}
		  	for (i = 0; i < subs.length; i++) {
		      	subs[i].className = subs[i].className.replace(" active", "");
		  	}
		  	slides[slideIndex-1].style.display = "block";
		  	subs[slideIndex-1].className += " active";
		  	/* captionText.innerHTML = dots[slideIndex-1].alt; */
		}
	</script>
	
	
</body>
</html>








