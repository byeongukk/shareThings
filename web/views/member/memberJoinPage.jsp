<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스-회원가입</title>
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
	.joinArea, .checkArea {
		padding:10px 30px;
		background:whitesmoke;
		border:1px solid lightgray;
		border-radius:5px;
	}
	#joinTable td, #TnCtable td {
		padding:5px;
	}
	#joinTable tr {
		height:50px;
	}
	.telInput {
		height:30px;
	}
</style>
</head>
<body>
	<div class="leftArea col-lg-1 col-md-1">
	</div>
	<div class="pageWrapper col-lg-10 col-md-10 col-xs-12">
		<div class="header">
			<%@ include file="../common/header.jsp"%>
		</div>

		<div class="main" align="center">
			<br><br>
			<h1 class="ui center aligned icon header">
  				<i class="circular users icon"></i>
   			 	회원 가입
			</h1>
			<!-- <h2 align="center">회원 가입</h2> -->
			<br><br>
			<form id="joinForm" action="" method="post">
				<div class="row">
					<div class="col col-lg-2 col-md-2"></div>
					<div class="joinArea col col-lg-8 col-md-8" align="center">
					<br><br>
						<table id="joinTable">
							<tr>
								<td width="150px"><b>아이디 * </b></td>
								<td colspan="2">
									<div class="ui fluid input">
										<input type="text" placeholder="아이디 입력" name="userId">
									</div>
								</td>
								<td>
									<div class="ui blue button" id="idCheck" style="height:35px">중복확인</div>
								</td>
								<td width="200px">
									<div class="ui left pointing red basic label fluid">
	      								아이디를 다시 확인해주세요!
	    							</div>
								</td>
							</tr>
							<tr>
								<td><b>비밀번호 *</b></td>
								<td colspan="3">
									<div class="ui fluid input">
										<input type="password" placeholder="비밀번호 입력" name="userPwd">
									</div>
								</td>
								<td width="200px">
									<div class="ui left pointing red basic label fluid">
	      								비밀번호가 올바르지 않습니다!
	    							</div>
								</td>
							</tr>
							<tr>
								<td><b>비밀번호 재확인 *</b></td>
								<td colspan="3">
									<div class="ui fluid input">
										<input type="password" placeholder="비밀번호 재입력" name="userPwd2">
									</div>
								</td>
								<td width="200px">
									<div class="ui left pointing red basic label fluid">
	      								비밀번호를 다시 확인해주세요!
	    							</div>
								</td>
							</tr>
							<tr>
								<td><b>이름(실명) *</b></td>
								<td colspan="2">
									<div class="ui fluid input">
										<input type="text" placeholder="이름" name="userName">
									</div>
								</td>
								<td>
									<div class="ui blue button" id="idCheck" style="height:35px">본인인증</div>
								</td>
								<td width="200px">
									<div class="ui left pointing red basic label fluid">
	      								유효하지 않은 이름입니다!
	    							</div>
								</td>
							</tr>
							<tr>
								<td><b>성별 *</b></td>
								<td colspan="2">
									<input type="radio" name="gender" id="male" value="M">
									<i class="male icon"></i>
									<label for="male">남</label>&nbsp;&nbsp;&nbsp;
									<input type="radio" name="gender" id="female" value="F">
									<i class="female icon"></i>
									<label for="female">여</label>
								</td>
							</tr>
							<tr>
								<td><b>생년월일 *</b></td>
								<td width="50px">
									<select name="birthYear">
										<% for(int i = 2001; i >= 1920; i--) { %>
										<option value=<%= i %>><%= i %>년</option>
										<% } %>
									</select>
								</td>
								<td>
									<select name="birthMonth">
										<% for(int i = 1; i <= 12; i++) { %>
										<option value=<%= i %>><%= i %>월</option>
										<% } %>
									</select>
								</td>
								<td>
									<select name="birthDay">
										<% for(int i = 1; i <= 31; i++) { %>
										<option value=<%= i %>><%= i %>일</option>
										<% } %>
									</select>
								</td>
							</tr>
							<tr>
								<td><b>휴대폰 번호 *</b></td>
								<td>
									<select name="phone0">
										<option value="skt">SKT</option>
										<option value="kt">KT</option>
										<option value="lg">LG U+</option>
									</select>
								</td>
								<td>
									<div class="ui input telInput">
										<input type="text" placeholder="010" name="phone1" size="3">
									</div>
								</td>
								<td>
									<div class="ui input telInput">
										<input type="text" placeholder="0000" name="phone2" size="4">
									</div>
								</td>
								<td>
									<div class="ui input telInput">
										<input type="text" placeholder="0000" name="phone3" size="4">
									</div>
								</td>
							</tr>
							<tr>
								<td><b>비상 연락망</b></td>
								<td>
									<select name="subPhone0">
										<option value="skt">SKT</option>
										<option value="kt">KT</option>
										<option value="lg">LG U+</option>
									</select>
								</td>
								<td>
									<div class="ui input telInput">
										<input type="text" placeholder="010" name="subPhone1" size="3">
									</div>
								</td>
								<td>
									<div class="ui input telInput">
										<input type="text" placeholder="0000" name="subPhone2" size="4">
									</div>
								</td>
								<td>
									<div class="ui input telInput">
										<input type="text" placeholder="0000" name="subPhone3" size="4">
									</div>
								</td>
							</tr>
							<tr>
								<td rowspan="3"><b>주소</b></td>
								<td colspan="2">
									<div class="ui fluid input">
										<input type="text" placeholder="우편번호" name="zipCode">
									</div>
								</td>
								<td>
									<div class="ui orange button" id="idCheck" style="height:35px">주소검색</div>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<div class="ui fluid input">
										<input type="text" placeholder="기본주소" name="address1">
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<div class="ui fluid input">
										<input type="text" placeholder="상세주소" name="address2">
									</div>
								</td>
							</tr>
						</table>
					</div> <!-- end of joinArea -->
				</div> <!-- end of row -->
				<br><br>
				<div class="row">
					<div class="col col-lg-2 col-md-2"></div>
					<div class="checkArea col col-lg-8 col-md-8">
						<table id="TnCtable">
							<tr height="45px" style="border-bottom:1px solid lightgray">
								<td colspan="2">
									<input type="checkbox" name="TnC" value="checkAll" id="checkAll">
									<label for="checkAll" style="font-size:1.3em">전체 동의</label>
								</td>
							</tr>
							<tr>
								<td width="80%">
									<input type="checkbox" name="TnC" value="check1" id="check1">
									<label for="check1">이용약관(필수)</label>
								</td>
								<td width="20%">
									<div class="ui button" id="showTnC1" style="height:35px">전체보기</div>
								</td>
							</tr>
							<tr>
								<td>
									<p style="font-size:0.9em; color:gray">본 약관에는 마케팅 정보 수신에 대한 동의에 관한 
									내용이 포함되어 있으며,<br>
									회원은 언제든지 회원정보 수정에서 수신 거부로 변경할 수 있습니다.</p>
								</td>
							</tr>
							<tr>
								<td width="80%">
									<input type="checkbox" name="TnC" value="check2" id="check2">
									<label for="check2">개인정보 수집 및 이용(필수)</label>
								</td>
								<td width="20%">
									<div class="ui button" id="showTnC2" style="height:35px">전체보기</div>
								</td>
							</tr>
							<tr>
								<td width="80%">
									<input type="checkbox" name="TnC" value="check3" id="checl3">
									<label for="check3">개인정보 수집 및 이용(선택)</label>
								</td>
								<td width="20%">
									<div class="ui button" id="showTnC3" style="height:35px">전체보기</div>
								</td>
							</tr>
						</table>
					</div> <!-- end of checkArea -->
				</div> <!-- end of row -->
				<br><br><br>
			</form>
			<div class="row btnArea">
				<button class="massive ui button blue" style="width: 200px; height: 80px;" 
				onclick="join();">가입하기</button>
			</div>
			<br><br><br>
		</div> <!-- end of Main -->
		
		<div class="footer">
			<%@ include file="../common/footer.jsp"%>
		</div>
		
	</div>
	<div class="rightArea col-lg-1 col-md-1">
	</div>
	
	
	<script>
		function join() {
			$("#joinForm").submit();
		}
	</script>
</body>
</html>