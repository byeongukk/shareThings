package com.kh.st.rental.model.dao;

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

/**
 * @author uukk
 *
 */
public class RentalDao {
	private Properties prop = new Properties();
	
	public RentalDao() {
		String fileName = RentalDao.class.getResource("/sql/rental/rental-query.properties").getPath();
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
	
	// 대여중/대여완료 리스트 조회
	public ArrayList<HashMap<String, Object>> selectRentalList(Connection con) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectRentalList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				hmap.put("rno", rset.getInt("RT_NO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("model", rset.getString("MODEL"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("rentalDate", rset.getDate("RT_STDATE"));
				hmap.put("pStatus", rset.getString("STATUS"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);	
		}
	
		
		
		System.out.println(list);
		return list;
		
	}

	// 상세조건들로 대여목록조회 
	public ArrayList<HashMap<String, Object>> selectRentalFilter(Connection con, HashMap<String, Object> condition) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> queryArr = new ArrayList<String>();
		String queryPlus = "";
		String query = null;

		
		//상세조건에 따라 query문 가져오기
		HashMap<String,Object> detailsContent = (HashMap<String, Object>) condition.get("detailsContent");
		
		
		if(condition.get("rentalStatus").equals("0") && detailsContent.get("details").equals("0") && condition.get("sDate").equals("")) {
			//조건없이 전체 조회
			queryPlus += " "+"1=1";
			queryArr.add(" "+"1=1");
		}else {
			//상태조건이 전체가 아닐때
			if(!(condition.get("rentalStatus").equals("0"))) {
				//ps.sid 컬럼을 조회하게 문자열 합치기
				queryPlus += ""+"PS.SID = ?";
				queryArr.add(queryPlus);
			}
			//상세조건이 전체가 아닐때
			System.out.println("detailsContent "+ detailsContent);
			if(!(detailsContent.get("details").equals("0"))) {
				System.out.println("상세조건 전체 아님");
				if(!(queryArr.isEmpty())) {
					queryPlus +=  " " + "AND" + " ";
					queryArr.add(" " + "AND" + " ");
				}
				
				//상세조건 선택하여 컬럼명 입력
				if(detailsContent.get("details").equals("rtNo")) {
					queryPlus += " "+"R.RT_NO";
					queryArr.add(" "+"R.RT_NO");
				} else if(detailsContent.get("details").equals("rtUserName")) {
					queryPlus += " "+"M.USER_NAME";
				} else if(detailsContent.get("details").equals("model")) {
					queryPlus += " "+"P.MODEL";
				} else if(detailsContent.get("details").equals("pno")) {
					queryPlus += " "+"P.PNO";
				}
				queryPlus += " "+"= ?";
			}
		}
		query = prop.getProperty("selectRentalStd")+" "+queryArr.get(0);
		System.out.println(queryArr.get(0));
		System.out.println(query);
		/*if(condition.get("rentalStatus").equals("0") && detailsContent.get("details").equals("0") && condition.get("sDate").equals("")) {
			//전체 조회
			query = prop.getProperty("selectAllFilter");
		}else {
			//상태조건이 전체가 아니면서 상세조건이 전체일때 
			if(!(condition.get("rentalStatus").equals("0"))) {
				
			}
			//상세조건이 전체가 아닐때
			if(!(detailsContent.get("details").equals("0"))) {
				System.out.println("상세조건 전체 아님");
				//상세조건 선택하여 컬럼명 입력
				
				if(detailsContent.get("details").equals("rtNo")) {
					
				} else if(detailsContent.get("details").equals("rtUserName")) {
					
				} else if(detailsContent.get("details").equals("model")) {
					
				} else if(detailsContent.get("details").equals("pno")) {
					
				}
			}
			
		}*/
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setObject(1, condition.get("rentalStatus"));
			//pstmt.setObject(1, detailsContent.get("filterContent"));
			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				hmap.put("rno", rset.getInt("RT_NO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("model", rset.getString("MODEL"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("rentalDate", rset.getDate("RT_STDATE"));
				hmap.put("pStatus", rset.getString("STATUS"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);	
		}
		System.out.println(list);
		return list;
	}


	public ArrayList<HashMap<String, Object>> selectPStatusFilter(Connection con, HashMap<String, Object> condition) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectPStatusFilter");
		System.out.println(condition.get("rentalStatus"));
		try {
			pstmt = con.prepareStatement(query);
			//pstmt.setObject(1, condition.get("rentalStatus"));
			pstmt.setObject(1,condition.get("rentalStatus"));
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				hmap.put("rno", rset.getInt("RT_NO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("model", rset.getString("MODEL"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("rentalDate", rset.getDate("RT_STDATE"));
				hmap.put("pStatus", rset.getString("STATUS"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);	
		}
		System.out.println(list);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectPStatusList(Connection con, String rentalStatus) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectPStatusFilter");

		try {
			pstmt = con.prepareStatement(query);
			//pstmt.setObject(1, condition.get("rentalStatus"));
			pstmt.setString(1,rentalStatus);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				hmap.put("rno", rset.getInt("RT_NO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("model", rset.getString("MODEL"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("rentalDate", rset.getDate("RT_STDATE"));
				hmap.put("pStatus", rset.getString("STATUS"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);	
		}
		System.out.println(list);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectDetailsList(Connection con, String filterContent) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectDetailsList");

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1,filterContent);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				hmap.put("rno", rset.getInt("RT_NO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("model", rset.getString("MODEL"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("rentalDate", rset.getDate("RT_STDATE"));
				hmap.put("pStatus", rset.getString("STATUS"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);	
		}
		System.out.println(list);
		return list;
	}

	/*대여번호로 검색*/
	public ArrayList<HashMap<String, Object>> selectRtNoDetails(Connection con, String filterContent) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectRtNoDetails");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,filterContent);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				hmap.put("rno", rset.getInt("RT_NO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("model", rset.getString("MODEL"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("rentalDate", rset.getDate("RT_STDATE"));
				hmap.put("pStatus", rset.getString("STATUS"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);	
		}
		System.out.println(list);
		return list;
	}
}
