package com.kh.st.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.st.board.model.service.BoardService;
import com.kh.st.board.model.vo.Attachment;
import com.kh.st.board.model.vo.Board;
import com.kh.st.common.MyFileRenamePolicy;
import com.kh.st.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertProductThumbnail
 */
@WebServlet("/insertproduct")
public class InsertProductThumbnail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProductThumbnail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		System.out.println(title);
		
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
		
			int maxSize = 1024 * 1024 * 10;
			
			//웹 서버 컨테이너 경로 추출
			String root = request
							.getSession()
							.getServletContext()
							.getRealPath("/");
			
			System.out.println("root : " + root);
			
			//파일 저장 경로 설정
			String filePath = root + "thumbnail_upload/";
			
		
			
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
			
			int result = new BoardService().insertThumbnail(b, fileList);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/selectList.tn");
			}else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(filePath + saveFiles.get(i));
					
					//true false 리턴됨
					
					System.out.println(failedFile.delete());
					
				}
				request.setAttribute("msg", "사진게시판 등록 실패!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
