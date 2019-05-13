package com.kh.st.member.model.service;

import static com.kh.st.common.JDBCTemplate.*;
import java.sql.*;
import java.util.*;
import com.kh.st.member.model.dao.MemberDao;
import com.kh.st.member.model.vo.Member;
import com.kh.st.common.PageInfo;

public class MemberService {

	
//도연이꺼
	//전체 회원수 리턴
	/*public int getListCount() {
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

	//전체 회원등급 리턴
	public ArrayList<Mlevel> selectMlevelList() {
		Connection con = getConnection();

		ArrayList<Mlevel> list = new MemberDao().selectMlevelList(con);

		close(con);

		return list;
	}*/

	
	
	
//민지
	public Member login(String userId, String userPwd) {
		Connection con = getConnection();
		Member loginUser = new MemberDao().login(con, userId, userPwd);
		close(con);
		return loginUser;
	}

}
