package com.kh.st.product.model.dao;

import static com.kh.st.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.st.product.model.vo.PCategory;

public class ProductDao {
	
	private Properties prop = new Properties();
	public ProductDao() {
		String fileName = ProductDao.class.getResource("/sql/product/product-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<PCategory> selectCtgLv3List(Connection con, String ctgLv2) {

		PreparedStatement pstmt = null;
		ArrayList<PCategory> ctgList = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectCtgLv3List");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ctgLv2);
			rset = pstmt.executeQuery();
			ctgList = new ArrayList<PCategory>();
			while(rset.next()) {
				PCategory ctg = new PCategory();
				ctg.setCtgId(rset.getInt("CTG_ID"));
				ctg.setCtgLevel(rset.getInt("CTG_LEVEL"));
				ctg.setCtgName(rset.getString("CTG_NAME"));
				ctg.setParentCtgId(rset.getInt("PARENT_CTGID"));
				ctgList.add(ctg);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return ctgList;
	}
}






















