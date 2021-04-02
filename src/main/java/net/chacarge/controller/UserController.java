package net.chacarge.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import net.chacarge.model1.LoginTO;
import net.chacarge.model1.UserTO;
import net.chacarge.service.UserService;

@Controller
public class UserController {
	private final UserService userService;
	
	@Inject
	public UserController( UserService userService ) {
		this.userService = userService;
	}
	
	// 로그인 페이지
	@RequestMapping(value = "/chacarge_login.do", method = RequestMethod.GET)
	public String chacarge_login(@ModelAttribute("loginTO") LoginTO loginTO ) {

		return "chacarge_login";
	}
	
	// 로그인 진행
	@RequestMapping(value = "/chacarge_login_ok.do", method = RequestMethod.POST)
	public void chacarge_login_ok(HttpServletRequest request, HttpSession httpSession, Model model ) throws Exception {
		// 로그인 시도하는 정보 저장
		LoginTO loginTO = new LoginTO();
		loginTO.setUserId( request.getParameter( "user_id" ) );
		loginTO.setUserPw( request.getParameter( "user_password" ) );
		
		// 로그인 정보가 회원가입된 정보인지 체크후 저장
		UserTO userTO = userService.login_ok( loginTO );
		
		// 비밀번호 복호화해서 맞는지 체크
		if( userTO == null || !BCrypt.checkpw( loginTO.getUserPw(), userTO.getUser_password() ) ) {
			return;
		}
		
		model.addAttribute( "user", userTO );
	}
	
	// 로그아웃 진행
	@RequestMapping(value = "/chacarge_logout.do", method = RequestMethod.GET )
	public String chacarge_logout( HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception {
		
		// 로그인 세션 정보 받아오기
		Object object = httpSession.getAttribute( "login" );
		if( object != null ) {
			// 세션 정보 삭제
			UserTO userTO = (UserTO) object;
			httpSession.removeAttribute( "login" );
			httpSession.invalidate();
			Cookie loginCookie = WebUtils.getCookie( request, "loginCookie" );
			if( loginCookie != null ) {
				loginCookie.setPath( "/" );
				loginCookie.setMaxAge( 0 );
				response.addCookie( loginCookie );
			}
		}
		
		return "chacarge_logout";
	}

	// 회원가입
	@RequestMapping(value = "/chacarge_join_ok.do", method = RequestMethod.POST)
	public String chacarge_join_ok(HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
		// 회원가입 정보 저장
		UserTO to = new UserTO();
		to.setUser_id( request.getParameter( "user_join_id" ) );
		to.setUser_password( request.getParameter( "user_join_password" ) );
		to.setUser_name( request.getParameter( "user_join_name" ) );
		to.setUser_email( request.getParameter( "user_join_email" ) );
		
		// 비밀번호 암호화 후 저장
		String hashedPw = BCrypt.hashpw( to.getUser_password(), BCrypt.gensalt() );
		to.setUser_password( hashedPw );
		
		// 회원가입 진행
		userService.join_ok( to );
		
		redirectAttributes.addFlashAttribute( "msg", "join_ok" );
		
		return "redirect:/chacarge_login.do";
	}
}
