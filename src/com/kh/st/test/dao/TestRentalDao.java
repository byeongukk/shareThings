/**
* Comment  : 
* @version : 1.0
* @author  : 최병욱
* @date    : 2019. 5. 14.
*/
package com.kh.st.test.dao;

import static com.kh.st.common.JDBCTemplate.getConnection;
import static org.junit.Assert.assertEquals;

import java.sql.Connection;

import org.junit.Before;
import org.junit.jupiter.api.Test;

import com.kh.st.rental.model.dao.RentalDao;

/**
 * @author uukk
 *
 */
class TestRentalDao {

	
	/*@Test
	void testSelectRentalFilter() {
		assertNotNull(new RentalDao().selectRentalFilter());
	}*/
	
	@Before
    public void beforeInputMemberTest() {
    	
    }
/*	@Test
	void testUpdateCancel() {
		Connection con = null;
		String[] rtNo = null;
		String textResult = null;
		con = getConnection();
    	rtNo = new String[3];
    	rtNo[0] = "10";
    	rtNo[1] = "50";
    	rtNo[2] = "100";
    	textResult = "test";
		assertEquals(new RentalDao().updateCancel(con,rtNo,textResult),0);
	}*/
	@Test
	void updateProductStatus() {
		Connection con = null;
		String[] pno = null;
		con = getConnection();
		pno = new String[2];
		pno[0] = "17";
		pno[1] = "1555";
		assertEquals(new RentalDao().updateProductStatus(con,pno),2);
	}
}
