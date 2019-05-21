package com.kh.st.checkHistory.modal.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.st.attachment.model.vo.Attachment;
import com.kh.st.checkHistory.modal.dao.CheckHistoryDao;
import com.kh.st.checkHistory.modal.vo.CheckHistory;
import com.kh.st.common.PageInfo;

import static com.kh.st.common.JDBCTemplate.*;

public class CheckHistoryService {

	//검수 거절 이미지 등록 메소드
	public int insertRejectImg(CheckHistory ch, ArrayList<Attachment> fileList, String multiDelivery, String multiDno) {
		Connection con = getConnection();
		int result = 0;
		
		//검수 내용,검수자 인서트
		int result1 = new CheckHistoryDao().insertCheckContent(con, ch, fileList);
		if(result1 > 0) {
			System.out.println("검수내용, 검수자 성공");
			//물품 상태 업데이트(검수 불통과)
			int result2 = new CheckHistoryDao().updateRejectSid(con, ch);
			if(result2 > 0) {
				System.out.println("상태 업데이트 성공");
				int chkNo = new CheckHistoryDao().selectCurrval(con);
				for(int i = 0; i <fileList.size(); i++) {
					fileList.get(i).setChkNo(chkNo);
					System.out.println(fileList.get(i).getChkNo());
				}
				//검수거절 배송 인서트
				int result3 = new CheckHistoryDao().updateRejectDelivery(con, ch, multiDelivery, multiDno);
				if(result3 > 0) {
					System.out.println("검수거절 배송 성공");
					//사진 인서트
					int result4 = new CheckHistoryDao().insertChkImg(con, fileList);
					if(result4 == fileList.size()) {
						System.out.println("사진 성공");
						commit(con);
						result = 1;
					} else {
						System.out.println("사진 실패");
						rollback(con);
						result = 0;
					}
				} else {
					System.out.println("검수거절 배송 실패");
					rollback(con);
				}
			} else {
				System.out.println("상태 업데이트 실패");
				rollback(con);
			}
		} else {
			System.out.println("검수 내용, 검수자 인서트 실패");
			rollback(con);
		}
		close(con);
		return result;
	}

	public int insertConfirmImg(CheckHistory ch, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result = 0;
		
		//검수내용, 검수자
		int result1 = new CheckHistoryDao().insertCheckContent(con, ch, fileList);
		if(result1 > 0) {
			System.out.println("검수내용, 검수자 성공");
			//물품 상태 업데이트(검수 통과, 물품 상태)
			int result2 = new CheckHistoryDao().updateConfirmSid(con, ch);
			if(result2 > 0) {
				System.out.println("상태 업데이트 성공");
				int chkNo = new CheckHistoryDao().selectCurrval(con);
				for(int i = 0; i <fileList.size(); i++) {
					fileList.get(i).setChkNo(chkNo);
					System.out.println(fileList.get(i).getChkNo());
				}
				//사진 인서트
				int result3 = new CheckHistoryDao().insertChkImg(con, fileList);
				if(result3 == fileList.size()) {
					System.out.println("사진 성공");
					commit(con);
					result = 1;
				} else {
					System.out.println("사진 실패");
					rollback(con);
					result = 0;
				}
			}
		}
		close(con);
		return result;
	}
	
	//검수 물품 자세히 보기
	public HashMap<String, Object> confirmProductDetail(int reqNum) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap =
				new CheckHistoryDao().confirmProductDetail(con, reqNum);
		close(con);
		return hmap;
	}

	//필터 조회 게시글 수
	public int getConfirmFilterCount(HashMap<String, Object> condition) {
		Connection con = getConnection();
		int listCount = new CheckHistoryDao().getConfirmFilterCount(con, condition);
		
		close(con);
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectConfirmFilter(HashMap<String, Object> condition, PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new CheckHistoryDao().selectConfirmFilter(con, condition, pi);
		
		close(con);
		return list;
	}
}
