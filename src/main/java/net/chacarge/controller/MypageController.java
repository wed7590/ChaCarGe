package net.chacarge.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import net.chacarge.model1.AdminTO;
import net.chacarge.model1.MypageDAO;
import net.chacarge.model1.UserTO;
import net.chacarge.service.MypageService;

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
	public String chacarge_mypage_privacy(HttpServletRequest request, Locale locale, Model model) {

		// 나중에 처리할 것 : modify 후 자동 수정되도록
		AdminTO adminTO = new AdminTO();
		adminTO.setUser_id(request.getParameter("user_id"));
		System.out.println(request.getParameter("user_id"));

		return "chacarge_mypage_privacy";
	}

	@RequestMapping(value = "/chacarge_mypage_modify_ok.do", method = RequestMethod.GET)
	public String chacarge_mypage_modify_ok(HttpServletRequest request, Locale locale, Model model) {

		AdminTO adminTO = new AdminTO();
		adminTO.setUser_id(request.getParameter("user_id"));
		adminTO.setUser_name(request.getParameter("user_name"));
		adminTO.setUser_email(request.getParameter("user_email"));
		
		int flag = mypageService.mypage_modify_ok(adminTO);
		model.addAttribute("flag", flag);
		
		return "chacarge_mypage_modify_ok";
	}
	
	@RequestMapping(value = "/chacarge_mypage_deal.do", method = RequestMethod.GET)
	public String chacarge_mypage_deal(HttpServletRequest request, Locale locale, Model model) throws Exception {

		
		int user_seq = Integer.parseInt(request.getParameter("user_seq"));
		List<AdminTO> deal_list = mypageDAO.deal_list(user_seq);
		
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
		adminTO.setUser_id(request.getParameter("user_name"));
		
		int flag = mypageService.mypage_withdrawal_ok(adminTO);
		model.addAttribute("flag", flag);
		
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
