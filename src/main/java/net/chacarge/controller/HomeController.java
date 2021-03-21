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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import net.chacarge.model1.AdminDAO;
import net.chacarge.model1.AdminTO;
import net.chacarge.model1.LoginTO;
import net.chacarge.model1.UserDAO;
import net.chacarge.model1.UserTO;
import net.chacarge.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private UserDAO userDAO;
	private final UserService userService;
	@Autowired
	private AdminDAO adminDAO;
	
	@Inject
	public HomeController( UserService userService ) {
		this.userService = userService;
	}
	
	@RequestMapping(value = "/chacarge_home.do", method = RequestMethod.GET)
	public String chacarge_home(Locale locale, Model model) {

		return "chacarge_home";
	}
	
	@RequestMapping(value = "/chacarge_estimate.do", method = RequestMethod.GET)
	public String chacarge_estimate(Locale locale, Model model) {

		return "chacarge_estimate";
	}
	
	@RequestMapping(value = "/chacarge_deal_list.do", method = RequestMethod.GET)
	public String chacarge_deal_list(Locale locale, Model model) {

		return "chacarge_deal_list";
	}
	
	@RequestMapping(value = "/chacarge_deal_write.do", method = RequestMethod.GET)
	public String chacarge_deal_write(Locale locale, Model model) {

		return "chacarge_deal_write";
	}
	
	@RequestMapping(value = "/chacarge_deal_write_ok.do", method =  RequestMethod.GET)
	public String chacarge_deal_write_ok(Locale locale, Model model) {

		return "chacarge_deal_write_ok";
	}
	
	@RequestMapping(value = "/chacarge_deal_view.do", method = RequestMethod.GET)
	public String chacarge_deal_view(Locale locale, Model model) {

		return "chacarge_deal_view";
	}
	
	@RequestMapping(value = "/chacarge_admin_user.do", method = RequestMethod.GET)
	public String chacarge_admin_user(Locale locale, Model model) {

		// 회원 목록 데이터 받기
		List<AdminTO> member_management = adminDAO.member_management();
		model.addAttribute("member_management", member_management);
		
		// 현재 회원수 데이터 받기
		List<AdminTO> member_count = adminDAO.member_count();
		model.addAttribute("member_count", member_count);
		
		return "chacarge_admin_user";
	}

	
	@RequestMapping(value = "/chacarge_admin_deal.do", method = RequestMethod.GET)
	public String chacarge_admin_deal(Locale locale, Model model) {
		
		// 매물 목록 데이터 받기
		List<AdminTO> item_management = adminDAO.item_management();
		model.addAttribute("item_management", item_management);

		return "chacarge_admin_deal";
	}
	
	@RequestMapping(value = "/chacarge_admin_statistics.do", method = RequestMethod.GET)
	public String chacarge_admin_statistics(Locale locale, Model model) {

		// 방문자 수 통계 데이터 받기
		List<AdminTO> visitor_statistics = adminDAO.visitor_statistics();
		model.addAttribute("visitor_statistics", visitor_statistics);
		
		// 회원 가입자 수 통계 데이터 받기
		List<AdminTO> member_statistics = adminDAO.member_statistics();
		model.addAttribute("member_statistics", member_statistics);
		
		// 게시물 수 통계 데이터 받기
		List<AdminTO> post_statistics = adminDAO.post_statistics();
		model.addAttribute("post_statistics", post_statistics);
		
		return "chacarge_admin_statistics";
	}
	
	@RequestMapping(value = "/chacarge_login.do", method = RequestMethod.GET)
	public String chacarge_login(@ModelAttribute("loginTO") LoginTO loginTO ) {

		return "chacarge_login";
	}
	
	@RequestMapping(value = "/chacarge_login_ok.do", method = RequestMethod.POST)
	public void chacarge_login_ok(HttpServletRequest request, HttpSession httpSession, Model model ) throws Exception {
		LoginTO loginTO = new LoginTO();
		loginTO.setUserId( request.getParameter( "user_id" ) );
		loginTO.setUserPw( request.getParameter( "user_password" ) );
		
		UserTO userTO = userService.login_ok( loginTO );
		
		if( userTO == null || !BCrypt.checkpw( loginTO.getUserPw(), userTO.getUser_password() ) ) {
			return;
		}
		
		model.addAttribute( "user", userTO );
	}
	
	@RequestMapping(value = "/chacarge_logout.do", method = RequestMethod.GET )
	public String chacarge_logout( HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception {
		
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
		
		return "chacarge_logout";
	}

	@RequestMapping(value = "/chacarge_join_ok.do", method = RequestMethod.POST)
	public String chacarge_join_ok(HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
		UserTO to = new UserTO();
		to.setUser_id( request.getParameter( "user_join_id" ) );
		to.setUser_password( request.getParameter( "user_join_password" ) );
		to.setUser_name( request.getParameter( "user_join_name" ) );
		to.setUser_email( request.getParameter( "user_join_email" ) );
		
		String hashedPw = BCrypt.hashpw( to.getUser_password(), BCrypt.gensalt() );
		to.setUser_password( hashedPw );
		
		userService.join_ok( to );
		
		redirectAttributes.addFlashAttribute( "msg", "join_ok" );
		
		return "redirect:/chacarge_login.do";
	}
}
