<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
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
	.vertical-menu {
 	 width: 15%;
 	 margin-top:10px;
 	 float:left;
	}

	.vertical-menu a {
	text-align: center;
  	background-color: #0CB6F4;
  	color: white;
  display: block;
  padding: 12px;
  text-decoration: none;
	}

.vertical-menu a:hover {
  background-color: #78DBFF;
  text-decoration: none;
  color:white;
}

.vertical-menu a.active {
  background-color: #78DBFF;
  color: white;
}
	.detail {
		margin-top:70px;
		display:block;
		float:left;
		width:80%;
		margin-left: 3%;
	}
	.detail .titletb {
		background:#0CB6F4;
		text-align: center;
		color:white;
		border: 1px solid black;
	
	}
	.icon1 {
		width:70px;
	}

	#footer {
		float:right;
	}
	
	.titletb {
		background:#0CB6F4;
		text-align: center;
		color:white;
		border: 1px solid black;
		width:1000px;
	}
	#mlogo { width:100%;}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="col-lg-1 col-md-1">
	</div>
	<div class="pageWrapper col-lg-10 col-md-10">
		<div id="header">
			<%@ include file="../common/header.jsp" %>
		</div>
		<div id="main">
			<div class="vertical-menu">
			<h1 align="left"><a href="mypgMain.jsp" style="text-decoration: none; background: white; margin:-10px;"><img id="mlogo" src="../../resource/img/mypage/mypage.png"></a></h1>
 			  <a href="mypgUser.jsp" class="active">내 정보 조회</a>
			  <a href="mypgUpPd.jsp" >내 등록 물품</a>
 			 <a href="mypgRtPd.jsp">내 대여 현황</a>
  			<a href="mypgUserPd.jsp">관심물품</a>
 			 <a href="mypgPoint.jsp">적립금 현황</a>
 			 <a href="mypgUser.jsp">내 문의 내역</a>
 			 
			</div>
		
			<div class="detail">
				
				<!-- <table align="center" width="100%">
					<tr>
						<td colspan=6 style="width:50%; text-align:center ;border-right:1px solid black">회원 정보 설정</td>
						<td colspan=6 style="width:50%; text-align:center">배송지 설정</td>
					</tr>
					
				</table> -->
				<div class="btn-group btn-group-justified">
  		  			<a href="#" class="btn btn-primary" style="background:#0CB6F4;">회원 정보 수정</a>
    				<a href="#" class="btn btn-primary" style="background:#0CB6F4;">배송지 설정</a>
  				</div>
  				<hr>
  				<div style="border:1px solid #ececec; padding:5%;">
  					<form>
    					<div class="form-group">
      						<label for="userId">아이디:</label>
      						<input type="text" class="form-control" id="userId" readonly value="wnsgur3280">
    					</div>
    					<div class="form-group">
      						<label for="pwd">비밀번호:</label>
      						<input type="password" class="form-control" id="pwd">
    					</div>
    					<div class="form-group">
      						<label for="pwdcf">비밀번호 확인:</label>
      						<input type="password" class="form-control" id="pwdcf">
    					</div>
    					<div class="form-group" style="width:20%;">
      						<label for="usr">이름:</label>
      						<input type="text" class="form-control" id="usr" >
    					</div>
  					</form>
  				</div>
			
			
			</div>
	
	</div>
	<div id="footer">
			<%@ include file="../common/footer.jsp" %>
		</div>
		
	<div class="col-lg-1 col-md-1">
	</div>
</body>
</html>
			