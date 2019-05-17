package com.kh.st.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.st.member.model.service.MemberService;


@WebServlet("/selectMemberFilter.me")
public class SelectMemberFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectMemberFilterServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userLv = request.getParameter("userLv");
		String status = request.getParameter("userStatus");
		String sDate = request.getParameter("startDate");
		String eDate = request.getParameter("endDate");
		
		
		System.out.println(userId);
		System.out.println(userName);
		System.out.println(userLv);
		System.out.println(status);
		System.out.println(sDate);
		System.out.println(eDate);
		HashMap<String,Object> condition = new HashMap<String,Object>();
		
		condition.put("userId", userId);
		condition.put("userName", userName); 
		condition.put("userLv", userLv);
		condition.put("status", status);
		condition.put("startDate", sDate);
		condition.put("endDate", eDate);
		
		ArrayList<HashMap<String,Object>> list = new MemberService().selectMemberFilter(condition);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		if(list != null) {
			new Gson().toJson(list, response.getWriter());
		}else {
			request.setAttribute("msg", "필터 조회 실패!!");
			request.getRequestDispatcher("views/admin/common/errorPage.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}



























