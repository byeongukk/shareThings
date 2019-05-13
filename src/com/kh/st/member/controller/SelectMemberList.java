package com.kh.st.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.member.model.service.MemberService;
import com.kh.st.member.model.vo.Member;
import com.kh.st.member.model.vo.PageInfo;


@WebServlet("/selectList.me")
public class SelectMemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectMemberList() {
        super();
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// -----------------------------------------------  페이징 처리 (25개)  -----------------------------------------------
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 20;
		
		int listCount = new MemberService().getListCount();
		
		maxPage = (int)((double)listCount / limit + 0.95);
		
		startPage = (((int)((double)currentPage / limit + 0.95)) - 1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		// -----------------------------------------------  페이징 처리 (25개)  -----------------------------------------------
		
		ArrayList<Member> list = new MemberService().selectList(pi);
		
		String page = "";
		if(list != null) {
			page = "views/admin/member/memberList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			page = "views/admin/common/errorPage.jsp";
			request.setAttribute("msg", "회원전체 조회 실패!!!");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
