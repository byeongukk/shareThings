package com.kh.st.rental.model.dao;

import static com.kh.st.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
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
				
				hmap.put("rno", rset.getInt("RNO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("model", rset.getString("MODEL"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("rentalDate", rset.getDate("RENTAL_DATE"));
				hmap.put("pStatus", rset.getString("P_STATUS"));
				
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
}
