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


	public ArrayList<HashMap<String, Object>> selectPStatusList(String rentalStatus) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new RentalDao().selectPStatusList(con,rentalStatus);
		
		close(con);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectDetailsList(String filterContent) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new RentalDao().selectDetailsList(con,filterContent);
		
		close(con);
		return list;
	}
	/*대여번호로 검색*/
	public ArrayList<HashMap<String, Object>> selectRtNoDetails(String filterContent) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new RentalDao().selectRtNoDetails(con,filterContent);
		
		close(con);
		return list;
	}

	/*대여자이름으로 검색*/
	public ArrayList<HashMap<String, Object>> selectRtUserNameDetails(String filterContent) {
		// TODO Auto-generated method stub
		return null;
	}

	/*모델명으로 검색*/
	public ArrayList<HashMap<String, Object>> selectModelDetails(String filterContent) {
		// TODO Auto-generated method stub
		return null;
	}

	/*물품번호로 검색*/
	public ArrayList<HashMap<String, Object>> selectPnoDetails(String filterContent) {
		// TODO Auto-generated method stub
		return null;
	}
}
