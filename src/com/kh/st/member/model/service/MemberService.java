package com.kh.st.member.model.service;

import static com.kh.st.common.JDBCTemplate.*;
import java.sql.*;
import java.util.*;
import com.kh.st.member.model.dao.MemberDao;
import com.kh.st.member.model.vo.Member;
import com.kh.st.member.model.vo.Mlevel;
import com.kh.st.member.model.vo.Payback;
import com.kh.st.member.model.vo.Refund;
import com.kh.st.member.model.vo.Report;
import com.kh.st.common.PageInfo;

public class MemberService {

	
	//---------------------------------------------- 도연 ----------------------------------------------
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

	//전체 회원등급 리턴
	public ArrayList<Mlevel> selectMlevelList() {
		Connection con = getConnection();

		ArrayList<Mlevel> list = new MemberDao().selectMlevelList(con);

		close(con);

		return list;
	}

	//회원등급 수정 
	public int updateMlevel(ArrayList<Mlevel> list) {
		Connection con = getConnection();
		
		int result = new MemberDao().updateMlevel(con, list);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	//신고이력 카운트용
	public int getReportListCount() {
		Connection con = getConnection();
		
		int listCount = new MemberDao().getReportListCount(con);

		close(con);

		return listCount;
	}
	
	//신고이력 전체 조회용
	public ArrayList<Report> selectReportList(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<Report> list = new MemberDao().selectReportList(con, pi);
		
		close(con);
		
		return list;
	}
	
	//수익금 환급이력 전체 카운트용
	public int getPaybackListCount() {
		Connection con = getConnection();
		
		int listCount = new MemberDao().getPaybackListCount(con);


		close(con);

		return listCount;
	}
	
	//수익금 환급 이력 전체 조회용
	public ArrayList<Payback> selectPaybackList(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<Payback> list = new MemberDao().selectPaybackList(con, pi);
		
		close(con);
		
		return list;
	}
	
	//회원환불 전체 카운트용
	public int getRefundListCount() {
		Connection con = getConnection();
		
		int listCount = new MemberDao().getRefundListCount(con);

		close(con);

		return listCount;
	}
	
	//회원환불 전체 리스트 조회
	public ArrayList<Refund> selectRefundList(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<Refund> list = new MemberDao().selectRefundList(con, pi);
		
		close(con);
		
		return list;
	}


	
	//---------------------------------------------- 민지 ----------------------------------------------
	public Member login(String userId, String userPwd) {
		Connection con = getConnection();
		Member loginUser = new MemberDao().login(con, userId, userPwd);
		close(con);
		return loginUser;
	}

	public int idCheck(String userId) {

		Connection con = getConnection();
		int result = new MemberDao().idCheck(con, userId);
		close(con);
		return result;
	}

	public int emailCheck(String email) {
		Connection con = getConnection();
		int result = new MemberDao().emailCheck(con, email);
		close(con);
		return result;
	}

	public int insertMember(Member newMember) {
		Connection con = getConnection();
		int result = new MemberDao().insertMember(con, newMember);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int setEmailChecked(String userId) {
		Connection con = getConnection();
		int result = new MemberDao().setEmailChecked(con, userId);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	
	

	

	

	

	

	

}
