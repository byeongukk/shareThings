package com.kh.st.product.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class productInserServlet
 */
@WebServlet("/productInsert.pd")
public class productInserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productInserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		
		/*int ctgId = request.getParameter("")*/ //카테고리게요
		
		DateFormat formatter;
		 formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			Date stDate = (Date)formatter.parse(request.getParameter("startDay"));
			Date edDate = (Date)formatter.parse(request.getParameter("endDay"));
			Date buyDate = (Date)formatter.parse(request.getParameter("buyDay"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		String content = request.getParameter("content");
		
		
		String model = request.getParameter("pmodel");
		
		int purchasePrice = Integer.parseInt(request.getParameter("purchasePrice"));
		
		String asHistory = request.getParameter("asHistory");
		
		int rentPrice = Integer.parseInt(request.getParameter("rentPrice"));
		
		int deposit = Integer.parseInt(request.getParameter("deposit"));
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
