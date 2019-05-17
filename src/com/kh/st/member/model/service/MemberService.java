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
	
	//신고 적합판정용
	public int reportOk(String[] reportsNo) {
		Connection con = getConnection();
		
		int result = new MemberDao().reportOk(con, reportsNo);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	public ArrayList<HashMap<String, Object>> selectOneReport(int reportNo) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> list = new MemberDao().selectOneReport(con, reportNo);
		
		close(con);
		
		return list;
	}
	
	public int updateReportNo(String[] num, String inputReject) {
		Connection con = getConnection();
		
		int result = new MemberDao().updateReportNo(con, num, inputReject);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public HashMap<String, Object> selectOneMember(int no) {
		Connection con = getConnection();
		
		HashMap<String,Object> hmap = new MemberDao().selectOneMember(con,no);
		
		close(con);
		
		return hmap;
	}

	public int updatePaybackOk(String[] nums) {
		Connection con = getConnection();
		
		int result = new MemberDao().updatePaybackOk(con,nums);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	public int updateRefundOk(String[] nums) {
		Connection con = getConnection();
		
		int result = new MemberDao().updateRefundOk(con, nums);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
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
		int result = 0;
		int result1 = new MemberDao().insertMember(con, newMember);
		if(result1 > 0) {
			int result2 = new MemberDao().insertPlusPoint(con, newMember, 3000);
			if(result2 > 0) {
				result = 1;
				commit(con);
			}else {
				rollback(con);
			}
		}else {
			result = 0;
			rollback(con);
		}
		close(con);
		return result;
	}

	public Member setEmailChecked(Member loginUser) {
		Connection con = getConnection();
		int result = new MemberDao().setEmailChecked(con, loginUser.getUserId());
		Member updateUser = null;
		if(result > 0) {
			commit(con);
			updateUser = new MemberDao().login(con, loginUser.getUserId(), loginUser.getUserPwd());
		}else {
			rollback(con);
		}
		close(con);
		return updateUser;
	}

	

	

	

	

	

	
	

	

	

	

	

	

}
