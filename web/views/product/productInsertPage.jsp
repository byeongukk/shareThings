<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	
	
	
}

	html {
		height:100%;
	}
	.pageWrapper {
		padding:0;
		margin:0;
		height:100%;
	}
	#header {
		padding:0;
		margin:0;
		width:100%;
		
	}
	#main {
		padding:0;
		margin:0;
		width:100%;
		min-height:80%;
	}
	#footer {
		padding:0;
		margin:0;
		width:100%;
		height:100px;
	}
	#pic1{
		width:200px;
		height:500px;
		text-align:center;
		
	}
	#pic2 {
	width:1000px;
	
	}
	 td{
	border:1.5px solid #c4c4c0;
	
	
	} 
	#title1{
	height:100px;
	text-align:center;
	}
	#category1{
	height:100px;
	text-align:center;
	}
	#lental1 {
	height:100px;
	text-align:center;
	}
	#info1 {
	height:200px;
	text-align:center;
	}
	#tag1 {
	height:100px;
	text-align:center;
	}
	#deal1 {
	height:100px;
	text-align:center;
	}
	#phone1 {
	height:100px;
	text-align:center;
	}
	#address1 {
	height:100px;
	text-align:center;
	}
	#time1 {
	height:100px;
	text-align:center;
	}
	#modelName1 {
	height:100px;
	text-align:center;
	}
	.pho1 {
	display:block;
	float:left;
	width:30%;
	height:220px;
	border:1px solid #c4c4c0;
	margin-left:2.5%;
	margin-bottom:1.5%;
	}
	.pho0 {
	display:block;

	}
	.pho2 {
	display:block;
	float:left;
	width:30%;
	height:220px;
	border:1px solid #c4c4c0;
	clear:left;
	margin-left:2.5%;
	margin-bottom:1.5%;
	}
	.tb{
	margin-left:2.5%;
	
	}
	.ta{
	margin-left:2.5%;
	}
	.dta{
	margin-left:2.5%;
	}
	.p {
	margin-left:2.5%;
	}
	.zad {
	margin-left:2.5%;
	
	}
	.tta {
		margin-left:2.5%;
	
	}
	.mta{
		margin-left:2.5%;
	
	}
	.cc{
	margin-left:2.5%;
	}
	.price {
	margin-left:2.5%;
	height:100px;
	
	}
	.brand {
	margin-left:2.5%;
	
	}
	#purchasePrice2{
	height:100px;
	}
	#brand2 {
	height:100px;
	}
	.brand3 {
	margin-left:2.5%;
	}
	#as2{
	height:100px;
	}
	.as3{
	margin-left:2.5%;
	}
	#rentPrice2{
	height:100px;
	
	}
	.rentPrice3 {
	margin-left:2.5%;
	}
	#deposit2{
	height:100px;
	}
	.deposit3{
	margin-left:2.5%;
	}
</style>
</head>
<body>

<div>
<div class="col-lg-1 col-md-1">
	</div>
	<div class="pageWrapper col-lg-10 col-md-10">
		<div id="header">
			<%@ include file="../common/header.jsp" %>
		</div>
		<div id="main">
		
<!-- <label>※ </label> -->


<hr>
<div id="photo">
<form>
<table align="center">

<tr>
<td colspan="1"></td>
<td class="teduri" colspan="3" id="pic1">사진등록</td>
<td colspan="7" id="pic2">

<div class="pho0">

<div class="pho2">1</div>
<div class="pho1">2</div>
<div class="pho1">3</div>

</div>

<div class="pho0">

<div class="pho2">4</div>
<div class="pho1">5</div>
<div class="pho1">6</div>


</div>







</td>
<td colspan="1"></td>

</tr>

<tr>



</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="title1">제목</td>
<td colspan="7" id="title2">

<input class="tb" type="text" name="textfield" style="width:700px; 
height:40px; left:0;" placeholder="  내용을 입력해주세욧">


</td>
<td colspan="1"></td>
</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="category1">카테고리</td>


<td colspan="7" id="category2">

 <select class="cc" style="width:150px; height:50px; text-align:center;">

<option>대분류</option>
<option>전자기기</option>
<option>취미/레저</option>
<option>리빙</option>
<option>유아동</option>
<option>반려동물</option>

</select>
<select class="cc" style="width:150px; height:50px; text-align:center;">

<option>중분류</option>

</select>
<select class="cc" style="width:150px; height:50px; text-align:center;">

<option>소분류</option>

</select> 

</td>
<td colspan="1"></td>
</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="lental1">렌탈 가능 기간</td>

<td colspan="7" id="lental2">에에</td>
<td colspan="1"></td>
</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="info1">내용</td>
<td colspan="7" id="info2">

<textarea class="ta" style="width:90%; height:150px;" id="productdetail" row="15" col="50" placeholder="아이템 정보를 상세히 입력하세요"></textarea>


</td>
<td colspan="1"></td>
</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="tag1">태그</td>
<td colspan="7" id="tag2">





</td>
<td colspan="1"></td>
</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="deal1">희망가격</td>
<td colspan="7" id="deal2">

<input class="dta"type="text" name="textfield" style="width:30%; height:30px; " placeholder="희망 가격을 입력하세요">
<label>원</label>


</td>
<td colspan="1"></td>
</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="phone1">전화번호</td>
<td colspan="7" id="phone2">
<input class="p"type="text" name="hp1" style="width:30%; height:30px; " placeholder="  hp"><br>

<input class="p"type="text" name="em1" style="width:30%; height:30px; " placeholder="  비상연락망">




</td>
<td colspan="1"></td>
</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="address1">주소지</td>
<td colspan="7" id="address2">

<input class="zad" type="text" name="zipcode" style="width:20%; height:30px; " placeholder="  우편번호">
<button style="background:#c4c4c0" >검색</button>
<br>
<input class="zad" type="text" name="add" style="width:50%; height:30px; " placeholder="  주소">
<br>
<input class="zad" type="text" name="dadd" style="width:50%; height:30px; " placeholder="  상세주소">




</td>
<td colspan="1"></td>
</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="time1">제품구입시기</td>
<td colspan="7" id="time2">
<input class="tta" type="text" name="textfield" style="width:30%; height:30px; " placeholder="제품 구입 시기 입력">


</td>
<td colspan="1"></td>
</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="modelName1">모델명</td>
<td colspan="7" id="modelName2">

<input class="mta"type="text" name="textfield" style="width:30%; height:30px; " placeholder="모델명 입력">
</td>
<td colspan="1"></td>
</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="purchasePrice1" style="text-align:center" >구입가</td>
<td colspan="7" id="purchasePrice2" >

<input class="price" type="text" name="textfield" style="width:30%; height:30px; ">
<label>원</label>
</td>
<td colspan="1"></td>

</tr>
 
<tr>
<td colspan="1"></td>
<td colspan="3" id="brand1" style="text-align:center">물품스펙 / 브랜드명</td>
<td colspan="7" id="brand2">
<input class="brand3" type="text" name="textfield" style="width:700px; 
height:40px; left:0;" placeholder="  내용을 입력해주세욧">

</td>
<td colspan="1"></td>


</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="as1" style="text-align:center">최근 A/S이력</td>
<td colspan="7" id="as2">
<input class="as3" type="text" name="textfield" style="width:700px; 
height:40px; left:0;" placeholder="  내용을 입력해주세욧">


</td>
<td colspan="1"></td>
</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="rentPrice1" style="text-align:center">희망 렌탈비(월)</td>
<td colspan="7" id="rentPrice2">
<input class="rentPrice3" type="text" name="textfield" style="width:200px; 
height:40px; left:0;" placeholder="  가격을 입력해주세욧"><br>
<label style="margin-left:2.5%; margin-top:2%;">※ 등록 물품 대비 금액이 너무 높으면 렌탈이 어려울 수 있음을 주의하십시오!</label>


</td>
<td colspan="1"></td>
</tr>



<tr>
<td colspan="1"></td>
<td colspan="3" id="deposit1" style="text-align:center">보증금</td>
<td colspan="7" id="deposit2">
<input class="deposit3" type="text" name="textfield" style="width:200px; 
height:40px; left:0;" placeholder="  가격을 입력해주세욧"><br>
<label style="margin-left:2.5%; margin-top:2%;">※ 희망 렌탈비 대비 보증금이 너무 높으면 렌탈이 어려울 수 있음을 주의하십시오!</label>

</td>
<td colspan="1"></td>
</tr>






</table>
<br>
		<br><br>
		
		
		<div>
		
		<ul class="pager">
    <li><a href="" style="color:#F44A0C">이전</a></li>
    <li><a href="confirm.jsp" style="color:#0CB6F4">다음</a></li>
  </ul>
</div> <!-- 이전, 다음 버튼 -->

</form>




</div>
		</div>
		
		</div>
		
		<div style="width:60%; margin:0 auto">
		<h4 style="text-align:center; font-weight:bold"> 아이템 등록전에 꼭 확인하세요!!!!!!!!!!!!!!!!!!!!!!!!!</h4><br>
		
		비정상적인 물품을 등록하거나, share things 사용금지 거래(상품권)에 속하는 아이템을 해당 카테고리가 아닌 잘못된 카테고리에 등록할 경우
 		그 정도에 따라 경고, 출금요청 취소, 지급된 share things 포인트 전액 소멸, 계정제재 등의 책임을 물을 수 있음을 알려드립니다.
		<br>
		
		</div>
		<div id="footer">
			<%@ include file="../common/footer.jsp" %>
		</div>
	
	</div>
	<div class="col-lg-1 col-md-1">
	</div>
	</div>
	
	
	
	
</body>
</html>