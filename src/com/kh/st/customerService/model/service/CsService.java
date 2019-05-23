package com.kh.st.customerService.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.st.customerService.model.dao.CsDao;
import com.kh.st.customerService.model.vo.Cs;

import static com.kh.st.common.JDBCTemplate.*;
import static com.kh.st.common.JDBCTemplate.*;

public class CsService {

	public ArrayList<Cs> selectList(int uno) {
		Connection con = getConnection();
		
		ArrayList<Cs> list = new CsDao().selectList(con, uno);
		
		close(con);

		return list;
	}

	public int insertCs(Cs c) {
		Connection con = getConnection();
		
		int result = new CsDao().insertCs(con, c);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public Cs selectOne(int num) {
		Connection con = getConnection();
		
		Cs c = new CsDao().selectOne(con, num);
		
		if(c != null) {
			int result = new CsDao().updateCs(con, c.getCno());
			
			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		
		close(con);
		
		return c;
	}

	public int updateCs(int c) {
		Connection con = getConnection();
		
		int result = new CsDao().updateCs(con, c);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteCs(int cno) {
		Connection con = getConnection();
		
		int result = new CsDao().deleteCs(con, cno);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}


