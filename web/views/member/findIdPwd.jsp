<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스-아이디찾기</title>
<style>
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
	
	.findTabs {
    	display: inline-block !important;
    	
	}
	.findTabs>li {
		width:200px;
	}
	.findIdTable tr, .findPwdTable tr {
		height:50px;
	}
	.findIdTable td, .findPwdTable td {
		padding:5px;
	}
	.tab-content {
		width:370px;
	}
</style>
</head>
<body>
	<div class="leftArea col col-lg-1 col-md-1">
	</div>
	<div class="pageWrapper col col-lg-10 col-md-10 col-xs-12">
		<div class="header">
			<%@ include file="../common/header.jsp"%>
		</div>

		<div class="main" align="center">
			<br><br>
			<h1 class="ui center aligned icon header">
  				<i class="id card icon"></i>
   			 	아이디/비밀번호 찾기
			</h1>
			<br><br>
			<!-- <h2 align="center">회원 로그인</h2> -->
			<div id="findArea">
			
				<ul class="nav nav-tabs findTabs">
					<li class="active"><a data-toggle="tab" href="#findIdTab">아이디 찾기</a></li>
					<li><a data-toggle="tab" href="#findPwdTab">비밀번호 찾기</a></li>
				</ul>
				<br><br>
				
				<div class="tab-content">
					<div id="findIdTab" class="tab-pane fade in active" align="center">
						<form action="" method="post">
							<table class="findIdTable">
								<caption style="font-size:1.5em; ">
									<i class="mobile alternate icon"></i>
									등록된 휴대폰 번호로 찾기
								</caption>
								<tr style="margin-top:10px;">
									<td width="25%"><b>이름</b></td>
									<td colspan="2">
										<div class="ui fluid input">
											<input type="text" placeholder="이름" name="userName">
										</div>
									</td>
								</tr>
								<tr>
									<td><b>휴대폰 번호</b></td>
									<td>
										<div class="ui fluid input">
											<input type="text" placeholder="-없이 입력" name="phone">
										</div>
									</td>
									<td width="25%">
										<div class="ui fulid orange button" id="sendIdFindText">인증번호 발송</div>
									</td>
								</tr>
								<tr>
									<td><b>인증번호 </b></td>
									<td colspan="2">
										<div class="ui fluid input">
											<input type="text" placeholder="인증번호 입력" name="verify">
										</div>
									</td>
								</tr>
							</table>
							<div>
								<label style="font-size:0.7em;">입력하신 번호로 인증번호가 전송되었습니다. (남은시간 : </label>
								<label> 5:00 </label>
								<label style="font-size:0.7em;">)</label><br><br><br>
								<button class="ui massive blue button">확인</button>
							</div>
						</form>
						
						
						<hr>
						
						<form action="" method="post">
							<table class="findIdTable">
								<caption style="font-size:1.5em; ">
									<i class="envelope open outline icon"></i>
									
									등록된 이메일 주소로 찾기
								</caption>
								<tr style="margin-top:10px;">
									<td width="25%"><b>이름</b></td>
									<td colspan="2">
										<div class="ui fluid input">
											<input type="text" placeholder="이름" name="userName">
										</div>
									</td>
								</tr>
								<tr>
									<td><b>이메일 주소</b></td>
									<td>
										<div class="ui fluid input">
											<input type="text" placeholder="이메일 주소입력" name="email">
										</div>
									</td>
									<td width="25%">
										<div class="ui fulid orange button" id="sendIdFindEmail">인증메일 발송</div>
									</td>
								</tr>
								<tr>
									<td><b>인증번호 </b></td>
									<td colspan="2">
										<div class="ui fluid input">
											<input type="text" placeholder="인증번호 입력" name="verify">
										</div>
									</td>
								</tr>
							</table>
							<div>
								<label style="font-size:0.7em;">입력하신 이메일로 인증번호가 전송되었습니다. (남은시간 : </label>
								<label> 5:00 </label>
								<label style="font-size:0.7em;">)</label><br><br><br>
								<button type="submit" class="ui massive blue button">확인</button>
							</div>
						</form>
						
						
						
					</div>
					
					<div id="findPwdTab" class="tab-pane fade" align="center">
						<form action="" method="post">
							<table class="findPwdTable">
								<caption style="font-size:1.5em; ">
									<i class="mobile alternate icon"></i>
									등록된 휴대폰 번호로 찾기
								</caption>
								<tr style="margin-top:10px;">
									<td width="25%"><b>아이디</b></td>
									<td colspan="2">
										<div class="ui fluid input">
											<input type="text" placeholder="ID" name="userId">
										</div>
									</td>
								</tr>
								<tr>
									<td><b>휴대폰 번호</b></td>
									<td>
										<div class="ui fluid input">
											<input type="text" placeholder="-없이 입력" name="phone">
										</div>
									</td>
									<td width="25%">
										<div class="ui fulid orange button" id="sendPwdFindText">인증번호 발송</div>
									</td>
								</tr>
								<tr>
									<td><b>인증번호 </b></td>
									<td colspan="2">
										<div class="ui fluid input">
											<input type="text" placeholder="인증번호 입력" name="verify">
										</div>
									</td>
								</tr>
							</table>
							<div>
								<label style="font-size:0.7em;">입력하신 번호로 인증번호가 전송되었습니다. (남은시간 : </label>
								<label> 5:00 </label>
								<label style="font-size:0.7em;">)</label><br><br><br>
								<button class="ui massive blue button">확인</button>
							</div>
						</form>
						
						
						<hr>
						
						<form action="" method="post">
							<table class="findPwdTable">
								<caption style="font-size:1.5em; ">
									<i class="envelope open outline icon"></i>
									등록된 이메일 주소로 찾기
								</caption>
								<tr style="margin-top:10px;">
									<td width="25%"><b>아이디</b></td>
									<td colspan="2">
										<div class="ui fluid input">
											<input type="text" placeholder="ID" name="userId">
										</div>
									</td>
								</tr>
								<tr>
									<td><b>이메일 주소</b></td>
									<td>
										<div class="ui fluid input">
											<input type="text" placeholder="이메일 주소입력" name="email">
										</div>
									</td>
									<td width="25%">
										<div class="ui fulid orange button" id="sendPwdFindEmail">인증메일 발송</div>
									</td>
								</tr>
								<tr>
									<td><b>인증번호 </b></td>
									<td colspan="2">
										<div class="ui fluid input">
											<input type="text" placeholder="인증번호 입력" name="verify">
										</div>
									</td>
								</tr>
							</table>
							<div>
								<label style="font-size:0.7em;">입력하신 이메일로 인증번호가 전송되었습니다. (남은시간 : </label>
								<label> 5:00 </label>
								<label style="font-size:0.7em;">)</label><br><br><br>
								<button type="submit" class="ui massive blue button">확인</button>
							</div>
						</form>
					</div>
						
				</div>
			
			
			</div>
			<br><br><br>
		</div>
		<div class="footer">
			<%@ include file="../common/footer.jsp"%>
		</div>
		
	</div>
	<div class="rightArea col col-lg-1 col-md-1">
	</div>
	
	
	<script>
		$("#sendIdFindText").click(function() {});
		$("#sendIdFindEmail").click(function() {});
		$("#sendPwdFindText").click(function() {});
		$("#sendPwdFindEmail").click(function() {});
	</script>
</body>
</html>