/**
* @version : 1.0.0
* @author  : 최병욱
* @date    : 2019. 5. 20.
*/
package com.kh.st.notice.model.dao;

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

import com.kh.st.notice.model.vo.Notice;
import com.kh.st.rental.model.dao.RentalDao;

/**
 * @author uukk
 *
 */
public class NoticeDao {
	private Properties prop = new Properties();
	
	public NoticeDao() {
		String fileName = RentalDao.class.getResource("/sql/notice/notice-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Notice> selectAdminNoticeList(Connection con) {
		ArrayList<Notice> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAdminList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				Notice reqNotice = new Notice();
				System.out.println(rset.getInt("NNO"));
				System.out.println(rset.getString("NTITLE"));
				System.out.println(rset.getString("NCONTENT"));
				System.out.println(rset.getInt("NCOUNT"));
				System.out.println(rset.getDate("NDATE"));
				System.out.println(rset.getDate("MODIFY_DATE"));
				System.out.println(rset.getNString("NWRITER"));
				
				
				
				reqNotice.setNno(rset.getInt("NNO"));
				reqNotice.setnTitle(rset.getString("NTITLE"));
				reqNotice.setnContent(rset.getString("NCONTENT"));
				reqNotice.setnCount(rset.getInt("NCOUNT"));
				reqNotice.setnDate(rset.getDate("NDATE"));
				reqNotice.setModify_Date(rset.getDate("MODIFY_DATE"));
				reqNotice.setnWriter(rset.getNString("NWRITER"));
				
				list.add(reqNotice);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		return list;
	}


	public int insertNotice(Connection con, Notice reqNotice) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqNotice.getnTitle());
			pstmt.setString(2, reqNotice.getnContent());
			pstmt.setInt(3, Integer.parseInt(reqNotice.getnWriter()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		
		return result;
	}

	public Notice selectAdminOne(Connection con, int num) {
		Notice repNotice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectAdminOne");
	
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				repNotice = new Notice();
				
				repNotice.setNno(rset.getInt("NNO"));
				repNotice.setnTitle(rset.getString("NTITLE"));
				repNotice.setnContent(rset.getString("NCONTENT"));
				repNotice.setnDate(rset.getDate("NDATE"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return repNotice;
	}

}
