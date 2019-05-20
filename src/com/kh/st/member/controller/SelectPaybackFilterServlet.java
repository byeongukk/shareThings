package com.kh.st.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.st.member.model.service.MemberService;


@WebServlet("/selectPaybackFilter.me")
public class SelectPaybackFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectPaybackFilterServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String status = request.getParameter("status");
		String startM = request.getParameter("startMoney");
		String endM = request.getParameter("endMoney");
		String startReq = request.getParameter("startReq");
		String endReq = request.getParameter("endReq");
		String startPb = request.getParameter("startPb");
		String endPb = request.getParameter("endPb");
		
		HashMap<String,Object> condition = new HashMap<String,Object>();
		
		condition.put("userId", userId);
		condition.put("status", status);
		condition.put("startM", startM);
		condition.put("endM", endM);
		condition.put("startReq", startReq);
		condition.put("endReq", endReq);
		condition.put("startPb", startPb);
		condition.put("endPb", endPb);
		
		ArrayList<HashMap<String,Object>> list = new MemberService().selectPaybackFilter(condition);
		
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
