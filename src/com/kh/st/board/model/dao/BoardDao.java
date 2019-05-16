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
			rset = pstmt.executeQuery();
			
			bList = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("bno", rset.getInt("BNO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("bTitle", rset.getString("BTITLE"));
				hmap.put("bContent", rset.getString("BCONTENT"));
				hmap.put("bWriter", rset.getString("USER_NAME"));
				hmap.put("bCount", rset.getInt("BCOUNT"));
				hmap.put("bDate", rset.getDate("BDATE"));
				hmap.put("bLevel", rset.getInt("BLEVEL"));
				hmap.put("reviewStar", rset.getInt("REVIEW_STAR"));
				hmap.put("ano", rset.getInt("ANO"));
				hmap.put("originName", rset.getString("ORIGIN_NAME"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("uploadDate", rset.getDate("UPLOAD_DATE"));
				
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
	
	
}














