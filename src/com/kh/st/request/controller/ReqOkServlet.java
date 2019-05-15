package com.kh.st.request.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.request.model.service.ReqService;

/**
 * Servlet implementation class ReqOkServlet
 */
@WebServlet("/reqOk.bo")
public class ReqOkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReqOkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		String statuses = request.getParameter("status");
		String[] status = statuses.split(",");
		
		String page = "";
		if(statuses.equals("")) {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "승인 물품을 선택하세요");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		int result = new ReqService().reqOk(status);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/reqProduct.bo");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "승인 오류");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
