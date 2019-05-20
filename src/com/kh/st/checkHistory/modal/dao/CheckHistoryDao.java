package com.kh.st.checkHistory.modal.dao;

import static com.kh.st.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.st.attachment.model.vo.Attachment;
import com.kh.st.checkHistory.modal.vo.CheckHistory;

public class CheckHistoryDao {
	private Properties prop = new Properties();
	
	public CheckHistoryDao() {
		String fileName = CheckHistory
							.class
							.getResource("/sql/checkHistory/checkHistory-query.properties")
							.getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//검수 내용 등록 메소드
	public int insertCheckContent(Connection con, CheckHistory ch, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCheckContent");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ch.getPno());	//물품번호
			pstmt.setString(2, ch.getChkContent());	//검수 내용
			pstmt.setString(3, fileList.get(0).getFilePath());
			pstmt.setString(4, ch.getChecker());	//검수자 회원 번호
			pstmt.setInt(5, ch.getPno());	//물품번호
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//검수번호 가져오기
	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int chkNo = 0;
		
		String query = prop.getProperty("selectCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				chkNo = rset.getInt("currval");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return chkNo;
	}
	
	//물품 상태 업데이트(검수 불통과)
	public int updateRejectSid(Connection con, CheckHistory ch) {
		PreparedStatement pstmt = null;
		String ha = "하";
		int result = 0;
		
		String query = prop.getProperty("updateRejectSid");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ha);
			pstmt.setInt(2, ch.getPno());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//배송테이블 인서트
	public int updateRejectDelivery(Connection con, CheckHistory ch, String multiDelivery, String multiDno) {
		PreparedStatement pstmt = null;
		int result = 0;
		String reg = "등록";
		String out = "출고";
		
		String query = prop.getProperty("updateRejectDelivery");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, multiDno);	//송장번호
			pstmt.setString(2, multiDelivery);	//택배사
			pstmt.setString(3, reg);	//등록
			pstmt.setInt(4, ch.getPno());	//요청번호
			pstmt.setString(5, out);	//출고
			pstmt.setInt(6, ch.getPno());	//요청번호
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	//이미지 인서트
	public int insertChkImg(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertChkImg");
		try {
			//원본, 수정, 경로, 구분, 검수번호
			for(int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				pstmt.setInt(4, fileList.get(i).getChkNo());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateConfirmSid(Connection con, CheckHistory ch) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateConfirmSid");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ch.getStatus());
			pstmt.setInt(2, ch.getPno());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public HashMap<String, Object> confirmProductDetail(Connection con, int reqNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		Attachment at = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("confirmProductImg");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reqNum);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();
			hmap = new HashMap<String, Object>();
			
			while(rset.next()) {
				at = new Attachment();
				at.setChangeName(rset.getString("CHANGE_NAME"));
				
				hmap.put("condition", rset.getString("CONDITION"));
				hmap.put("chkContent", rset.getString("CHK_CONTENT"));
				
				list.add(at);
			}
			hmap.put("confirmList", list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return hmap;
	}
}
