package com.kh.st.customerService.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.st.customerService.model.vo.Cs;
import com.kh.st.notice.model.vo.Notice;

public class CsDao {
	private Properties prop = new Properties();
	
	public CsDao() {
		String fileName = CsDao.class.getResource("/sql/cs/cs-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Cs> selectList(Connection con) {
		ArrayList<Cs> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectNotice");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Cs>();
			
			
			//---------------------------------------------------------- 여기부터
			while(rset.next()) {
				Cs c = new Cs();
				c.setCno(rset.getInt("CS_NO"));
				c.setPno(rset.getInt("PARENT_NO"));
				c.setcDate(rset.getDate("CS_DATE"));
				c.setcContent(rset.getString("CS_CONTENT"));
				c.setcCategory(rset.getString("CS_CATEGORY"));
				c.setcReply(rset.getString("CS_REPLY"));
				c.setUno(rset.getInt("UNO"));
				c.setcType(rset.getString("CS_TYPE"));
				c.setcCount(rset.getInt("CS_COUNT"));
				
				
				
				
				list.add(c);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public int insertCs(Connection con, Cs c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCs");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setInt(3, Integer.parseInt(n.getnWriter()));
			pstmt.setDate(4, n.getnDate());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public Cs selectOne(Connection con, int num) {
		Cs c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice();
				n.setNno(rset.getInt("NNO"));
				n.setnTitle(rset.getString("NTITLE"));
				n.setnContent(rset.getString("NCONTENT"));
				n.setnWriter(rset.getString("NICK_NAME"));
				n.setnCount(rset.getInt("NCOUNT"));
				n.setnDate(rset.getDate("NDATE"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		

		
		return c;
	}

	public int updateCs(Connection con, int i) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, i);
			pstmt.setInt(2, i);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	public int deleteCs(Connection con, int nno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("deleteCs");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}





