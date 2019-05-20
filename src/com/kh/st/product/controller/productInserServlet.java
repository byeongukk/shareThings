package com.kh.st.product.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.st.attachment.model.vo.Attachment;
import com.kh.st.board.model.service.BoardService;
import com.kh.st.board.model.vo.Board;
import com.kh.st.common.MyFileRenamePolicy;
import com.kh.st.member.model.vo.Member;
import com.kh.st.product.model.service.ProductService;
import com.kh.st.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

import oracle.sql.DATE;

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
		
		System.out.println(title);
		
		/*int ctgId = request.getParameter("")*/ //카테고리게요
		
		DateFormat formatter;
		 formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		/*try {
			Date stDate = (Date)formatter.parse(request.getParameter("startDay"));
			Date edDate = (Date)formatter.parse(request.getParameter("endDay"));
			Date buyDate = (Date)formatter.parse(request.getParameter("buyDay"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		 
		 Date stDate = Date.valueOf((request.getParameter("startDay")));
		 Date edDate = Date.valueOf((request.getParameter("endDay")));
		 Date buyDate = Date.valueOf((request.getParameter("buyDay")));
		
		String content = request.getParameter("content");
		String phone = request.getParameter("hp1");
		String phone2 = request.getParameter("em1");
		String zipCode = request.getParameter("zipNo");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address = zipCode + "|" + address1 + "|" + address2;
		String model = request.getParameter("pmodel");
		int purchasePrice = Integer.parseInt(request.getParameter("purchasePrice"));
		String asHistory = request.getParameter("asHistory");
		int rentPrice = Integer.parseInt(request.getParameter("rentPrice"));
		int ctgId = Integer.parseInt(request.getParameter("ctgId"));		
		int deposit = Integer.parseInt(request.getParameter("deposit"));
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		Product p = new Product();
		p.setUno(loginUser.getUno());
		p.setpStartDate(stDate);
		p.setpEndDate(edDate);
		p.setPrice(rentPrice);
		p.setDeposite(deposit);
		p.setModel(model);
		p.setCtgId(ctgId);
		p.setPurchaseDate(buyDate);
		p.setPurchasePrice(purchasePrice);
		p.setAsHistory(asHistory);
		
		
		int result = new ProductService().productInsert(p);
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
	         //System.out.println("multipart로 request 요청");
	         //전송 파일 용량 제한 : 10Mbyte로 제한
	         int maxSize = 1024 * 1024 * 10;
	         
	         //웹 서버 컨테이너 경로 추출
	         String root = request
	                     .getSession()
	                     .getServletContext()
	                     .getRealPath("/");
	         
	         System.out.println("root : " + root);
	         
	         //파일 저장 경로 설정
	         String filePath = root + "thumbnail_upload/";
	         
	         //객체를 생성할 때 부터 파일을 저장하고 그에 대한 정보를 가져오는 형태이다.
	         //즉 파일의 정보를 검사하여 저장하는 형태가 아닌,
	         //저장한 다음 검사 후 삭제를 해야 한다.
	         
	         //사용자가 올린 파일명을 그대로 저장하지 않는 것이 일반적이다.
	         //1. 같은 파일명이 있는 경우 이전 파일을 덮어 쓸 수 있다.
	         //2. 한글로된 파일명, 특수기호, 띄어쓰기 등은 서버에 따라 문제가 생길 수 도 있다.
	         //DefaultFileRenamePolicy는 cos.jar 안에 존재하는 클래스로
	         //같은 파일명이 존재하는지를 검사하고 있을 경우에는 파일명 뒤에 숫자를 붙여준다.
	         //ex : aaa.zip, aaa1.zip, aaa2.zip, ....
	         /*MultipartRequest multiRequest =
	               new MultipartRequest(request, filePath, maxSize, 
	                     "UTF-8", new DefaultFileRenamePolicy());
	         */
	         
	         MultipartRequest multiRequest 
	            = new MultipartRequest(request, filePath, maxSize,
	                     "UTF-8", new MyFileRenamePolicy());
	         
	         //저정한 파일(변경된)의 이름을 저장할 arrayList 생성
	         ArrayList<String> saveFiles = new ArrayList<String>();
	         //원본 파일 이름을 저장할 arrayList 생성
	         ArrayList<String> originFiles = new ArrayList<String>();
	         
	         Enumeration<String> files = multiRequest.getFileNames();
	         
	         while(files.hasMoreElements()) {
	            String name = files.nextElement();
	            
	            System.out.println("name : " + name);
	            
	            saveFiles.add(multiRequest.getFilesystemName(name));
	            originFiles.add(multiRequest.getOriginalFileName(name));
	            
	            System.out.println("fileSystem name : " 
	                           + multiRequest.getFilesystemName(name));
	            System.out.println("originFile : " 
	                           + multiRequest.getOriginalFileName(name));
	         }
	         
	         String multiTitle = multiRequest.getParameter("title");
	         String multiContent = multiRequest.getParameter("content");
	         
	         System.out.println("multiTitle : " + multiTitle);
	         System.out.println("multiContent : " + multiContent);
	         
	         //Board객체 생성
	         Board b = new Board();
	         b.setbTitle(multiTitle);
	         b.setbContent(multiContent);
	         b.setbWriter(String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUno()));
	         
	         ArrayList<Attachment> fileList = new ArrayList<Attachment>();
	         for(int i = originFiles.size() - 1; i >= 0; i--) {
	            Attachment at = new Attachment();
	            at.setFilePath(filePath);
	            at.setOriginName(originFiles.get(i));
	            at.setChangeName(saveFiles.get(i));
	            
	            fileList.add(at);
	         }
	         
	         int bresult = new BoardService().insertProductBoard(b, fileList);
	         
	         if(bresult > 0) {
	            response.sendRedirect(request.getContextPath() + "/selectList.tn");
	         }else {
	            for(int i = 0; i < saveFiles.size(); i++) {
	               File failedFile = new File(filePath + saveFiles.get(i));
	               
	               //true false 리턴됨
	               
	               System.out.println(failedFile.delete());
	               
	            }
	            request.setAttribute("msg", "물품등록게시판 등록 실패!");
	            request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	         }
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
