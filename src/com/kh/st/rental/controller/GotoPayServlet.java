package com.kh.st.rental.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GotoPayServlet
 */
@WebServlet("/gopay.rt")
public class GotoPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GotoPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String st = request.getParameter("st");
		String end = request.getParameter("end");
		int pno = Integer.parseInt(request.getParameter("pno"));
		String[] stArr = st.split("-");
		Date rtStartDate = null;
		for(int i = 0; i < stArr.length; i++) {
			rtStartDate = new Date(new GregorianCalendar(Integer.parseInt(stArr[0]), Integer.parseInt(stArr[1]) - 1,
				Integer.parseInt(stArr[2])).getTimeInMillis());
		
		}
		String[] endArr = end.split("-");
		Date rtEndDate = null;
		for(int i = 0; i < stArr.length; i++) {
			rtEndDate = new Date(new GregorianCalendar(Integer.parseInt(endArr[0]), Integer.parseInt(endArr[1]) - 1,
				Integer.parseInt(endArr[2])).getTimeInMillis());
		
		}
		request.setAttribute("rtStartDate", rtStartDate);
		request.setAttribute("rtEndDate", rtEndDate);
		request.setAttribute("pno", pno);
		request.getRequestDispatcher("views/product/pay.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
