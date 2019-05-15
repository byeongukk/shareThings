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

	public int reqOk(String[] status) {
		Connection con = getConnection();
		int result = new ReqDao().reqOk(con, status);
		
		if(result == status.length) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<ReqProduct> reqNoSelect(String[] status) {
		Connection con = getConnection();
		
		ArrayList<ReqProduct> list = new ReqDao().reqNoSelect(con, status);
		
		close(con);
		return list;
	}

}
