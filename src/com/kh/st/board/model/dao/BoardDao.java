package com.kh.st.board.model.dao;

import static com.kh.st.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.st.attachment.model.vo.Attachment;
import com.kh.st.board.model.vo.Board;

public class BoardDao {

	private Properties prop = new Properties();
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//중분류 카테고리로 하위 물품 리스트 불러오기
	public ArrayList<HashMap<String, Object>> selectList(Connection con, String ctgLv2) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> bList = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ctgLv2);
			pstmt.setString(2,"등록");
			rset = pstmt.executeQuery();
			
			bList = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("bno", rset.getInt("BNO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("bTitle", rset.getString("BTITLE"));
				hmap.put("bWriter", rset.getString("USER_NAME"));
				hmap.put("bCount", rset.getInt("BCOUNT"));
				hmap.put("bDate", rset.getDate("BDATE"));
				hmap.put("reviewStar", rset.getInt("REVIEW_STAR"));
				hmap.put("ano", rset.getInt("ANO"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("deposit", rset.getInt("DEPOSIT"));
				hmap.put("rtCount", rset.getInt("RTCOUNT"));
				hmap.put("rvCount", rset.getInt("RVCOUNT"));
				hmap.put("rvStar", rset.getInt("RVSTAR"));
				bList.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return bList;
	}
	
	//물품 게시판 필터 적용시 물품 리스트 불러오기
	public ArrayList<HashMap<String, Object>> selectFilterList(Connection con, HashMap<String, Object> filterMap) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> bList = null;
		HashMap<String, Object> hmap = null;
		String query = "";
		
		String ctgLv3Str = (String)filterMap.get("ctgLv3Str");
		String[] ctgLv3Arr = ctgLv3Str.split(",");
		for(int i = 0; i < ctgLv3Arr.length; i++) {
			if(i != ctgLv3Arr.length - 1) {
				if(filterMap.get("startDate") != null && filterMap.get("endDate") != null) {
					query += prop.getProperty("selectFilter") + " UNION ";
				}else {
					query += prop.getProperty("selectFilterNoDate") + " UNION ";
				}
			}else {
				if(filterMap.get("startDate") != null && filterMap.get("endDate") != null) {
					query += prop.getProperty("selectFilter");
				}else {
					query += prop.getProperty("selectFilterNoDate");
				}
			}
		}
		String orderBy = "";
		if(filterMap.get("orderBy").equals("recent")) {
			orderBy = "BDATE DESC";
		}else if(filterMap.get("orderBy").equals("popular")) {
			orderBy = "RTCOUNT DESC, BDATE DESC";
		}else if(filterMap.get("orderBy").equals("review")) {
			orderBy = "RVSTAR DESC, BDATE DESC";
		}else if(filterMap.get("orderBy").equals("priceAsc")) {
			orderBy = "PRICE ASC, BDATE DESC";
		}else if(filterMap.get("orderBy").equals("priceDesc")) {
			orderBy = "PRICE DESC, BDATE DESC";
		}
		
		
		try {
			pstmt = con.prepareStatement("SELECT * FROM (" + query + ") ORDER BY " + orderBy);
			if(filterMap.get("startDate") != null && filterMap.get("endDate") != null) {
				for(int i = 0; i < ctgLv3Arr.length; i++) {
					pstmt.setString((6*i + 1), (String)filterMap.get("ctgLv2"));
					pstmt.setString((6*i + 2), ctgLv3Arr[i]);
					pstmt.setDate((6*i + 3), (Date)filterMap.get("endDate"));
					pstmt.setInt((6*i + 4), (int)filterMap.get("minPrice"));
					pstmt.setInt((6*i + 5), (int)filterMap.get("maxPrice"));
					pstmt.setString((6*i + 6), "등록");
				}
			}else {
				for(int i = 0; i < ctgLv3Arr.length; i++) {
					pstmt.setString((5*i + 1), (String)filterMap.get("ctgLv2"));
					pstmt.setString((5*i + 2), ctgLv3Arr[i]);
					pstmt.setInt((5*i + 3), (int)filterMap.get("minPrice"));
					pstmt.setInt((5*i + 4), (int)filterMap.get("maxPrice"));
					pstmt.setString((5*i + 5), "등록");
				}
			}
			
			rset = pstmt.executeQuery();
			bList = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("bno", rset.getInt("BNO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("bWriter", rset.getString("USER_NAME"));
				hmap.put("bTitle", rset.getString("BTITLE"));
				hmap.put("bCount", rset.getInt("BCOUNT"));
				hmap.put("bDate", rset.getDate("BDATE"));
				hmap.put("reviewStar", rset.getInt("REVIEW_STAR"));
				hmap.put("ano", rset.getInt("ANO"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("deposit", rset.getInt("DEPOSIT"));
				hmap.put("rtCount", rset.getInt("RTCOUNT"));
				hmap.put("rvCount", rset.getInt("RVCOUNT"));
				hmap.put("rvStar", rset.getInt("RVSTAR"));
				
				bList.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return bList;
	}
	

	public int updatebCount(Connection con, int bno) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updatebCount");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, bno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	

	public HashMap<String, Object> selectOneBoard(Connection con, int bno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectOneBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("bno", rset.getInt("BNO"));
				hmap.put("bTitle", rset.getString("BTITLE"));
				hmap.put("bContent", rset.getString("BCONTENT"));
				hmap.put("bWriter", rset.getString("USER_NAME"));
				hmap.put("bCount", rset.getInt("BCOUNT"));
				hmap.put("bDate", rset.getDate("BDATE"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("uno", rset.getInt("UNO"));
				hmap.put("pStartDate", rset.getDate("PSTART_DATE"));
				hmap.put("pEndDate", rset.getDate("PEND_DATE"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("deposit", rset.getInt("DEPOSIT"));
				hmap.put("dlFreeAmount", rset.getInt("DL_FREE_AMOUNT"));
				hmap.put("model", rset.getString("MODEL"));
				hmap.put("ctgId", rset.getInt("CTG_ID"));
				hmap.put("purchaseDate", rset.getDate("PURCHASE_DATE"));
				hmap.put("purchasePrice", rset.getInt("PURCHASE_PRICE"));
				hmap.put("asHistory", rset.getString("ASHISTORY"));
				hmap.put("condition", rset.getString("CONDITION"));
				hmap.put("sid", rset.getString("SID"));
				hmap.put("zzimCount", rset.getInt("ZZIMCOUNT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return hmap;
	}

	public ArrayList<Attachment> selectBoardImages(Connection con, int bno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> attList = null;
		String query = prop.getProperty("selectBoardImages");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			attList = new ArrayList<Attachment>();
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setAno(rset.getInt("ANO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				at.setFileLevel(rset.getInt("FILE_LEVEL"));
				attList.add(at);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return attList;
	}

	public HashMap<String, Object> selectbWritermap(Connection con, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> bWritermap = null;
		String query = prop.getProperty("selectbWritermap");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "후기");
			pstmt.setInt(2, uno);
			pstmt.setInt(3, uno);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				bWritermap = new HashMap<String, Object>();
				bWritermap.put("mLevelName", rset.getString("LEVEL_NAME"));
				bWritermap.put("pCount", rset.getInt("PCOUNT"));
				bWritermap.put("rvCount", rset.getInt("RVCOUNT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return bWritermap;
	}

	public ArrayList<HashMap<String, Object>> selectQnAList(Connection con, int bno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> QnAList = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectQnAList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();
			QnAList = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap= new HashMap<String, Object>();
				hmap.put("qnaNo", rset.getInt("BNO"));
				hmap.put("qnaTitle", rset.getString("BTITLE"));
				hmap.put("qnaContent", rset.getString("BCONTENT"));
				hmap.put("qnaWriter", rset.getString("USER_NAME"));
				hmap.put("qnaDate", rset.getDate("BDATE"));
				hmap.put("qnaModifyDate", rset.getDate("MODIFY_DATE"));
				hmap.put("qnaLevel", rset.getInt("BLEVEL"));
				hmap.put("ansNo", rset.getInt("ANSNO"));
				hmap.put("ansTitle", rset.getString("ANSTITLE"));
				hmap.put("ansContent", rset.getString("ANSCONTENT"));
				hmap.put("ansWriter", rset.getString("ANSWRITER"));
				hmap.put("ansDate", rset.getDate("ANSDATE"));
				hmap.put("ansModifyDate", rset.getDate("ANSMODIFY_DATE"));
				hmap.put("ansLevel", rset.getInt("ANSLEVEL"));
				
				QnAList.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return QnAList;
	}

	public ArrayList<HashMap<String, Object>> selectReviewList(Connection con, int bno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> reviewList = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectReviewList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "후기");
			pstmt.setInt(2, bno);
			rset = pstmt.executeQuery();
			reviewList = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap= new HashMap<String, Object>();
				hmap.put("rvNo", rset.getInt("BNO"));
				hmap.put("rvTitle", rset.getString("BTITLE"));
				hmap.put("rvContent", rset.getString("BCONTENT"));
				hmap.put("rvWriter", rset.getString("USER_NAME"));
				hmap.put("rvDate", rset.getDate("BDATE"));
				hmap.put("rvModifyDate", rset.getDate("MODIFY_DATE"));
				hmap.put("rvLevel", rset.getInt("BLEVEL"));
				hmap.put("ansNo", rset.getInt("ANSNO"));
				hmap.put("ansTitle", rset.getString("ANSTITLE"));
				hmap.put("ansContent", rset.getString("ANSCONTENT"));
				hmap.put("ansWriter", rset.getString("ANSWRITER"));
				hmap.put("ansDate", rset.getDate("ANSDATE"));
				hmap.put("ansModifyDate", rset.getDate("ANSMODIFY_DATE"));
				hmap.put("ansLevel", rset.getInt("ANSLEVEL"));
				
				reviewList.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return reviewList;
	}

	public int insertQnA(Connection con, Board newQnA) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertQnA");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, newQnA.getPno());
			pstmt.setString(2, newQnA.getbContent());
			pstmt.setString(3, newQnA.getbContent());
			pstmt.setInt(4, Integer.parseInt(newQnA.getbWriter()));
			pstmt.setInt(5, newQnA.getParentBno());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	
}














