package com.kh.st.board.model.service;

import static com.kh.st.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.st.board.model.dao.BoardDao;
import com.kh.st.product.model.dao.ProductDao;
import com.kh.st.product.model.vo.PCategory;

public class BoardService {

	public HashMap<String, Object> selectList(String ctgLv2) {
		Connection con = getConnection();
		ArrayList<PCategory> ctgList = new ProductDao().selectCtgLv3List(con, ctgLv2);
		ArrayList<HashMap<String, Object>> bList = new BoardDao().selectList(con, ctgLv2);
		HashMap<String, Object> listMap = new HashMap<String, Object>();
		listMap.put("ctgList", ctgList);
		listMap.put("bList", bList);
		close(con);
		return listMap;
	}

}
