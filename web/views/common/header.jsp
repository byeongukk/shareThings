<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<style>
	hr {
		border: 1px solid #F44A0C;
	}
	#afterLogin {
		display:none;
	}	
	.col {
		display: inline-block;
	}
	.middle>div{
		line-height:100px;
		padding: 10px;
	}
	.logoArea:hover {
		cursor:pointer;
	}
	.rentBtnArea2 {
		display:none;
	}
	#menubarArea {
		border-top: 2px solid #F44A0C;
		border-bottom: 2px solid #F44A0C;
		background: white;
	}
	.sticky {
		position:fixed;
		top:0;
		z-index:100;
	}
	.sticky + #forPadding {
		padding-top : 100px;
	}
	#submenuArea {
		font-size:70%;
		background:#F44A0C;
		border-bottom:2px solid #F44A0C;
		display:none;
	}
	
	#menubar td, #submenu td {
		height: 70px;
		width: 150px;
		vertical-align:middle;
		text-align:center;
	}
	#submenu td {
		vertical-align:top;
	}
	
	#menubar td:first-of-type, #submenu td:first-of-type {
		width: 160px;
		background: #F44A0C;
		color: white;
	}
	#menubar td:hover {
		background:#0CB6F4;
		cursor:pointer;
	}
	.category {
		margin: 0;
	}
	#submenu ul {
		list-style-type:none;
		margin:0;
		padding:0;
	}
	#submenu a {
		text-decoration:none;
		color:white;
	}
</style>
<link rel="stylesheet" type="text/css" href="/st/css/semantic.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" media="(max-width:575.98px)" href="/st/css/mobile.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/st/js/semantic.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="row top" align="right" id="beforeLogin">
		<a href="../member/loginPage.jsp">로그인</a> 
		<label>l</label> 
		<a href="../member/memberJoinPage.jsp">회원가입</a> 
		<label>l</label>
		<a href="#">고객센터</a> 
		<label>l</label> 
		<a href="/st/views/main/noticeList.jsp">공지사항</a>
		<label>l</label> 
		<a href="#">이용안내</a>
		
	</div>
	<div class="row top" align="right" id="afterLogin">
		<i class="user icon"></i>
		<a href="#">마이페이지</a> 
		<label>l</label> 
		<a href="#">장바구니</a> 
		<label>l</label>
		<a href="#">고객센터</a>
		<label>l</label> 
		<a href="/st/views/main/noticeList.jsp">공지사항</a> 
		<label>l</label> 
		<a href="#">로그아웃</a>
	</div>

	<div class="row middle" align="center">
		<div class="col col-lg-3 col-md-3 col-sm-3 col-xs-4 logoArea">
			<img src="/st/images/newLogo.PNG" id="logo" style="width:100%">
		</div>
		<div class="col col-xs-4 rentBtnArea2" align="center">
			<div class="ui button rentBtn" style="background:#F44A0C; color:white;">물품등록하기</div>
		</div>
		<div class="ui fluid action input col col-lg-6 col-sm-6 col-xs-12 searchArea">
			<input type="text" placeholder="찾는 물건이 있으신가요?" id="searchInput">
			<div class="ui button searchBtn" style="background:#0CB6F4">검색</div>
		</div>
		<div class="col col-lg-3 col-md-3 col-sm-3 rentBtnArea" align="center">
			<div class="ui button rentBtn" style="background:#F44A0C; color:white;">물품등록하기</div>
		</div>
	</div>

	<br>
	<div id="menu">
		<div class="row" id="menubarArea">
			<table id="menubar">
				<tr>
					<td><label class="category all">CATEGORY</label></td>
					<td><label class="category electronic">전자기기</label></td>
					<td><label class="category hobby">취미레저</label></td>
					<td><label class="category fashion">패션뷰티</label></td>
					<td><label class="category living">리빙</label></td>
					<td><label class="category baby">유아동</label></td>
					<td><label class="category pet">반려동물</label></td>
				</tr>
			</table>
		</div>
		<div class="row" id="submenuArea">
			<table id="submenu">
				<tr>
					<td><label>전체보기</label></td>
					<td>
						<ul>
							<li><a href="/st/views/main/productList.jsp">tv/모니터</a></li>
							<li><a href="#">영상가전</a></li>
							<li><a href="#">컴퓨터</a></li>
							<li><a href="#">태블릿/소형기기</a></li>
							<li><a href="#">프린터</a></li>
							<li><a href="#">음향가전</a></li>
							<li><a href="#">계절가전</a></li>
							<li><a href="#">주방가전</a></li>
							<li><a href="#">생활가전</a></li>
						</ul>
					</td>
					<td>
						<ul>
							<li><a href="#">카메라</a></li>
							<li><a href="#">캠핑용품</a></li>
							<li><a href="#">스키/보드용품</a></li>
							<li><a href="#">헬스용품</a></li>
							<li><a href="#">자전거용품</a></li>
							<li><a href="#">스포츠용품</a></li>
							<li><a href="#">악기</a></li>
							<li><a href="#">보드게임</a></li>
							<li><a href="#">파티용품</a></li>
						</ul>
					</td>
					<td>
						<ul>
							<li><a href="#">명품가방</a></li>
							<li><a href="#">뷰티기기</a></li>
							<li><a href="#">이벤트의류</a></li>
						</ul>
					</td>
					<td>
						<ul>
							<li><a href="#">생활용품</a></li>
							<li><a href="#">주방용품</a></li>
							<li><a href="#">욕실용품</a></li>
							<li><a href="#">건강용품</a></li>
						</ul>
					</td>
					<td>
						<ul>
							<li><a href="#">유아용품</a></li>
							<li><a href="#">카시트</a></li>
							<li><a href="#">유모차</a></li>
							<li><a href="#">유아동 가구/생활</a></li>
							<li><a href="#">아동 완구</a></li>
							<li><a href="#">아동 서적</a></li>
						</ul>
					</td>
					<td>
						<ul>
							<li><a href="#">강아지</a></li>
							<li><a href="#">고양이</a></li>
							<li><a href="#">기타 반려동물</a></li>
						</ul>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="forPadding"></div>
	<!-- <hr> -->
	
	
	<script>
		$(".category.all").parent().click(function() {
			$("#submenuArea").slideToggle();
		});
		$(".logoArea").click(function() {
			location.href="/st/views/main/main.jsp";
		});
		var menubar = document.getElementById("menu");
		var sticky = menubar.offsetTop;
		window.onscroll = function() {
			
			if(window.pageYOffset >= sticky) {
				menubar.classList.add("sticky");
			}else {
				menubar.classList.remove("sticky");
			}
		}
	</script>
</body>
</html>