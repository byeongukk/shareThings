package com.kh.st.adProduct.model.dao;

import static com.kh.st.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.st.adProduct.model.vo.AdProduct;
import com.kh.st.attachment.model.vo.Attachment;
import com.kh.st.common.PageInfo;
import com.kh.st.member.model.vo.Member;
import com.kh.st.product.model.vo.Product;
import com.kh.st.request.model.dao.ReqDao;

public class AdProductDao {
	private Properties prop = new Properties();

	public AdProductDao() {
		String fileName = ReqDao
							.class
							.getResource("/sql/product/product-query.properties")
							.getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//물품 등록 처리
	public int adProductOk(Connection con, String[] num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("adProductOk");
		try {
			for(int i = 0; i < num.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(num[i]));
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return listCount;
	}
	
	//페이징 처리 물품 조회
	public ArrayList<AdProduct> adProductList(Connection con, PageInfo pi) {
		//등록번호, 등록자, 물품명, 등록기간, 상태
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AdProduct ap = null;
		ArrayList<AdProduct> list = null;
		
		String query = prop.getProperty("adProductList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<AdProduct>();
			
			while(rset.next()) {
				ap = new AdProduct();
				//등록번호, 등록자, 모델명, 카테고리, 등록기간, 상태(렌탈중/창고적재)
				ap.setPno(rset.getInt("PNO"));
				ap.setpWriter(rset.getString("USER_NAME"));
				ap.setModel(rset.getString("MODEL"));
				ap.setCtgName(rset.getString("CTG_NAME"));
				ap.setPstartDate(rset.getDate("PSTART_DATE"));
				ap.setPendDate(rset.getDate("PEND_DATE"));
				ap.setStatus(rset.getString("STATUS"));
				
				list.add(ap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
	
	//최종 등록 물품 상세 보기
	public HashMap<String, Object> adProductDetail(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		Member m = null;
		Product reqProduct = null;
		Attachment at = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("adProductDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();
			hmap = new HashMap<String, Object>();
			while(rset.next()) {
				reqProduct = new Product();		
				reqProduct.setPurchaseDate(rset.getDate("PURCHASE_DATE"));	//구입시기
				reqProduct.setModel(rset.getString("MODEL")); //모델명
				reqProduct.setPurchasePrice(rset.getInt("PURCHASE_PRICE"));	//구입가
				reqProduct.setPrice(rset.getInt("PRICE"));	//대여비
				reqProduct.setDeposite(rset.getInt("DEPOSIT"));	//보증금
				reqProduct.setPno(rset.getInt("PNO"));
				
				at = new Attachment();
				at.setAno(rset.getInt("ANO"));	//파일번호
				at.setOriginName(rset.getString("ORIGIN_NAME"));	//원본
				at.setChangeName(rset.getString("CHANGe_NAME"));	//사본
				at.setFilePath(rset.getString("FILE_PATH"));	//경로
					
				m = new Member();
				m.setPhone(rset.getString("PHONE"));	//전화번호
				m.setAddress(rset.getString("ADDRESS"));	//주소
				m.setUserName(rset.getString("USER_NAME")); //이름
				
				list.add(at);
				
				hmap.put("pStart", rset.getDate("PSTART_DATE"));	//등록시작일
				hmap.put("pEnd", rset.getDate("PEND_DATE"));	//등록종료일
				hmap.put("pName", rset.getString("CTG_NAME"));	//물품명
				hmap.put("reqpDate", rset.getDate("REQP_DATE"));	//요청날짜
				hmap.put("bContent", rset.getString("BCONTENT"));	//글 내용
				hmap.put("rejectReason", rset.getString("REJECT_REASON"));	//거절 이유
				hmap.put("status", rset.getString("STATUS"));
				
			}
			hmap.put("reqProduct", reqProduct);
			hmap.put("attachment", list);
			hmap.put("member", m);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return hmap;
	}
	
	//배송 조회
	public ArrayList<HashMap<String, Object>> shipList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		ArrayList<HashMap<String, Object>> list = null;
		
		String query = prop.getProperty("shipList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
		
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("apNo", rset.getInt("REQP_NO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("deliveryCompany", rset.getString("DELIVERY_COMPANY"));
				hmap.put("invoice", rset.getString("INVOICE"));
				hmap.put("shippingD", rset.getDate("SHIPPING_DATE"));
				hmap.put("reqD", rset.getDate("REQP_DATE"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("dAddress", rset.getString("DL_ADDRESS"));
				hmap.put("dType", rset.getString("INOUT"));
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		System.out.println(list);
		return list;
	}


}
