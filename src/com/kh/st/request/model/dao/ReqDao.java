package com.kh.st.request.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;


import static com.kh.st.common.JDBCTemplate.*;


public class ReqDao {
	private Properties prop = new Properties();

	// properties 연결
	public ReqDao() {
		String fileName = ReqDao.class.getResource("/sql/request/request-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<HashMap<String, Object>> reqProduct(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("reqProduct");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("upNo", rset.getInt("UP_NO"));
				hmap.put("bWriter", String.valueOf(rset.getInt("BWRITER")));
				hmap.put("model", rset.getString("CID"));
				hmap.put("reqDate", rset.getDate("REQ_DATE"));
				hmap.put("bTitle", rset.getString("BTITLE"));
				hmap.put("acceptResult", rset.getString("ACCEPT_RESULT"));
				
				list.add(hmap);
			}
			System.out.println(list.size());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}
}
