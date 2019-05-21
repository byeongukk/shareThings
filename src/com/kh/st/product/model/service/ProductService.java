package com.kh.st.product.model.service;

import static com.kh.st.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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

	public int regreqProduct(int pno, String address, String phone, String phone2) {
		
		Connection con = getConnection();
		int rqresult = new ProductDao().regreqProduct(con, pno, address, phone, phone2);
		
		if(rqresult > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return rqresult;
	}

	
	/*---------------- 내 등록 내역 조회---------------*/
	public ArrayList<Product> selectList(int uno) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectList(con, uno);
		
		close(con);
		
		return list;
	}

}
