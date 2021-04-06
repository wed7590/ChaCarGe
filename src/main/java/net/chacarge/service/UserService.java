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
	public void join_ok( UserTO uto ) throws Exception {
		userDAO.join_ok( uto );
	}
	
	// 로그인 처리
	public UserTO login_ok( LoginTO loginTO ) throws Exception {
		return userDAO.login_ok( loginTO );
	}
	
	// 방문자 처리
	public void visit_login( UserTO uto ) throws Exception {
		userDAO.visit_login( uto );
	}
	
	// 카카오 로그인 처리
	public UserTO kakao_id_check( UserTO uto ) throws Exception {
		UserTO userTO = userDAO.kakao_id_check( uto );
		
		if( userTO == null ) {
			// 회원가입 시킴
			userDAO.kakao_join_ok( uto );
			// 다시 uto 받아오기
			userTO = userDAO.kakao_id_check( uto );
		}

		return userTO;
	}
}