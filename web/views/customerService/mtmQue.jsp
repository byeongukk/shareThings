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
   .pho1 {
	display:block;
	float:left;
	width:30%;
	height:220px;
	border:1px solid #c4c4c0;
	margin-left:2.5%;
	margin-bottom:1.5%;
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
<table>
<tr>
<td></td>
</tr>
<tr>

<td><i class="fas fa-headset fa-4x"></i></td>
</tr>
</table>

</div> <!-- cus -->
<div class="cus" id="cus2" style="margin-left:5%;">
<table>
<tr >

<td id="text1" style="font-size:25px;"><label>Customer Service</label></td>


</tr>

<tr>
<td id="text1" style="font-size:25px;"><label>02-1234</label></td>
</tr>
</table>
</div> <!-- dus -->


</div> <!-- info -->
</div> <!-- main -->


<div style="clear:left;"></div>
<hr>

<div>
<label class="que" style="font-size:30px;">1 :1 문의하기</label>


</div> <!-- 자주 묻는 질문 -->

<div class="vertical-menu" style=" align:center; ">
 <a href="cs.jsp" >자주 묻는 질문 FAQ</a>
           <a href="mtmQue.jsp">1 : 1 문의하기</a>
           <a href="#">나의 문의 관리</a>

</div> <!-- 옆에 메뉴 -->

    <!-- 여기부터 하면 됨! -->
    
    <div class="detail">
    <form action="/action_page.php">
    <div class="form-group" style="width:40%" >
      <label for="csName">이름</label>
      <input type="text" class="form-control" id="csName" placeholder="내용을 입력하세요" name="csName">
    </div>
    <div class="form-group" style="width:40%">
      <label for="csPwd">연락처</label>
      <input type="password" class="form-control" id="csPwd" placeholder="내용을 입력하세요" name="csPwd">
    </div>
     <div class="form-group" style="width:70%">
      <label for="csEmail">이메일</label>
      <input type="Email" class="form-control" id="csEmail" placeholder="내용을 입력하세요" name="csEmail">
    </div>
    
    
    <div align="center" >
    <select style="width:130px; height:30px; float:right;" >
    <option>배송</option>
    <option>결제</option>
    <option>물품등록</option>
   
    
    
    </select>
    </div> <!-- 카테고리 -->
    
    
    
    
    <div>
    <textarea style="width:100%; height:400px; text-align:left; margin-top:18px;" placeholder="내용을 입력하세요" ></textarea>
    
    
    </div> <!-- 내용 -->
    
   
    
   <!--  <div class="checkbox">
      <label><input type="checkbox" name="remember"> Remember me</label>
    </div> -->
    
    
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
    
     <div style="margin-top:5%;">
  <div class="pho2" id="img1Area">
<img id="img1" style="width:100%; height:100%%; ">
</div>

<div class="pho1" id="img2Area">
<img id="img2" style="width:100%; height:100%;">
</div>


<div class="pho1" id="img3Area">
<img id="img3" style="width:100%; height:100%;">
</div>

<div class="pho2" id="img4Area">
<img id="img4" style="width:100%; height:100%;">
</div>
<div class="pho1" id="img5Area">
<img id="img5" style="width:100%; height:100%;">
</div>
    
    
    
    </div> <!-- 사진첨부 -->
    
    </div> <!-- detail -->
    
    
    
   
</div> <!-- detail -->
    

<!-- footer -->
<div id="footer">
			<%@ include file="../common/footer.jsp" %>
		</div>
	
	<div class="col-lg-1 col-md-1">
	</div>
	
	<div  id="fileArea" style="display: none;">
		<input type="file" id="fileimg1" name="fileimg1" onchange="loadImg(this,1)">
		<input type="file" id="fileimg2" name="fileimg2" onchange="loadImg(this,2)">
		<input type="file" id="fileimg3" name="fileimg3" onchange="loadImg(this,3)">
		<input type="file" id="fileimg4" name="fileimg4" onchange="loadImg(this,4)">
		<input type="file" id="fileimg5" name="fileimg5" onchange="loadImg(this,5)">
		<input type="file" id="fileimg6" name="fileimg6" onchange="loadImg(this,6)">
	
		</div> 
<script>
		$(function(){
			
			$("#fileArea").hide();
			 $("#img1Area").click(function(){
				 $("#fileimg1").click();
			 })
			  $("#img2Area").click(function(){
				 $("#fileimg2").click();
			 })
			  $("#img3Area").click(function(){
				 $("#fileimg3").click();
			 })
			  $("#img4Area").click(function(){
				 $("#fileimg4").click();
			 })
			  $("#img5Area").click(function(){
				 $("#fileimg5").click();
			 })
			
			
		})
		
		function loadImg(value, num) {
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					switch(num){
					case 1 : 
						$("#img1").attr("src",e.target.result);
						break;
					case 2 : 
						$("#img2").attr("src",e.target.result);
						break;
					case 3 : 
						$("#img3").attr("src",e.target.result);
						break;
					case 4 : 
						$("#img4").attr("src",e.target.result);
						break;
					case 5 : 
						$("#img5").attr("src",e.target.result);
						break;
				
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
		
		</script>



















</body>
</html>