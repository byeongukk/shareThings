<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* hr {
		border : 1px solid #F44A0C;
	} */
	.top {
		display:block;
	}
	.col {
		display:inline-block;
	}
	
	#category {
		background:#F44A0C;
		border:1px solid black;
		font-size:30px;
	}
	#logo {
		background:#0CB6F4;
		border:1px solid black;
		font-size:30px;
	}
	#rent {
		background:lightgray;
		border:1px solid #F44A0C;
		font-size:30px;
	}
	#menubar {
		background:ligh-gray;
		font-size:20px;
		border-top:2px solid #F44A0C;
		border-bottom:2px solid #F44A0C;
	}
	#menubar>table td{
		height:70px;
		width:100px;
		vertical-align:middle;
		text-align:center;
		
	}
</style>
<link rel="stylesheet" type="text/css" href="/st/css/semantic.min.css">
<script src="/st/js/semantic.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="row" align="right">
		<a href="#">로그인</a>
		<label>l</label>
		<a href="#">회원가입</a>
		<label>l</label>
		<a href="#">고객센터</a>
		<label>l</label>
		<a href="#">이용안내</a>
	</div>
	<br>
	<div class="row" align="center">
		<div class="col col-lg-4">
			<label id="category">카테고리</label>&nbsp;&nbsp;
			<label id="logo">로고</label>
		</div>
		<div class="ui big icon input col-lg-4" align="center">
  			<input type="text" placeholder="검색">
  			<i class="search icon"></i>
		</div>
		<div class="col col-lg-4" align="center">
			<label id="rent"><a href="#">물품등록하기</a></label>
		</div>
		
	</div>
	<br><br>
	<div class="row" id="menubar">
		<table>
			<tr>
				<td><label>전자기기</label></td>
				<td><label>취미레저</label></td>
				<td><label>패션뷰티</label></td>
				<td><label>리빙</label></td>
				<td><label>유아동</label></td>
				<td><label>반려동물</label></td>
			</tr>
		</table>
	</div>
	<!-- <hr> -->
</body>
</html>