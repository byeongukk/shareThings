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
				<div class="ui red ribbon label">
        			<i class="check icon"></i> 선택
      			</div>
				<div>
					<label></label>
					<% for(int i = 0; i < ctgList.size(); i++) { %>
					<button class="ui basic button ctgLv3Btn" >
						<input type="checkBox" name="ctgLv3" value="<%= ctgList.get(i).getCtgId() %>" 
						id="<%= ctgList.get(i).getCtgId() %>">
						<label for="<%= ctgList.get(i).getCtgId() %>"><%= ctgList.get(i).getCtgName() %></label>
					</button>
					<% } %>
				</div>
				
				<div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12" id="ctgLv3Area">
					<div>
						
					</div>
				</div>

			</div> <!-- end of filterArea -->
			<br><br>
			
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
		$(".ctgLv3Btn").click(function() {
			var checkBox = $(this).children("input[type=checkBox]");
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








