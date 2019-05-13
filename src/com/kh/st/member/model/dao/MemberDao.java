package com.kh.st.member.model.dao;

import static com.kh.st.common.JDBCTemplate.*;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.*;

import com.kh.st.member.model.vo.Member;
import com.kh.st.member.model.vo.PageInfo;

public class MemberDao {
	private Properties prop = new Properties();
	
	//properties 연결
	public MemberDao() {
		String fileName = MemberDao.class
								   .getResource("/sql/member/member-query.properties")
								   .getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//전체 회원 수 리턴
	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
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

	public ArrayList<Member> selectList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = null;
		
		String query = prop.getProperty("selectList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Member>();
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setUno(rset.getInt("UNO"));
				m.setUserId(rset.getString("USER_ID"));
				m.setUserName(rset.getString("USER_NAME"));
				m.setPhone(rset.getString("PHONE"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setProfits(rset.getInt("PROFITS"));
				m.setPoint(rset.getInt("POINT"));
				m.setPenalty(rset.getInt("PENALTY"));
				//m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				System.out.println(rset.getString("STATUS"));
				if(rset.getString("STATUS") == "Y") {
					m.setStatus("가입");
				}else {
					m.setStatus("탈퇴");
				}
				
				list.add(m);
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






























