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
	private static final String RT_NO = " R.RT_NO ";
	private static final String USER_NAME = " M.USER_NAME ";
	private static final String MODEL = " P.MODEL ";
	private static final String PNO = " P.PNO ";
	
	
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
	
	/*// 상세조건들로 대여목록조회 
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
		
		//전체조회
		if(condition.get("rentalStatus").equals("0") && detailsContent.get("details").equals("0") && condition.get("sDate").equals("")) {
			//조건없이 전체 조회
			queryArr.add(" 1=1 ");
		}else {
			//상태조건이 전체가 아닐때
			
			//배열인덱스가 0일때 전체조회를 하기위해 빈공간으로 만듦
			queryArr.add("");
			if(!(condition.get("rentalStatus").equals("0"))) {
				//ps.sid 컬럼을 조회하게 문자열 합치기
				queryArr.add(" PS.SID = ? ");
			}
			//상세조건이 전체가 아닐때
			System.out.println("detailsContent "+ detailsContent);
			if(!(detailsContent.get("details").equals("0"))) {
				System.out.println("상세조건 전체 아님");
				if(!(queryArr.isEmpty())) {
					queryArr.add(" AND ");
				}
				
				
				//상세조건 선택하여 컬럼명 입력
				if(detailsContent.get("details").equals("rtNo")) {
					queryArr.add(RT_NO + " = ? ");
				} else if(detailsContent.get("details").equals("rtUserName")) {
					queryArr.add(USER_NAME + " = ? ");
				} else if(detailsContent.get("details").equals("model")) {
					queryArr.add(MODEL +" = ? ");
				} else if(detailsContent.get("details").equals("pno")) {
					queryArr.add(PNO + " = ? ");
				}
			}
			//날짜값이 있는경우
			if(!(condition.get("detailsContent").equals(""))) {
				System.out.println("날짜값 null 아님");
				if(!(queryArr.isEmpty())) {
					queryArr.add(" AND ");
				}

				queryArr.add(" R.RT_STDATE BETWEEN");
				queryArr.add(" ? AND ? ");
			}
		}
		query = prop.getProperty("selectRentalStd");
		//추가된 쿼리만큼 더해주기
		for(int i=0; i<queryArr.size(); i++) {
			System.out.println("queryArr : " + queryArr.get(i));
			query += queryArr.get(i);
			System.out.println("query : " + query);
		}
		
		System.out.println(queryArr.get(0));
		System.out.println(query);
		if(condition.get("rentalStatus").equals("0") && detailsContent.get("details").equals("0") && condition.get("sDate").equals("")) {
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
			
		}
		try {
			pstmt = con.prepareStatement(query);
			
			//pstmt.setObject(1, condition.get("rentalStatus"));
			//pstmt.setObject(1, detailsContent.get("filterContent"));
			pstmt.setObject(1, condition.get("sDate"));
			pstmt.setObject(2, condition.get("eDate"));
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
	}*/
	
		// 상세조건들로 대여목록조회 해쉬맵
		public ArrayList<HashMap<String, Object>> selectRentalFilter(Connection con, HashMap<String, Object> condition) {
			ArrayList<HashMap<String,Object>> list = null;
			HashMap<String,Object> hmap = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			
			ArrayList<String> queryArr = new ArrayList<String>();
			ArrayList<Object> bindVal = new ArrayList<Object>();
			String query = null;
			boolean allViewsChk = false;
			
			//상세조건에 따라 query문 가져오기
			HashMap<String,Object> detailsContent = (HashMap<String, Object>) condition.get("detailsContent");
			
			//전체조회
			if(condition.get("rentalStatus").equals("0") && detailsContent.get("details").equals("0") && condition.get("sDate").equals("")) {
				//조건없이 전체 조회
				allViewsChk = true;
				queryArr.add(" 1 = ? ");
				bindVal.add("1");
			}else {
				//상태조건이 전체가 아닐때
				
				if(!(condition.get("rentalStatus").equals("0"))) {
					//ps.sid 컬럼을 조회하게 문자열 합치기
					queryArr.add(" PS.SID = ? ");
					bindVal.add(condition.get("rentalStatus"));
				}
				//상세조건이 전체가 아닐때
				if(!(detailsContent.get("details").equals("0"))) {

					//상세조건 선택하여 컬럼명 입력
					if(detailsContent.get("details").equals("rtNo")) {
						queryArr.add(RT_NO + " = ? ");
					} else if(detailsContent.get("details").equals("rtUserName")) {
						queryArr.add(USER_NAME + " = ? ");
					} else if(detailsContent.get("details").equals("model")) {
						queryArr.add(MODEL +" = ? ");
					} else if(detailsContent.get("details").equals("pno")) {
						queryArr.add(PNO + " = ? ");
					}
					bindVal.add(detailsContent.get("filterContent"));
				}
				//날짜값이 있는경우
				if(!(condition.get("sDate").equals(""))) {
					//날짜 2개를 비교하기위한  인덱스 맞추기
					queryArr.add(" R.RT_STDATE BETWEEN ? ");
					queryArr.add(" ? ");
					bindVal.add(condition.get("sDate"));
					bindVal.add(condition.get("eDate"));
				}
			}
			query = prop.getProperty("selectRentalStd");
			
			if(allViewsChk == false) {
				//추가된 쿼리만큼 더해주기
				for(int i=0; i<queryArr.size(); i++) {
					if(i==queryArr.size()-1) {
						query += queryArr.get(i) ;
					} else {
						query += queryArr.get(i) + " AND ";
					}
				}
			}else {
				//전체조회를 위한 쿼리 더해주기
				query += queryArr.get(0);
			}
			//대여주문번호 내림차순
			query += "ORDER BY R.RT_NO DESC";
			System.out.println(query);
			try {
				pstmt = con.prepareStatement(query);
				
				//받아온 값으로 바인드값 보냄
				for(int i=0; i<bindVal.size(); i++) {
					pstmt.setObject(i+1, bindVal.get(i));
				}
				
				
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
