package com.kh.st.adProduct.model.dao;

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

import com.kh.st.adProduct.model.vo.AdProduct;
import com.kh.st.common.PageInfo;
import com.kh.st.request.model.dao.ReqDao;

public class AdProductDao {
	private Properties prop = new Properties();

	public AdProductDao() {
		String fileName = ReqDao
							.class
							.getResource("/sql/product/product-query.properties")
							.getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//물품 등록 처리
	public int adProductOk(Connection con, String[] num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("adProductOk");
		try {
			for(int i = 0; i < num.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(num[i]));
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
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
	
	//페이징 처리 물품 조회
	public ArrayList<AdProduct> adProductList(Connection con, PageInfo pi) {
		//등록번호, 등록자, 물품명, 등록기간, 상태
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AdProduct ap = null;
		ArrayList<AdProduct> list = null;
		
		String query = prop.getProperty("adProductList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<AdProduct>();
			
			while(rset.next()) {
				ap = new AdProduct();
				//등록번호, 등록자, 모델명, 카테고리, 등록기간, 상태(렌탈중/창고적재)
				ap.setPno(rset.getInt("PNO"));
				ap.setpWriter(rset.getString("USER_NAME"));
				ap.setModel(rset.getString("MODEL"));
				ap.setCtgName(rset.getString("CTG_NAME"));
				ap.setPstartDate(rset.getDate("PSTART_DATE"));
				ap.setPendDate(rset.getDate("PEND_DATE"));
				ap.setStatus(rset.getString("STATUS"));
				
				list.add(ap);
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
