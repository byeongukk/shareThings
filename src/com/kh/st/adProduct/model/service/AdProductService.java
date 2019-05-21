package com.kh.st.adProduct.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.st.adProduct.model.dao.AdProductDao;
import com.kh.st.adProduct.model.vo.AdProduct;
import com.kh.st.common.PageInfo;
import static com.kh.st.common.JDBCTemplate.*;

public class AdProductService {

	//등록 물품 처리
	public int adProductOk(String[] num) {
		Connection con = getConnection();
		int result = new AdProductDao().adProductOk(con, num);
		
		if(result == num.length) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}
	
	//등록 물품 갯수
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new AdProductDao().getListCount(con);
		
		close(con);
		return listCount;
	}
	//등록 물품 조회
	public ArrayList<AdProduct> adProductList(PageInfo pi) {
		Connection con = getConnection();
		
		//ArrayList<AdProduct> list = new AdProductDao()
		return null;
	}

	

}
