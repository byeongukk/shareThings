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
import com.kh.st.common.PageInfo;

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

	////ajax페이징 처리 개수
	public int getConfirmFilterCount(Connection con, HashMap<String, Object> condition) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		ArrayList<String> queryArr = new ArrayList<String>();
		ArrayList<Object> bindVal = new ArrayList<Object>();
		String query = null;
		boolean allViewsChk = false;
		
		String bType = "등록";
		
		//조건에 따른 query문 가져오기
				HashMap<String, Object> detailsContent = (HashMap<String, Object>) condition.get("detailsContent");
				
				if(condition.get("okStatus").equals("0") &&
						detailsContent.get("details").equals("0") &&
						condition.get("startD").equals("")) {
					allViewsChk = true;
					queryArr.add(" 1 = ? ");
					bindVal.add("1");
					System.out.println("전체조회");
				} else {
					//조건 검색
					//승인상태가 전체가 아닐때
					if(!(condition.get("okStatus").equals("0"))) {
						queryArr.add(" PS.SID = ? ");
						bindVal.add(condition.get("okStatus"));
					}
					//상세조건이 전체가 아닐때
					if(!(detailsContent.get("details").equals("0"))) {
						
						//상세조건 별 쿼리문
						if(detailsContent.get("details").equals("reqNo")) {
							queryArr.add(" R.REQP_NO = ? ");
						} else if(detailsContent.get("details").equals("name")) {
							queryArr.add(" M.USER_NAME = ? ");
						} else if(detailsContent.get("details").equals("reqName")) {
							queryArr.add(" PC.CTG_NAME = ? ");
						}
						bindVal.add(detailsContent.get("filterContent"));
					}
					//날짜값 있을 경우
					if(!(condition).get("startD").equals("")) {
						//날짜 2개 비교 인덱스 맞추기
						queryArr.add(" P.PSTART_DATE BETWEEN ? ");
						queryArr.add(" ? ");
						bindVal.add(condition.get("startD"));
						bindVal.add(condition.get("endD"));
						System.out.println(condition.get("startD"));
					}
				}
		
		query = prop.getProperty("confirmFilterCount");
		
		if(allViewsChk == false) {
			//추가된 쿼리만큼 더하기
			for(int i = 0; i < queryArr.size(); i++) {
				if(i==queryArr.size() - 1) {
					query += queryArr.get(i) + ")";
				} else {
					query += queryArr.get(i) + " AND ";
				}
			}
		} else {
			//전제조회 쿼리
			query += queryArr.get(0) + ")";
		}
		//등록 요청 상태, 요청번호 순으로 내림차순
		query += " ORDER BY STATUS, REQP_NO";
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bType);
			for(int i = 0; i < bindVal.size(); i++) {
				pstmt.setObject(i+2, bindVal.get(i));
			}
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return listCount;
	}

	//조건 검색
	public ArrayList<HashMap<String, Object>> selectConfirmFilter(Connection con, 
			HashMap<String, Object> condition,
			PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		ArrayList<HashMap<String, Object>> list = null;
		String query = null;
		
		ArrayList<String> queryArr = new ArrayList<String>();
		ArrayList<Object> bindVal = new ArrayList<Object>();
		ArrayList<String> rnumArr = new ArrayList<String>();
		ArrayList<Object> rnumVal = new ArrayList<Object>();
		boolean allViewsChk = false;
		
		String bType = "등록";
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		//조건에 따른 query문 가져오기
		HashMap<String, Object> detailsContent = (HashMap<String, Object>) condition.get("detailsContent");
		
		//전체조회
		if(condition.get("okStatus").equals("0") &&
				detailsContent.get("details").equals("0") &&
				condition.get("startD").equals("")) {
			allViewsChk = true;
			queryArr.add(" 1 = ?)) ");
			bindVal.add("1");
			rnumArr.add(" WHERE RNUM BETWEEN ? ");
			rnumArr.add(" AND ? ");
			rnumVal.add(startRow);
			rnumVal.add(endRow);
			System.out.println("전체조회");
		} else {
			//조건 검색
			//승인상태가 전체가 아닐때
			if(!(condition.get("okStatus").equals("0"))) {
				queryArr.add(" PS.SID = ? ");
				bindVal.add(condition.get("okStatus"));
			}
			//상세조건이 전체가 아닐때
			if(!(detailsContent.get("details").equals("0"))) {
				
				//상세조건 별 쿼리문
				if(detailsContent.get("details").equals("reqNo")) {
					queryArr.add(" R.REQP_NO = ? ");
				} else if(detailsContent.get("details").equals("name")) {
					queryArr.add(" M.USER_NAME = ? ");
				} else if(detailsContent.get("details").equals("reqName")) {
					queryArr.add(" PC.CTG_NAME = ? ");
				}
				bindVal.add(detailsContent.get("filterContent"));
			}
			//날짜값 있을 경우
			if(!(condition).get("startD").equals("")) {
				//날짜 2개 비교 인덱스 맞추기
				queryArr.add(" P.PSTART_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startD"));
				bindVal.add(condition.get("endD"));
				System.out.println(condition.get("startD"));
			}
			
			rnumArr.add(" WHERE RNUM BETWEEN ? ");
			rnumArr.add(" AND ? ");
			rnumVal.add(startRow);
			rnumVal.add(endRow);
		}
		
		query = prop.getProperty("selectConfirmFilter");
		
		if(allViewsChk == false) {
			//추가된 쿼리만큼 더하기
			for(int i = 0; i < queryArr.size(); i++) {
				if(i==queryArr.size() - 1) {
					query += queryArr.get(i) + "))";
					
				} else {
					query += queryArr.get(i) + "AND ";
				}
			}
		} else {
			//전제조회 쿼리
			query += queryArr.get(0);
		}
		for(int i = 0; i < rnumArr.size(); i++) {
			query += rnumArr.get(i);
		}
		
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bType);
			//반다온값으로 바인드값 보내기
			for(int i = 0; i < bindVal.size(); i++) {
				pstmt.setObject(i+2, bindVal.get(i));
			}
			for(int i = 0; i < rnumVal.size(); i++) {
				pstmt.setObject(bindVal.size() + (i + 2), rnumVal.get(i));
			}
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("reqNo", rset.getInt("REQP_NO"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("ctgName", rset.getString("CTG_NAME"));
				hmap.put("bTitle", rset.getString("BTITLE"));
				hmap.put("status", rset.getString("STATUS"));
				hmap.put("bNo", rset.getInt("BNO"));
				hmap.put("reqD", rset.getDate("REQP_DATE"));
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
}
