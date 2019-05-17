package com.kh.st.request.model.service;

import static com.kh.st.common.JDBCTemplate.close;
import static com.kh.st.common.JDBCTemplate.commit;
import static com.kh.st.common.JDBCTemplate.getConnection;
import static com.kh.st.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.st.common.PageInfo;
import com.kh.st.request.model.dao.ReqDao;
import com.kh.st.request.model.vo.ReqProduct;

public class ReqService {

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new ReqDao().getListCount(con);
		
		close(con);
		return listCount;
	}

	public ArrayList<ReqProduct> reqList(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<ReqProduct> list = new ReqDao().reqList(con, pi);
		
		close(con);
		return list;
	}

	public ArrayList<ReqProduct> reqNoSelect(String[] status) {
		Connection con = getConnection();
		
		ArrayList<ReqProduct> list = new ReqDao().reqNoSelect(con, status);
		
		close(con);
		return list;
	}

	public int reqNo(String[] num, String textResult) {
		Connection con = getConnection();
		
		int result = new ReqDao().reqNo(con, num);
		
		if(result == num.length) {
			int result1 = new ReqDao().reqNoResult(con, num, textResult);
			
			if(result1 == num.length) {
				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		return result;
	}

	public ReqProduct reqOkSelect(String status) {
		Connection con = getConnection();
		
		ReqProduct rp = new ReqDao().reqOkSelect(con, status);
		
		close(con);
		return rp;
	}

	public int reqOk(int num, String delivery, int dNo) {
		Connection con = getConnection();
		
		int result = new ReqDao().reqOk(con, num);
		
		if(result > 0) {
			int result1 = new ReqDao().reqOkResult(con, num);
			
			if(result1 > 0) {
				int result2 = new ReqDao().delWait(con, num, delivery, dNo);
				
				if(result2 > 0) {
					result = 1;
					commit(con);
				} else {
					result = 0;
					rollback(con);
				}
			}
		}
		close(con);
		return result;
	}

}
