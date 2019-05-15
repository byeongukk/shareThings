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
				
				rp.setUpNo(rset.getInt("REQP_NO"));
				rp.setbWriter(rset.getString("USER_NAME"));
				rp.setProductName(rset.getString("CTG_ID"));
				rp.setReqDate(rset.getDate("REQP_DATE"));
				rp.setbTitle(rset.getString("BTITLE"));
				rp.setStatus(rset.getString("STATUS"));
				
				list.add(rp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list;
	}
	public int reqOk(Connection con, String[] status) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("reqOk");
		
			try {
				for(int i = 0; i < status.length; i++) {
					pstmt = con.prepareStatement(query);
					pstmt.setInt(1, Integer.parseInt(status[i]));
					
					result += pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		return result;
	}
	public ArrayList<ReqProduct> reqNoSelect(Connection con, String[] status) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReqProduct> list = new ArrayList<ReqProduct>();
		
		String query = prop.getProperty("reqNoSelect");
		try {
			for(int i = 0; i < status.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(status[i]));
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					ReqProduct rp = new ReqProduct();
					
					rp.setUpNo(rset.getInt("REQP_NO"));
					rp.setProductName(rset.getString("CTG_ID"));
					rp.setbWriter(rset.getString("USER_NAME"));
					//rp.setNoResult(rset.getString("REJECT_REASON"));
					
					list.add(rp);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		System.out.println(list);
		return list;
	}

}
