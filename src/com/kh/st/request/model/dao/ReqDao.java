package com.kh.st.request.model.dao;

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
import java.util.Properties;

import com.kh.st.common.PageInfo;
import com.kh.st.request.model.vo.ReqProduct;

public class ReqDao {
	private Properties prop = new Properties();
	
	public ReqDao() {
		String fileName = ReqDao
							.class
							.getResource("/sql/request/request-query.properties")
							.getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("listCount");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return listCount;
	}
	public ArrayList<ReqProduct> reqList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReqProduct> list = null;
		
		String qeury = prop.getProperty("reqList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(qeury);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ReqProduct>();
			
			while(rset.next()) {
				ReqProduct rp = new ReqProduct();
				
				rp.setUpNo(rset.getInt("UP_NO"));
				rp.setbWriter(rset.getString("BWRITER"));
				rp.setProductName(rset.getString("CID"));
				rp.setReqDate(rset.getDate("REQ_DATE"));
				rp.setbTitle(rset.getString("BTITLE"));
				rp.setAcceptResult(rset.getString("ACCEPT_RESULT"));
				
				list.add(rp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list;
	}

}
