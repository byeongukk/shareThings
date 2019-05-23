<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
h3 {
margin-left:10%;
}
.cus {
float:left;
display:block;
}
/* #cus2 {
clear:left;
} */

#main {
width:100%;
}
	#info {
		width:100%;
	}
	
	#footer{
		clear:left;
	}
	.que {
	margin-left:22%;
	margin-top:0 auto;
	}
	.vertical-menu {
     width: 15%;
     margin-top:10px;
     float:left;
   }

   .vertical-menu a {
   text-align: center;
     background-color: #eee;
     color: black;
  display: block;
  padding: 12px;
  text-decoration: none;
   }

.vertical-menu a:hover {
  background-color: #ccc;
}

.vertical-menu a.active {
  background-color: #4CAF50;
  color: white;
}
.detail {

      display:block;
      float:left;
      width:80%;
      margin-left: 3%;
   }
	
</style>

</head>
<body>

<div class="col-lg-1 col-md-1">
	</div>
	<div class="pageWrapper col-lg-10 col-md-10">
		<div id="header">
			<%@ include file="../common/header.jsp" %>
		</div>
		<div id="main" style="">
<!-- header -->
<div id="info" style="margin-top:50px;">

<div class="cus">
<tr>
<td></td>
</tr>
<tr>

<td><i class="fas fa-headset fa-4x"></i></td>
</tr>


</div>
<div class="cus" id="cus2" style="margin-left:5%;">
<table>
<tr >

<td id="text1" style="font-size:25px;"><label>Customer Service</label></td>


</tr>

<tr>
<td id="text1" style="font-size:25px;"><label>02-1234</label></td>
</tr>
</table>
</div>


</div>
</div>


<div style="clear:left;"></div>
<hr>

<div>
<label class="que" style="font-size:30px;">자주 묻는 질문</label>



</div>

<div class="vertical-menu" style=" align:center; ">
 <a href="/st/views/customerService/cs.jsp" >자주 묻는 질문 FAQ</a>
           <a href="/st/views/customerService/mtmQue.jsp">1 : 1 문의하기</a>
           <a onclick="myQue();">나의 문의 관리</a>
<a href="../customerService/guide.jsp">이용안내</a>
</div>


	<div class="detail">
<div class="btn-group btn-group-justified">
  <div class="btn-group">
    <button type="button" class="btn btn-primary" style="color:white; background:#0CB6F4;  border:1px solid #0CB6F4; ">TOP10</button>
  </div>
  <div class="btn-group">
    <button type="button" class="btn btn-primary" style="color:white; background:#0CB6F4; border:1px solid #0CB6F4;">이용 방법</button>
  </div>
  <div class="btn-group">
    <button type="button" class="btn btn-primary" style="color:white; background:#0CB6F4; border:1px solid #0CB6F4;">배송</button>
    
  </div>
   <div class="btn-group">
    <button type="button" class="btn btn-primary" style="color:white; background:#0CB6F4; border:1px solid #0CB6F4;">판매 방법</button>
    </div>
</div>
    
    
    <div style="display:block; clear:left;">
    <table class="table" >
    <thead>
      <tr>
        <th>No.</th>
        <th>title</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>어떤 물건을 등록 할 수 있나요?</td>
        <td>187</td>
      </tr>
      <tr>
        <td>2</td>
        <td>배송 관련 질문</td>
        <td>120</td>
      </tr>
      <tr>
        <td>3</td>
        <td>보증금 관련 질문</td>
        <td>99</td>
      </tr>
      
       <tr>
        <td>4</td>
        <td>결제 관련</td>
        <td>22</td>
      </tr>
       <tr>
        <td>5</td>
        <td>물품 등록 어떻게 하나요?</td>
        <td>88</td>
      </tr>
       <tr>
        <td>6</td>
        <td>판매자에게 연락은 어떻게 하나요?</td>
        <td>33</td>
      </tr>
       <tr>
        <td>7</td>
        <td>배송 예약도 가능한가요?</td>
        <td>44</td>
      </tr>
       <tr>
        <td>8</td>
        <td>물품 파손 시 보증금은 어떻게되나요?</td>
        <td>78</td>
      </tr>
       <tr>
        <td>9</td>
        <td>판매 불가 항목에는 어떤게 있나요?</td>
        <td>54</td>
      </tr>
       <tr>
        <td>10</td>
        <td>택배비용</td>
        <td>22</td>
      </tr>
      
    </tbody>
  </table>
    
    </div>
</div>




</div>
  

<!-- footer -->
<div id="footer">
			<%@ include file="../common/footer.jsp" %>
		</div>
	
	</div>
	<div class="col-lg-1 col-md-1">
	</div>
<script>
function myQue(){
	location.href="/st/cslist.cs";
}

</script>
</body>
</html>