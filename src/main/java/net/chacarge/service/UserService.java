package net.chacarge.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.chacarge.model1.LoginTO;
import net.chacarge.model1.UserDAO;
import net.chacarge.model1.UserTO;

@Service
public class UserService {
	
	private final UserDAO userDAO;
	
	@Inject
	public UserService(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	// 회원 가입 처리
	public void join_ok( UserTO to ) throws Exception {
		userDAO.join_ok( to );
	}
	// 관리자 회원가입 처리
	public void join_admin_ok( UserTO to ) throws Exception {
		userDAO.join_admin_ok( to );
	}
	
	public UserTO login_ok( LoginTO loginTO ) throws Exception {
		return userDAO.login_ok( loginTO );
	}
}