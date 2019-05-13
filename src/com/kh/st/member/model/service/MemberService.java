package com.kh.st.member.model.service;

import static com.kh.st.common.JDBCTemplate.*;
import java.sql.*;
import java.util.*;
import com.kh.st.member.model.dao.MemberDao;
import com.kh.st.member.model.vo.Member;
import com.kh.st.member.model.vo.PageInfo;

public class MemberService {

	//전체 회원수 리턴
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new MemberDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	//전체 회원 리스트 리턴
	public ArrayList<Member> selectList(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectList(con, pi);
		
		close(con);
		
		return list;
	}

}
