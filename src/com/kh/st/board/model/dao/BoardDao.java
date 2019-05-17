package com.kh.st.board.model.dao;

import static com.kh.st.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;



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
				hmap.put("rtCount", rset.getInt("COUNT(RT.RT_NO)"));
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
	public ArrayList<HashMap<String, Object>> selectFilterList(Connection con, HashMap<String, Object> filterMap) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> bList = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectFilterList");
		
		String orderBy = "";
		if(filterMap.get("orderBy").equals("recent")) {
			orderBy = "B.BDATE DESC";
		}else if(filterMap.get("orcerBy").equals("popular")) {
			orderBy = "COUNT(RT.RT_NO)";
		}else if(filterMap.get("orderBy").equals("review")) {
			orderBy = "B.REVIEW_STAR DESC";
		}else if(filterMap.get("orderBy").equals("priceAsc")) {
			orderBy = "P.PRICE ASC";
		}else if(filterMap.get("orderBy").equals("priceDesc")) {
			orderBy = "P.PRICE DESC";
		}
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, filterMap.get("ctgLv2").toString());
			//pstmt.setString(2, x);
			
			
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		return bList;
	}
	
	
}














