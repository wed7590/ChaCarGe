package net.chacarge.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.chacarge.model1.AdminDAO;
import net.chacarge.model1.AdminTO;

@Service
public class AdminService {
	
	private final AdminDAO adminDAO;
	
	@Inject
	public AdminService(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}
	
	// 회원 삭제
	public int member_delete(AdminTO adminTO) throws Exception {
		int result = adminDAO.member_delete(adminTO);
		if (result == 1) {
			return result;
		}
		return 0;
	}
}
