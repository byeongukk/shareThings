package com.kh.st.request.model.service;

import static com.kh.st.common.JDBCTemplate.close;
import static com.kh.st.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.st.request.model.dao.ReqDao;

public class ReqService {

	//등록 요청 전체 조회
	public ArrayList<HashMap<String, Object>> reqProduct() {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new ReqDao().reqProduct(con);
		
		close(con);
		return list;
	}
	
}
