package com.kh.st.rental.model.service;

import static com.kh.st.common.JDBCTemplate.close;
import static com.kh.st.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.st.rental.model.dao.RentalDao;

public class RentalService {
	public ArrayList<HashMap<String, Object>> selectRentalList() {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new RentalDao().selectRentalList(con);
		
		close(con);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectRentalFilter(HashMap<String, Object> condition) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new RentalDao().selectRentalFilter(con,condition);
		
		close(con);
		return list;
	}
}
