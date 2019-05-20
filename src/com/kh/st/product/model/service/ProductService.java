package com.kh.st.product.model.service;

import static com.kh.st.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.st.product.model.dao.ProductDao;
import com.kh.st.product.model.vo.Product;

public class ProductService {

	public int productInsert(Product p) {
		Connection con = getConnection();
		
		int result = new ProductDao().productInsert(con, p);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int getProductNo() {
		Connection con = getConnection();
		int pno = new ProductDao().getProductNo(con);
		
		close(con);

		return pno;
	}

}
