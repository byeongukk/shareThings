package com.kh.st.rental.model.service;

import static com.kh.st.common.JDBCTemplate.close;
import static com.kh.st.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.st.rental.model.dao.RentalDao;

public class RentalService {
	/* 대여리스트 전체 조회 */
	public ArrayList<HashMap<String, Object>> selectRentalList() {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new RentalDao().selectRentalList(con);
		
		close(con);
		return list;
	}
	/* 대여리스트 상세조회 */
	public ArrayList<HashMap<String, Object>> selectRentalFilter(HashMap<String, Object> condition) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new RentalDao().selectRentalFilter(con,condition);
		
		close(con);
		return list;
	}

	/* 발송관리(대여대기) 리스트 전체 조회 */
	public ArrayList<HashMap<String, Object>> selectShpMngList() {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new RentalDao().selectShpMngList(con);
		
		close(con);
		return list;
	}
	
	/* 대여취소 모달  ajax 출력용*/
	public ArrayList<HashMap<String, Object>> selectShpNum(String[] status) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new RentalDao().selectShpNum(con,status);
		
		close(con);
		return list;
	}
	/* 취소시 업데이트 */
	public int updateCancel(String[] rtNo,String[] pno, String textResult) {
		Connection con = getConnection();
		int result = 0;
		int rtResult = new RentalDao().updateRentalStatus(con,rtNo,textResult);
		
		//db에 대여상태 업데이트가 정상적으로 됐을떄
		if(rtResult>0) {
			int pdResult = new RentalDao().updateProductStatus(con,pno);
			//db에 물품상태 업데이트가 정상적으로 됐을떄
			if(pdResult >0) {
				result = 1;
				commit(con);
			}else {
				rollback(con);
			}
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
