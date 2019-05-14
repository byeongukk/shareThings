package com.kh.st.request.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.st.common.PageInfo;
import com.kh.st.request.model.dao.ReqDao;
import com.kh.st.request.model.vo.ReqProduct;

import static com.kh.st.common.JDBCTemplate.*;

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

}
