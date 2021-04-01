package net.chacarge.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import net.chacarge.model1.AdminTO;
import net.chacarge.model1.LoginTO;
import net.chacarge.model1.MypageDAO;
import net.chacarge.model1.UserTO;
import net.chacarge.service.MypageService;
import net.chacarge.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MypageController {
	@Autowired
	private MypageDAO mypageDAO;

	private final MypageService mypageService;
	
	@Inject
	public MypageController( MypageService mypageService ) {
		this.mypageService = mypageService;
	}
		
	@RequestMapping(value = "/chacarge_mypage_privacy.do", method = RequestMethod.GET)
	public String chacarge_mypage_privacy(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession, Locale locale, Model model) {

		// 나중에 처리할 것 : modify 후 자동 수정되도록
		AdminTO adminTO = new AdminTO();
		adminTO.setUser_id(request.getParameter("user_id"));
		
		try {
			UserTO userTO = mypageService.mypage_ok(adminTO);
			model.addAttribute("user", userTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("user_id", adminTO.getUser_id());
		return "chacarge_mypage_privacy";
	}

	@RequestMapping(value = "/chacarge_mypage_modify_ok.do", method = RequestMethod.GET)
	public String chacarge_mypage_modify_ok(HttpServletRequest request, Locale locale, Model model) {

		// privacy 페이지에서 개인 회원 정보 수정할 경우
		AdminTO adminTO = new AdminTO();
		adminTO.setUser_id(request.getParameter("user_id"));
		adminTO.setUser_password(request.getParameter("user_password"));
		adminTO.setUser_name(request.getParameter("user_name"));
		adminTO.setUser_email(request.getParameter("user_email"));
		
		model.addAttribute("user_id", adminTO.getUser_id());
		
		try {
			UserTO userTO = mypageService.mypage_ok(adminTO);
			if( userTO == null || !BCrypt.checkpw( adminTO.getUser_password(), userTO.getUser_password() ) ) {
				int flag = 1;
				model.addAttribute("flag", flag);
				return "chacarge_mypage_no";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int flag = mypageService.mypage_modify_ok(adminTO);
		model.addAttribute("flag", flag);

		return "chacarge_mypage_modify_ok";
	}
	
	@RequestMapping(value = "/chacarge_mypage_deal.do", method = RequestMethod.GET)
	public String chacarge_mypage_deal(HttpServletRequest request, Locale locale, Model model) throws Exception {

		// user_seq 값 받아와서 회원 활동 확인
		AdminTO adminTO = new AdminTO();
		adminTO.setUser_id(request.getParameter("user_id"));
		
		List<AdminTO> deal_list = mypageDAO.deal_list(adminTO);
			
		model.addAttribute("deal_list", deal_list);
		return "chacarge_mypage_deal";
	}
	
	@RequestMapping(value = "/chacarge_mypage_withdrawal.do", method = RequestMethod.GET)
	public String chacarge_mypage_withdrawal(Locale locale, Model model) {

		return "chacarge_mypage_withdrawal";
	}
	
	@RequestMapping(value = "/chacarge_mypage_withdrawal_ok.do", method = RequestMethod.GET)
	public String chacarge_mypage_withdrawal_ok(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession, Locale locale, Model model ) throws Exception {

		AdminTO adminTO = new AdminTO();
		adminTO.setUser_id(request.getParameter("user_id"));
		adminTO.setUser_password(request.getParameter("user_password"));
		adminTO.setUser_name(request.getParameter("user_name"));

		try {
			UserTO userTO = mypageService.mypage_ok(adminTO);
			if( userTO == null || !BCrypt.checkpw( adminTO.getUser_password(), userTO.getUser_password() ) ) {
				int flag = 1;
				model.addAttribute("flag", flag);
				return "chacarge_mypage_no";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int flag = mypageService.mypage_withdrawal_ok(adminTO);
		model.addAttribute("flag", flag);
		
		// 회원 탈퇴할 경우 session 만료 및 쿠키 삭제 부분
		if (flag==0) {
			Object object = httpSession.getAttribute( "login" );
			if( object != null ) {
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
		}
		
		return "chacarge_mypage_withdrawal_ok";
	}
}
