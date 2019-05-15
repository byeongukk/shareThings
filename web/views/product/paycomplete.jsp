<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스-장바구니</title>
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
	.next:hover {
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
	  display: table;
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
		height:400px;
	}
	.titleBlock, .sellerBlock {
		 border:1px solid lightgray;
		 padding:10px;
	}
	.datePicker {
		width:50%;
	}
	#addCartBtn, #lendBtn {
		height:50px;
		font-size:1.5em;
	}
	.QnAInputArea, .QnAListArea, .reviewInputArea, .reviewListArea {
		padding:15px;
	}
	.QnATitle {
		/* display:table-cell;
		vertical-align:middle; */
		width:100%;
		height:40px;
		margin:0 !important;
	}
	/* .QnATitle>div {
		display:table-cell;
	} */
	
	.listimg{width:30%;}
	.pdtlist {
		text-align:center;
	}
	.paywon {
		color:#F44A0C;
		font-weight:bold;
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

			<div class="title" style="text-align:center;">
				<img src="/st/resource/img/cart/cart.png" width="15%;" style="text-align:center; margin-bottom:-20px;">
				<h2 align="center" style="padding-bottom:0px; font-weight:bold;">결제가 완료 되었습니다.</h2>
			</div>
			
			<div class="payprocess" style="text-align:center;">
				<img src="/st/resource/img/payprocess4.png" width="70%;" style="text-align:center;">
				<hr>
			</div>
			
			
			<hr>
			
			<table align=center width="100%;" class="pdtlist">
				<tr>
					<td colspan=7 width="100%" align="left" style="border:1px solid lightgray; padding:5px; font-weight:bold; background:#ececec;">결제 상품 리스트</td>
				</tr>
					<tr> <td>&nbsp;</td></tr>
				<tr style="border:1px solid lightgray; padding:5px; margin:100px 100px; background:#0CB6F4; color:white;">
					<td>
						<input type="checkbox">
					</td>
					<td width="30%;">상품사진</td>
					<td width="30%;">상품정보</td>
					<td>대여기간</td>
					<td>대여비용</td>
					<td>배송비</td>
					<td>합계</td>
				</tr>
				<tr >
					<td>
						<input type="checkbox">
					</td>
					<td><img src="../../resource/img/mypage/naninggu.PNG" class="listimg"></td>
					<td>아저씨의 난닝구</td>
					<td>94/02/26</td>
					<td>2,600,000</td>
					<td>3,500</td>
					<td>
					2,603,500
					</td>
				</tr>
				
				
				
			</table>
			
			
			<hr>
			
		
			<div style="margin:50px;" align="center">
				
				<button style="background:#0CB6F4; color:white; text-decoration:none; border-radius:10px; border:none; height:50px; width:120px;">주문 내역 보기</button><br><br>
			
			</div>
			
		</div> <!-- end of 메인바디 -->

		<!-- 푸터 -->
		<div class="footer">
			<%@ include file="../common/footer.jsp"%>
		</div>

	</div>
	<div class="rightArea col col-lg-1 col-md-1">
	</div>
	
	

	
	
	
	
</body>
</html>








