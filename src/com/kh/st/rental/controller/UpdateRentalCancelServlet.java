package com.kh.st.rental.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.rental.model.service.RentalService;

/**
 * Servlet implementation class UpdateRentalCancelServlet
 */
@WebServlet("/cancle.rt")
public class UpdateRentalCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateRentalCancelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String textResult = request.getParameter("textResult");
		String rtNos = request.getParameter("rtNos");
		String[] rtNo = rtNos.split(",");
		String pnos = request.getParameter("pnos");
		String[] pno = rtNos.split(",");
	
		int result = new RentalService().updateCancel(rtNo,pno,textResult);
		
		String page = "";
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectShpMngList.rt");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "거절 오류");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
