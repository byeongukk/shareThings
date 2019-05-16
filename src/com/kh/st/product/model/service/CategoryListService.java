package com.kh.st.product.model.service;

import static com.kh.st.common.JDBCTemplate.close;
import static com.kh.st.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.st.product.model.dao.CategoryListDao;

public class CategoryListService {

	public ArrayList<Object> loadList(String topcategory) {
		Connection con = getConnection();
		
		ArrayList<Object> clist = new CategoryListDao().loadList(con, topcategory);
		
		close(con);
		
		return clist;
		

	}

}
