package com.kh.st.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.member.model.service.MemberService;

/**
 * Servlet implementation class MemberEmailCheckServlet
 */
@WebServlet("/emailVerif.me")
public class MemberEmailVerifServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEmailVerifServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = (String)request.getSession().getAttribute("loginUser");
		int result = new MemberService().setEmailChecked(userId);
		String page = "";
		if(result > 0) {
			response.getWriter().print("<script>alert('감사합니다! 이제 서비스 이용이 가능합니다.')<script>");
			response.sendRedirect("views/main/main.jsp");
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "인증결과 전송에 실패했습니다..!");
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
