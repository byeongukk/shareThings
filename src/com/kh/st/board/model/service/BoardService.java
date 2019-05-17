package com.kh.st.board.model.service;

import static com.kh.st.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.st.board.model.dao.BoardDao;
import com.kh.st.product.model.dao.ProductDao;
import com.kh.st.product.model.vo.PCategory;

public class BoardService {

	//카테고리 메뉴 선택시 상품 리스트 불러오기
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

	//상품 게시판에서 필터 적용시
	public ArrayList<HashMap<String, Object>> selectFilterList(HashMap<String, Object> filterMap) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> bList = new BoardDao().selectFilterList(con, filterMap);
		close(con);
		return bList;
	}

}
