package com.kh.st.rental.controller;

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
import com.kh.st.rental.model.service.RentalService;

@WebServlet("/selectFilter.rt")
public class SelectRentalFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectRentalFilterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rentalStatus = request.getParameter("rentalStatus");
		String details = request.getParameter("details");
		String filterContent = request.getParameter("filterContent");
		String sDate = request.getParameter("startDate");
		String eDate = request.getParameter("endDate");
		java.sql.Date startDate = null;
		java.sql.Date endDate = null;
		
		
		
		//날짜 처리
		if(sDate != "" && eDate != "") {
			startDate = Date.valueOf(sDate);
			endDate = Date.valueOf(eDate);
		}else {
			startDate = null;
			endDate = null;
		}
		//상세조건과 상세조건내용을 묶음
		
		
		HashMap<String,Object> detailsContent = new HashMap<>();
		detailsContent.put("details", details);
		detailsContent.put("filterContent",filterContent);
		
		//각 조건들을 묶음
		HashMap<String,Object> condition = new HashMap<>();

		condition.put("rentalStatus", rentalStatus);
		condition.put("detailsContent", detailsContent);
		condition.put("sDate", sDate);
		condition.put("eDate", eDate);
		
		System.out.println(rentalStatus);
		System.out.println(detailsContent);
		System.out.println(startDate);
		System.out.println(endDate);
		
		ArrayList<HashMap<String,Object>> list = new RentalService().selectRentalFilter(condition);
		
		/*//조회 해서 받아올 리스트
		ArrayList<HashMap<String,Object>> list = null;
		//대여상태가 전체가 아닌경우
		if(!(rentalStatus.equals("0"))) {
			 list = new RentalService().selectPStatusList(rentalStatus);
		}
		//상세조건이 전체가 아닌경우
		if(!(details.equals("0"))) {
			if(details.equals("rtNo")) {
				list = new RentalService().selectRtNoDetails(filterContent);
			} else if(details.equals("rtUserName")) {
				list = new RentalService().selectRtUserNameDetails(filterContent);	
			} else if(details.equals("model")) {
				list = new RentalService().selectModelDetails(filterContent);	
			} else if(details.equals("pno")) {
				list = new RentalService().selectPnoDetails(filterContent);	
			}
		}*/
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list, response.getWriter());
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
