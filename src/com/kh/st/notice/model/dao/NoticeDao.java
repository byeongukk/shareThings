/**
* @version : 1.0.0
* @author  : 최병욱
* @date    : 2019. 5. 20.
*/
package com.kh.st.notice.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.st.notice.model.vo.Notice;
import com.kh.st.rental.model.dao.RentalDao;

/**
 * @author uukk
 *
 */
public class NoticeDao {
	private Properties prop = new Properties();
	
	public NoticeDao() {
		String fileName = RentalDao.class.getResource("/sql/notice/notice-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Notice> selectAdminNoticeList() {
		// TODO Auto-generated method stub
		return null;
	}

}
