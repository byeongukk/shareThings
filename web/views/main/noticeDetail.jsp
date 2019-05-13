<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스-공지사항</title>
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
	}
	.noticeDetail tr:last-child {
		border-bottom:2px solid red;
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

			
			<div class="row noticeArea">
				<br><br>
				<h1 class="ui center aligned icon header">
					<i class="clipboard list icon"></i>
					공지사항
				</h1>
				<br><br>
				<div class="col col-lg-2 col-md-2 col-sm-1"></div>
				<div class="col col-lg-8 col-md-8 col-sm-10 col-xs-12">
					<table class="table noticeDetail">
						<tbody>
							<tr style="border-top:2px solid red; background:whitesmoke">
								<td>제목</td>
								<td colspan="5"><label>공지사항1</label></td>
							</tr>
							<tr>
								<td width="15%">작성자</td>
								<td width="25%"><span>관리자</span></td>
								<td width="10%">작성일</td>
								<td width="25%"><span>2019-05-12</span></td>
								<td width="10%">조회수</td>
								<td width="15%"><span>1</span></td>
							</tr>
							<tr>
								<td>첨부파일</td>
								<td colspan="5">첨부파일</td>
							</tr>
							<tr>
								<td colspan="6"><textarea name="content" cols="60" rows="10"
										style="resize:none; width:100%;" readOnly>내용1</textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<br>
					<div class="btnArea" align="center" style="height:50px;">
						<button class="ui left labeled icon big button">
							<i class="left arrow icon" onclick="goToPrevNotice();"></i> 이전글
						</button>
						<button class="ui red big button" onclick="goToNoticeList();">목록으로</button>
						<button class="ui right labeled icon big button">
							<i class="right arrow icon" onclick="goToNextNotice();"></i> 다음글
						</button>
					</div>
				</div>
			</div> <!-- end of noticeArea -->
			<br><br><br><br>
			
			


		</div> <!-- end of 메인바디 -->

		<!-- 푸터 -->
		<div class="footer">
			<%@ include file="../common/footer.jsp"%>
		</div>

	</div>
	<div class="rightArea col col-lg-1 col-md-1">
	</div>
	
	
	<script>
		function goToNoticeList() {
			location.href="noticeList.jsp"
		}
		function goToPrevNotice() {}
		function goToNextNotice() {}
		
	</script>
</body>
</html>








