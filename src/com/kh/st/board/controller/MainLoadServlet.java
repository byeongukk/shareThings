package com.kh.st.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.board.model.service.BoardService;
import com.kh.st.notice.model.service.NoticeService;
import com.kh.st.notice.model.vo.Notice;

/**
 * Servlet implementation class MainLoadServlet
 */
@WebServlet("/mainLoad.bo")
public class MainLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainLoadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<HashMap<String, Object>> top5List = new BoardService().getTop5List(); 
		ArrayList<Notice> notice5List = new NoticeService().getNotice5List();
		String page = "";
		if(!top5List.isEmpty() && !notice5List.isEmpty()) {
			page = "views/main/main.jsp";
			request.setAttribute("top5List", top5List);
			request.setAttribute("notice5List", notice5List);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "메인페이지 로드 실패..!");
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
