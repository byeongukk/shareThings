/**
* @version : 1.0.0
* @author  : 최병욱
* @date    : 2019. 5. 20.
*/
package com.kh.st.notice.model.service;

import static com.kh.st.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.st.notice.model.dao.NoticeDao;
import com.kh.st.notice.model.vo.Notice;

/**
 * @author uukk
 *
 */
public class NoticeService {
	
	public ArrayList<Notice> selectAdminNoticeList() {
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectAdminNoticeList(con);
		
		close(con);
		return list;
	}
	
	public int insertNotice(Notice reqNotice) {
		Connection con = getConnection();
		
		int result = new NoticeDao().insertNotice(con,reqNotice);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public Notice selectAdminOne(int num) {
		Connection con = getConnection();
		
		Notice reqNotice = new NoticeDao().selectAdminOne(con, num);
		
		close(con);
		
		return reqNotice;
	}

	public int updateNotice(Notice reqNotice) {
		Connection con = getConnection();
		
		int result = new NoticeDao().updateNotice(con,reqNotice);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteNotice(String[] nno) {
		Connection con = getConnection();
		
		int result = new NoticeDao().deleteNotice(con,nno);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	//민지
	   public ArrayList<Notice> selectNoticeList() {
	      Connection con = getConnection();
	      ArrayList<Notice> nList = new NoticeDao().selectNoticeList(con);
	      close(con);
	      return nList;
	   }

}
