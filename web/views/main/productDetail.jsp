<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.st.attachment.model.vo.Attachment"%>
<%
	HashMap<String, Object> pDetailMap = (HashMap<String, Object>)request.getAttribute("bDetailMap");
	HashMap<String, Object> bmap = (HashMap<String, Object>)pDetailMap.get("bmap");
	ArrayList<Attachment> attList = (ArrayList<Attachment>)pDetailMap.get("attList");
	HashMap<String, Object> bWritermap = (HashMap<String, Object>)pDetailMap.get("bWritermap");
	ArrayList<HashMap<String, Object>> QnAList = (ArrayList<HashMap<String, Object>>)pDetailMap.get("QnAList");
	ArrayList<HashMap<String, Object>> reviewList = (ArrayList<HashMap<String, Object>>)pDetailMap.get("reviewList");
	HashMap<String, Object> rvAttmap = (HashMap<String, Object>)pDetailMap.get("rvAttmap");
	

%>
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
		height:80px !important;
	}
	#QnAList tr:last-child, #reviewList tr:last-child {
		border-bottom:2px solid #0CB6F4;
	}
	#QnAList >tbody tr:nth-of-type(2n-1):hover, #reviewList>tbody tr:nth-of-type(2n-1):hover {
		cursor:pointer;
	}
	.rvImageArea {
		border:1px solid lightgray;
		display:inline-block;
		width:50px;
		height:50px;
		margin-bottom:10px;
		position:relative;
	}
	.rvImageArea:hover {
		border:1px solid #0CB6F4;
		cursor:pointer;
	}
	#rvImg1:hover, #rvImg2:hover, #rvImg3:hover, #rvImg4:hover, #rvImg5:hover {
		/* box-shadow:1px 1px #0CB6F4; */
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
					<% 
						for(int i = 0; i < attList.size(); i++) { 
					%>
				 	<div class="imgSlides" align="center">
				    	<img src="/st/attach_upload/<%= attList.get(i).getChangeName() %>" height="100%" width="auto">
				  	</div>
				  	
				  	<% 
						}
				  	%>
				    
				  	<a class="prev cursor" onclick="plusSlides(-1)">❮</a>
				  	<a class="next cursor" onclick="plusSlides(1)">❯</a>
				  		
				  	<div class="row imgListArea">
				  		<%
				  			for(int i = 0; i < attList.size(); i++) {
				  		%>
				    	<div class="col col-lg-2 col-md-2 col-sm-2 col-xs-2 imgList">
				      		<img class="subImages cursor" src="/st/attach_upload/<%= attList.get(i).getChangeName() %>" 
				      		style="width:100%" onclick="currentSlide(<%= i+1 %>)" alt="">
				    	</div>
				    	
				    	<%
				  			}
				    	%>
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
											<a class="ui basic red left pointing label"> <%= bmap.get("zzimCount") %> </a>
										</div>
										<div class="ui labeled button" tabindex="0">
											<div class="ui basic blue button">
												<i class="chart bar icon"></i> 조회수
											</div>
											<a class="ui basic left pointing blue label"> <%= bmap.get("bCount") %> </a>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<h3><b><%= bmap.get("bTitle") %></b></h3>
									</td>
								</tr>
								<tr>
									<td>
										<label style="color:#0CB6F4; font-wieght:bold; font-size:2em"><%= bmap.get("price") %>원/주</label>
									</td>
									<td>
										<label style="color:gray; font-wieght:bold;">/ 보증금 <%= bmap.get("deposit") %>원</label>
									</td>
								</tr>
								<tr>
									<td colspan="2"><label>모델명 : <%= bmap.get("model") %></label></td>
								</tr>
								<tr>
									<td><label>물품상태 : <%= bmap.get("condition") %></label></td>
									<td><label>구입시기 : <%= bmap.get("purchaseDate") %></label></td>
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
					<div class="sellerBlock" style="height:80px">
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
										<label><%= bmap.get("bWriter") %> (등급 : <%= bWritermap.get("mLevelName") %>)</label>
									</div>
								</td>
								<td><label>아이템 : <%= bWritermap.get("pCount") %></label></td>
								<td><label>후기 : <%= bWritermap.get("rvCount") %></label></td>
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
							<p><%= bmap.get("bContent") %></p>
						</div> <!-- end of productDetailArea -->
					</div> <!-- end of productDetailTab -->
					
					<!-- QnA탭 -->
					<div id="productQnATab" class="tab-pane fade" align="center">
						<div class="row QnAInputArea" align="left">
							
							<h3>Q&A(<%= QnAList.size() %>)</h3>
							<br>
							<p><b>나의 질문</b></p>
							<textarea class="QnAInput" rows="5" style="width: 100%"
								placeholder="질문을 입력해주세요" id="QnAinput"></textarea>
							<div class="ui large blue button" id="insertProductQnA">등록하기</div>
						</div>
						<br><br><br>
						<div class="row QnAListArea" align="center">
							<table class="table table-striped" id="QnAList" style="width:100%">
								<thead>
									<tr style="border-top:2px solid #0CB6F4; background:whitesmoke">
										<th width="75%">내용</th>
										<th width="10%">작성자</th>
										<th width="15%">작성일</th>
									</tr>
								</thead>
								<tbody>
									<%
										for(int i = 0; i < QnAList.size(); i++) {
									
									%>
									<tr>
										<td><%= QnAList.get(i).get("qnaTitle") %></td>
										<td><%= QnAList.get(i).get("qnaWriter") %></td>
										<td><%= QnAList.get(i).get("qnaDate") %></td>
									</tr>
									<tr>
										<td><%= QnAList.get(i).get("qnaContent") %></td>
										<td></td>
										<td></td>
									</tr>
									<%
											if(QnAList.get(i).get("ansTitle") != null) {
									%>
									<tr>
										<td style="color:orangered">
											&nbsp;&nbsp;[답글 :]<%= QnAList.get(i).get("ansTitle") %>
										</td>
										<td><%= QnAList.get(i).get("ansWriter") %></td>
										<td><%= QnAList.get(i).get("ansDate") %></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;<%= QnAList.get(i).get("ansContent") %></td>
										<td></td>
										<td></td>
									</tr>
									<%
											}
										}
									%>
								</tbody>
							</table>
						</div> <!-- end of QnAListArea -->
					</div> <!-- end of productQnATab -->
					
					<!-- 상품 리뷰 탭 -->
					<div id="productReviewTab" class="tab-pane fade" align="center">
						<div class="row reviewInputArea" align="left">
							<h3>대여 후기(<%= reviewList.size() %>)</h3>
							<br>
							<p><b>나의 후기</b></p>
							<form id="reviewForm" method="POST" enctype="multipart/form-data">
								<div class="ui star huge rating" data-rating="3" data-max-rating="5"></div>
								<textarea class="reviewInput" rows="5" style="width:100%" placeholder="후기를 입력해주세요"></textarea>
								<div class="rvAttachArea">
									<label>사진 첨부</label>
									<div class="rvImageArea rvImageArea1">
										<i class="camera icon" style="position:absolute; top:30%;left:35%;"></i>
										<img id="rvImg1"width="100%" height="100%">
									</div>
									<div class="rvImageArea rvImageArea2" >
										<i class="camera icon" style="position:absolute; top:30%;left:35%;"></i>
										<img id="rvImg2"width="100%" height="100%">
									</div>
									<div class="rvImageArea rvImageArea3">
										<i class="camera icon" style="position:absolute; top:30%;left:35%;"></i>
										<img id="rvImg3"width="100%" height="100%">
									</div>
									<div class="rvImageArea rvImageArea4">
										<i class="camera icon" style="position:absolute; top:30%;left:35%;"></i>
										<img id="rvImg4"width="100%" height="100%">
									</div>
									<div class="rvImageArea rvImageAre5">
										<i class="camera icon" style="position:absolute; top:30%;left:35%;"></i>
										<img id="rvImg5"width="100%" height="100%">
									</div>
									<div id="fileArea">
										<input type="file" id="img1" name="img1" onchange="loadImg(this, 1);">
										<input type="file" id="img2" name="img2" onchange="loadImg(this, 2);">
										<input type="file" id="img3" name="img3" onchange="loadImg(this, 3);">
										<input type="file" id="img4" name="img4" onchange="loadImg(this, 4);">
										<input type="file" id="img5" name="img5" onchange="loadImg(this, 5);">
										
									</div>
								</div>
							</form>
							<div class="ui large blue button" id="insertProductReview">등록하기</div>
						</div>
						<br><br><br>	
						<div class="row reviewListArea" align="center">
							<table class="table table-striped" id="reviewList" style="width:100%">
								<thead>
									<tr style="border-top:2px solid #0CB6F4; background:whitesmoke">
										<th width="75%">내용</th>
										<th width="10%">작성자</th>
										<th width="15%">작성일</th>
									</tr>
								</thead>
								<tbody>
									<%
										for(int i = 0; i < reviewList.size(); i++) {
									
									%>
									<tr>
										<td><%= reviewList.get(i).get("rvTitle") %></td>
										<td><%= reviewList.get(i).get("rvWriter") %></td>
										<td><%= reviewList.get(i).get("rvDate") %></td>
									</tr>
									<tr>
										<td><%= reviewList.get(i).get("rvContent") %></td>
										<td><%= reviewList.get(i).get("rvWriter") %></td>
										<td><%= reviewList.get(i).get("rvDate") %></td>
									</tr>
									<%
											if(QnAList.get(i).get("ansTitle") != null) {
									%>
									<tr>
										<td style="color:orangered">&nbsp;&nbsp;[답글 :]<%= reviewList.get(i).get("ansTitle") %></td>
										<td><%= reviewList.get(i).get("ansWriter") %></td>
										<td><%= reviewList.get(i).get("ansDate") %></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;<%= reviewList.get(i).get("ansContent") %></td>
										<td><%= reviewList.get(i).get("ansWriter") %></td>
										<td><%= reviewList.get(i).get("ansDate") %></td>
									</tr>
									<%
											}
										}
									%>
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
			hideContent();
			$(".ui.rating").rating();
			$("#fileArea").hide();
			
			
	 	});
	 	$(".rvImageArea1").click(function() {
	 		$("#img1").click();
	 	});
	 	$(".rvImageArea2").click(function() {
	 		$("#img2").click();
	 	});
	 	$(".rvImageArea3").click(function() {
	 		$("#img3").click();
	 	});
	 	$(".rvImageArea4").click(function() {
	 		$("#img4").click();
	 	});
	 	$(".rvImageArea5").click(function() {
	 		$("#img5").click();
	 	});
	 	
	 	
	 	
	 	function hideContent() {
		    $("#QnAList").find("tbody>tr:odd").hide();
		    $("#reviewList").find("tbody>tr:odd").hide();
		 	$("#QnAList").find("tr:odd").click(function() {
		 		/* $(this).css("background", "lightblue");
		 		$(this).siblings("tr:even").css("background", "#f9f9f9"); */
		 		$("#QnAList").find("tbody>tr:odd").hide();
		 		$(this).next().slideDown();	
		 	});
		 	$("#reviewList").find("tr:odd").click(function() {
		 		/* $(this).css("background", "lightblue");
		 		$(this).siblings().css("background", "#f9f9f9"); */
		 		$("#reviewList").find("tbody>tr:odd").hide();
		 		$(this).next().slideDown();
		 	});
	 	}
	 	
	 	function loadImg(value, num) {
	 		if(value.files && value.files[0]) {
	 			var reader = new FileReader();
	 			reader.onload = function(e) {
	 				switch (num) {
	 				case 1 : $("#rvImg1").attr("src", e.target.result);
	 						$("#rvImg1").css("zIndex", "100");break;
	 				case 2 : $("#rvImg2").attr("src", e.target.result);break;
	 				case 3 : $("#rvImg3").attr("src", e.target.result);break;
	 				case 4 : $("#rvImg4").attr("src", e.target.result);break;
	 				case 5 : $("#rvImg5").attr("src", e.target.result);break;
	 				}
	 			}
	 			reader.readAsDataURL(value.files[0]);
	 		}
	 	}
	 	
	 	
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
				slideIndex = 1; //맨처음으로 이동
			}
		  	if (n < 1) {
		  		slideIndex = slides.length  //마지막으로 이동
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
		
		
		//qna등록
		$("#insertProductQnA").click(function() {
			<% if(loginUser == null) {%>
			location.href="<%= request.getContextPath() %>/views/member/loginPage.jsp";
			<% }else {%>
			var qnaInput = $("#QnAinput").val();
			
			$.ajax({
				url:"<%= request.getContextPath() %>/insertQnA.bo",
				type:"post",
				data:{qnaInput:qnaInput, qnaWriter:<%= loginUser.getUno() %>, parentBno:<%= bmap.get("bno") %>, pno:<%= bmap.get("pno") %>},
				success:function(data) {
					var $tbody = $("#QnAList>tbody");
					$tbody.html("");
					for(var key in data) {
						var $tr = $("<tr>");
						var $titleTd = $("<td>").text(data[key].qnaTitle);
						var $writerTd = $("<td>").text(data[key].qnaWriter);
						var $dateTd = $("<td>").text(data[key].qnaDate);
						$tr.append($titleTd);
						$tr.append($writerTd);
						$tr.append($dateTd);
						$tbody.append($tr);
						
						var $contentTr = $("<tr>");
						var $contentTd = $("<td>").text(data[key].qnaContent);
						var $emptyTd = $("<td colspan='2'>");
						$contentTr.append($contentTd);
						$contentTr.append($emptyTd);
						$tbody.append($contentTr);

						if(data[key].ansTitle != null) {
							var $ansTr = $("<tr>");
							var $ansTitleTd = $("<td style='color:orangered'>").text("  [답변 :]" + data[key].ansTitle);
							var $ansWriterTd = $("<td>").text(data[key].ansWriter);
							var $ansDateTd = $("<td>").text(data[key].ansDate);
							$ansTr.append($ansTitleTd);
							$ansTr.append($ansWriterTd);
							$ansTr.append($ansDateTd);
							$tbody.append($ansTr);
	
							var $ansContentTr = $("<tr>")
							var $ansContentTd = $("<td>").text(data[key].ansContent);
							var $emptyTd = $("<td colspan='2'>");
							$ansContentTr.append($ansContentTd);
							$ansContentTr.append($emptyTd);
							$tbody.append($ansContentTr);
							
						}
					}
					$("#QnAinput").val("");
					hideContent();
					alert("QnA 등록 완료");
				}, error:function(data) {
					alert("서버 전송 실패");
				}
				
			})
			<% } %>
		});
		
		
		//review 등록
		$("#insertProductReview").click(function() {
			<% if(loginUser == null) {%>
			location.href="<%= request.getContextPath() %>/views/member/loginPage.jsp";
			<% }else {%>
			var form = $("#reviewForm");
			var formData = new FormData(form);
			$.ajax({
				url:"<%= request.getContextPath() %>/insertQnA.bo",
				type:"post",
				encType:"multipart/form-data",
				data:formData,
				success:function(data) {
					var $tbody = $("#reviewList>tbody");
					$tbody.html("");
					for(var key in data) {
						var $tr = $("<tr>");
						var $titleTd = $("<td>").text(data[key].qnaTitle);
						var $writerTd = $("<td>").text(data[key].qnaWriter);
						var $dateTd = $("<td>").text(data[key].qnaDate);
						$tr.append($titleTd);
						$tr.append($writerTd);
						$tr.append($dateTd);
						$tbody.append($tr);
						
						var $contentTr = $("<tr>");
						var $contentTd = $("<td>").text(data[key].qnaContent);
						var $emptyTd = $("<td colspan='2'>");
						$contentTr.append($contentTd);
						$contentTr.append($emptyTd);
						$tbody.append($contentTr);

						if(data[key].ansTitle != null) {
							var $ansTr = $("<tr>");
							var $ansTitleTd = $("<td style='color:orangered'>").text("  [답변 :]" + data[key].ansTitle);
							var $ansWriterTd = $("<td>").text(data[key].ansWriter);
							var $ansDateTd = $("<td>").text(data[key].ansDate);
							$ansTr.append($ansTitleTd);
							$ansTr.append($ansWriterTd);
							$ansTr.append($ansDateTd);
							$tbody.append($ansTr);
	
							var $ansContentTr = $("<tr>")
							var $ansContentTd = $("<td>").text(data[key].ansContent);
							var $emptyTd = $("<td colspan='2'>");
							$ansContentTr.append($ansContentTd);
							$ansContentTr.append($emptyTd);
							$tbody.append($ansContentTr);
							
						}
					}
					$("#QnAinput").val("");
					hideContent();
					alert("QnA 등록 완료");
				}, error:function(data) {
					alert("서버 전송 실패");
				}
				
			})
			<% } %>
		});
		
		
	</script>
	
	
</body>
</html>








