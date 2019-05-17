package com.kh.st.board.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.board.model.service.BoardService;

/**
 * Servlet implementation class BoardFilterServlet
 */
@WebServlet("/filter.bo")
public class BoardFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFilterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ctgLv2 = request.getParameter("ctgLv2");
		String[] ctgLv3Arr = request.getParameterValues("ctgLv3Arr");
		String start = request.getParameter("start");
		Date startDate = null;
		if(!start.equals("")) {
			String[] startArr = start.split("/");
			startDate = new Date(new GregorianCalendar(Integer.parseInt(startArr[2]), 
					Integer.parseInt(startArr[0]), Integer.parseInt(startArr[1])).getTimeInMillis());
		}
		String end = request.getParameter("end");
		Date endDate = null;
		if(!end.equals("")) {
			String[] endArr = start.split("/");
			endDate = new Date(new GregorianCalendar(Integer.parseInt(endArr[2]), 
					Integer.parseInt(endArr[0]), Integer.parseInt(endArr[1])).getTimeInMillis());
		}
		String priceRange = request.getParameter("priceRange");
		int minPrice = Integer.parseInt(priceRange.substring(0, priceRange.indexOf("원")));
		int maxPrice = Integer.parseInt(priceRange.substring(priceRange.indexOf("-") + 1, priceRange.length() - 1));
		String orderBy = request.getParameter("orderBy");
		
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(minPrice);
		System.out.println(maxPrice);
		System.out.println(orderBy);
		
		HashMap<String, Object> filterMap = new HashMap<String, Object>();
		filterMap.put("ctgLv2", ctgLv2);
		filterMap.put("ctgLv3Arr", ctgLv3Arr);
		filterMap.put("startDate", startDate);
		filterMap.put("endDate", endDate);
		filterMap.put("minPrice", minPrice);
		filterMap.put("maxPrice", maxPrice);
		filterMap.put("orderBy", orderBy);
		
		ArrayList<HashMap<String, Object>> bList = new BoardService().selectFilterList(filterMap);
		String page = "";
		
		
		if(!bList.isEmpty()) {
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상품 리스트 페이지 불러오기 실패..");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
