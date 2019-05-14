<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->

      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath()%>/views/admin/adminMain.jsp">

        <div class="sidebar-brand-icon rotate-n-15">
          <img src="<%= request.getContextPath() %>/resource/img/adminLogo1.png">
        </div>
        <div class="sidebar-brand-text mx-3">Share Things</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- 대쉬보드 영역 -->
      <!-- <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>-->

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
		등록 / 대여 관리
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <img src="<%=request.getContextPath()%>/resource/img/input.png">
          <span>등록관리</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">

            <a class="collapse-item" href="<%= request.getContextPath() %>/reqProduct.bo">등록 요청 관리</a>
            <a class="collapse-item" href="<%= request.getContextPath() %>/views/admin/request/reqData.jsp">등록현황</a>
            <a class="collapse-item" href="<%= request.getContextPath() %>/views/admin/request/returnProduct.jsp">반품현황</a>

          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <img src="<%=request.getContextPath()%>/resource/img/output.png">
          <span>대여관리</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">

            <a class="collapse-item" href="<%= request.getContextPath() %>/selectRantalList.pd">대여관리</a>
            <a class="collapse-item" href="<%= request.getContextPath() %>/views/admin/rental/sendManagement.jsp">발송관리</a>
            <a class="collapse-item" href="<%= request.getContextPath() %>/views/admin/rental/sendList.jsp">배송조회</a>
            <a class="collapse-item" href="<%= request.getContextPath() %>/views/admin/rental/returnReqList.jsp">반품요청관리</a>
            <a class="collapse-item" href="<%= request.getContextPath() %>/views/admin/rental/returnProductManagement.jsp">수거관리</a>

          </div>
        </div>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
          <img src="<%=request.getContextPath()%>/resource/img/check.png">
          <span>물품관리</span>
        </a>
        <div id="collapseThree" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">

            <a class="collapse-item" href="<%= request.getContextPath() %>/views/admin/product/productList.jsp">물품조회</a>
            <a class="collapse-item" href="<%= request.getContextPath() %>/views/admin/product/checkStandard.jsp">검수기준</a>
            <a class="collapse-item" href="<%= request.getContextPath() %>/views/admin/product/check.jsp">검수관리</a>

          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
		게시판관리
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">

        <a class="nav-link collapsed" href="<%= request.getContextPath() %>/views/admin/notice/noticeList.jsp">

          <img src="<%=request.getContextPath()%>/resource/img/notice.png">
          <span>공지사항 관리</span>
        </a>
      </li>

      <!-- Nav Item - Charts -->
      <li class="nav-item">

        <a class="nav-link" href="<%=request.getContextPath()%>/views/admin/notice/qnaList.jsp">
          <img src="<%=request.getContextPath()%>/resource/img/qna.png">

          <span>1:1문의 관리</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">

        <a class="nav-link" href="<%=request.getContextPath()%>/views/admin/notice/faqList.jsp">

          <img src="<%=request.getContextPath()%>/resource/img/lotqna.png">
          <span>자주 묻는 질문 관리</span></a>
      </li>
      
       <!-- 구분선 -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
		회원관리
      </div>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUser" aria-expanded="true" aria-controls="collapseUser">
          <img src="<%=request.getContextPath()%>/resource/img/member.png">
          <span>회원관리</span>
        </a>
        <div id="collapseUser" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">

            <a class="collapse-item" href="<%=request.getContextPath()%>/selectList.me">회원정보관리</a>
            <a class="collapse-item" href="<%=request.getContextPath()%>/selectMlevelList.me">회원등급관리</a>
            <a class="collapse-item" href="<%=request.getContextPath()%>/selectReportList.me">신고이력관리</a>

          </div>
        </div>
      </li>
      
       <!-- 구분선 -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
		정산 / 매출 관리
      </div>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUserM" aria-expanded="true" aria-controls="collapseUserM">
          <img src="<%=request.getContextPath()%>/resource/img/memberM.png">
          <span>회원 정산</span>
        </a>
        <div id="collapseUserM" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">

            <a class="collapse-item" href="<%=request.getContextPath()%>/views/admin/money/depositMember.jsp">수익금 환급</a>
            <a class="collapse-item" href="<%=request.getContextPath()%>/views/admin/money/refundMember.jsp">회원 환불</a>

          </div>
        </div>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSTM" aria-expanded="true" aria-controls="collapseSTM">
          <img src="<%=request.getContextPath()%>/resource/img/stM.png">
          <span>기업 매출</span>
        </a>
        <div id="collapseSTM" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">

            <a class="collapse-item" href="<%=request.getContextPath()%>/views/admin/money/salesST.jsp">매출현황</a>
          </div>
        </div>
      </li>
      
      <!-- 구분선 -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
		통계
      </div>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsestat" aria-expanded="true" aria-controls="collapsestat">
          <img src="<%=request.getContextPath()%>/resource/img/stat.png">
          <span>통계</span>
        </a>
        <div id="collapsestat" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<%=request.getContextPath()%>/views/admin/stat/statMember.jsp">회원통계</a>
            <a class="collapse-item" href="<%=request.getContextPath()%>/views/admin/stat/statST.jsp">매출통계</a>

          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
</body>
</html>