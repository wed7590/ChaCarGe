package net.chacarge.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.chacarge.model1.AdminDAO;
import net.chacarge.model1.AdminTO;
import net.chacarge.model1.MypageDAO;

@Service
public class MypageService {
	
	private final MypageDAO mypageDAO;
	
	@Inject
	public MypageService(MypageDAO mypageDAO) {
		this.mypageDAO = mypageDAO;
	}
	
	
	// 회원 정보 수정
	public int mypage_modify_ok(AdminTO adminTO) {

		int flag = 2;
		int result = mypageDAO.mypage_modify_ok(adminTO);
		if (result==0) {
			flag = 1;		// 수정 안된 경우
		} else {
			flag = 0;		// 수정된 경우
		}
		return flag;
	}
	
	// 회원 탈퇴
	public int mypage_withdrawal_ok(AdminTO adminTO) {
		
		int flag = 2;
		int result = mypageDAO.mypage_withdrawal_ok(adminTO);
		if (result==0) {
			flag = 1;		// 삭제 안된 경우
		} else {
			flag = 0;		// 삭제된 경우
		}
		return flag;
	}
	
	
}
