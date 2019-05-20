/**
* @version : 1.0.0
* @author  : 최병욱
* @date    : 2019. 5. 20.
*/
package com.kh.st.notice.model.service;

import static com.kh.st.common.JDBCTemplate.getConnection;

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
		ArrayList<Notice> list = new NoticeDao().selectAdminNoticeList();
		
		
		return list;
	}

}
