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

import com.kh.st.request.model.vo.ReqProduct;

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
				hmap.put("rtReqDate", rset.getDate("RT_REQ_DATE"));
				hmap.put("rtStatus", rset.getString("RT_STATUS"));
				
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
					//R.RT_STATUS 컬럼을 조회하게 문자열 합치기
					queryArr.add(" R.RT_STATUS = ? ");
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
					queryArr.add(" R.RT_REQ_DATE BETWEEN ? ");
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
					hmap.put("rtReqDate", rset.getDate("RT_REQ_DATE"));
					hmap.put("rtStatus", rset.getString("RT_STATUS"));
					
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
	






	/* 발송관리 리스트 조회  */
	public ArrayList<HashMap<String, Object>> selectShpMngList(Connection con) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectShpMngList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				hmap.put("rno", rset.getInt("RT_NO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("rtReqDate", rset.getDate("RT_REQ_DATE"));
				hmap.put("userId", rset.getString("USER_ID"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("phone", rset.getString("PHONE"));
				hmap.put("address", rset.getString("ADDRESS"));
				hmap.put("rtStatus", rset.getString("RT_STATUS"));
				
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

	public ArrayList<HashMap<String, Object>> selectShpNum(Connection con, String[] status) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String,Object> hmap = null;
		
		String query = prop.getProperty("selectShpNum");
		try {
			list = new ArrayList<HashMap<String,Object>>();
			for(int i = 0; i < status.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(status[i]));
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					hmap = new HashMap<String,Object>();
					
					hmap.put("rno", rset.getInt("RT_NO"));
					hmap.put("pno", rset.getInt("PNO"));
					hmap.put("model", rset.getString("MODEL"));
					hmap.put("userId", rset.getString("USER_ID"));
					hmap.put("userName", rset.getString("USER_NAME"));
					hmap.put("rtStatus", rset.getString("RT_STATUS"));
					
					list.add(hmap);
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
