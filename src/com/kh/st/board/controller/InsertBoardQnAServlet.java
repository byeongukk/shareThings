package com.kh.st.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.st.board.model.service.BoardService;
import com.kh.st.board.model.vo.Board;

/**
 * Servlet implementation class InsertBoardQnAServlet
 */
@WebServlet("/insertQnA.bo")
public class InsertBoardQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoardQnAServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qnaContent = request.getParameter("qnaInput");
		String qnaWriter = request.getParameter("qnaWriter");
		int parentBno = Integer.parseInt(request.getParameter("parentBno"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		Board newQnA = new Board();
		newQnA.setbContent(qnaContent);
		newQnA.setbWriter(qnaWriter);
		newQnA.setParentBno(parentBno);
		newQnA.setPno(pno);
		int result = new BoardService().insertQnA(newQnA);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		if(result > 0) {
			ArrayList<HashMap<String, Object>> qnaList = new BoardService().selectQnAList(parentBno);
			if(!qnaList.isEmpty()) {
				new Gson().toJson(qnaList, response.getWriter());
			}else {
				response.getWriter().append("List not found");
			}
		
		}else {
			response.getWriter().append("insert fail");
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
