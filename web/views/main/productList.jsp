<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.st.product.model.vo.PCategory"%>
<%
	HashMap<String, Object> listMap = (HashMap<String, Object>)request.getAttribute("listMap");
	ArrayList<PCategory> ctgList = (ArrayList<PCategory>)listMap.get("ctgList");
	ArrayList<HashMap<String, Object>> bList = (ArrayList<HashMap<String, Object>>)listMap.get("bList");
	
%>
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
		height:350px;
	}
	.thumbnailImg {
		width:100% !important;
		height:70% !important;
		border:1px solid lightgray;
		background-size:cover; 
		background-position:center; 
	}
	.filter {
		background:whitesmoke;
		border:1px solid gray;
		border-radius:5px;
		padding:10px;
		width:100%;
	}
	.ctgLv3Btn {
		display:inline-block;
		background:white;
		border:1px solid lightgray;
		border-radius:5px;
		padding:5px;
		margin:5px;
		
	}
	.ctgLv3Btn:hover {
		border:1px solid #0CB6F4;
		border-radius:5px;
	}
	#startFilter, #endFilter {
		 width:100% !important;
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

			<br><br>
			<div class="row filterArea">
				<div class="filter">
					<div class="ui red ribbon label" style="font-size:100%">
	        			<i class="check icon"></i> 상세검색
	      			</div>
	      			<br>
					<!-- <p>항목 선택</p> -->
					<% for(int i = 0; i < ctgList.size(); i++) { %>
					<div class="ctgLv3Btn">
						<div style="width:100%">
							<i class="check icon"></i>
							<label style="margin:0"><%= ctgList.get(i).getCtgName() %></label>
						</div>
					</div>
					<% } %>
					<hr style="border:1px solid lightgray">
					<div class="row">
						<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12" style="margin-bottom:5px;">
							<label>대여 날짜 검색</label>
							<div class="ui left icon fluid input datePicker" style="display:inline-block; margin-right:10px; width:150px;">
								<input type="text" name="startFilter" id="startFilter" placeholder="시작일">
								<i class="calendar alternate outline icon"></i>
							</div>
							
							<div class="ui left icon fluid input datePicker" style="display:inline-block; margin:0; width:150px;">
								<input type="text" name="endFilter" id="endFilter" placeholder="종료일">
								<i class="calendar alternate outline icon"></i>
							</div>
						</div>
						<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<p>
								<label for="priceFilter">대여 가격 설정(/일)</label>
								<input type="text" id="priceFilter" readonly style="border:0; color:#F44A0C; font-weight:bold;">
							</p>
							<div id="slider-range"></div>
						</div>
					</div>
					<hr style="border:1px solid lightgray">
					<div>
						<label>정렬기준</label> &nbsp;&nbsp;
						<input type="radio" name="orderBy" value="recent" id="byRecent" checked>
						<label for="byRecent" style="font-size:0.8em">최신순</label>
						<input type="radio" name="orderBy" value="popular" id="byPopular"> 
						<label for="byPopular" style="font-size:0.8em">인기순</label>
						<input type="radio" name="orderBy" value="review" id="byReview"> 
						<label for="byReview" style="font-size:0.8em">리뷰 많은 순</label>
						<input type="radio" name="orderBy" value="priceAsc" id="byPriceAsc"> 
						<label for="byPriceAsc" style="font-size:0.8em">가격 낮은 순</label>
						<input type="radio" name="orderBy" value="priceDesc" id="byPriceDesc"> 
						<label for="byPriceDesc" style="font-size:0.8em">가격 높은 순</label>
					</div>
					<br>
					<div align="right">
						<div class="ui big red button" id="doFilter" align="right">적용하기</div>
					</div>
				</div>
				<br>
			</div> <!-- end of filterArea -->
			
			<div class="row thumbnailArea">
			
				<% 
					for(int i = 0; i < bList.size(); i++) {
						HashMap<String, Object> hmap = bList.get(i);
				%>
				<div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">
					<div class="thumbnail">
						<div class="ui fluid image thumbnailImg" 
						style="background-image:url('/st/attach_upload/<%= hmap.get("changeName") %>')">
							<a class="ui left corner label">
	        					<i class="heart red icon"></i>
	      					</a>
	      					<a class="ui circular red label" style="position:absolute; top:75%; left:70%;
	      					width:50px; height:50px">
	      						<i class="cart plus icon" style="font-size:30px; position:absolute; top:40%; left:10%"></i>
	      					</a>
						</div>
						<div class="thumbnailCaption">
							<input type="hidden" name="bno" value="<%= hmap.get("bno") %>">
							<p style="font-size:1.2em; font-weight:bold"><%= hmap.get("bTitle") %></p>
							<p align="right">
								등록일 : <%= hmap.get("bDate") %> / 조회수 : <%= hmap.get("bCount") %>
							</p>
							<p align="right">대여후기 : <%= hmap.get("reviewStar") %>점</p>
						</div>
					</div>
				</div>
				<%  } %>

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
		
		$(function() {
			$("#startFilter").datepicker();
		    $("#endFilter").datepicker();
		    $( "#slider-range" ).slider({
			      range:true,
			      min:0,
			      max:100000,
			      step:1000,
			      values:[0, 100000],
			      slide:function(event, ui) {
			        $("#priceFilter").val(ui.values[0] + "원 - " + ui.values[1] + "원");
			      }
			});
			$("#priceFilter").val($("#slider-range").slider("values", 0) +
			      "원 - " + $("#slider-range").slider("values", 1) + "원");
		});
		
		
		$(".ctgLv3Btn").click(function() {
			
			if($(this).css("backgroundColor") != "rgb(12, 182, 244)") {
				$(this).css("background", "#0CB6F4");
				$(this).find("i").css("color", "red");
			}else {
				$(this).css("background", "white");
				$(this).find("i").css("color", "black");
			}
			/* if($(this).css("background") != "rgb(12, 182, 244)"){
			} */
			
			
			var checkBox = $(this).children("input:checkbox");
			if(checkBox.prop("checked", true)) {
				checkBox.prop("checked", false);
			}
			if(checkBox.prop("checked", false)){
				checkBox.prop("checked", true);
			}
			
		});
		$(".thumbnail").click(function() {
			location.href="/st/views/main/productDetail.jsp";
		});
		
	</script>
</body>
</html>








