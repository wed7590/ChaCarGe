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
import net.chacarge.model1.BoardDAO;
import net.chacarge.model1.BoardTO;
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
	@Autowired
	private BoardDAO boardDAO;
	
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

		List<BoardTO> boardLists = boardDAO.boardList();
		
		model.addAttribute( "boardLists", boardLists );
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
	
	@RequestMapping(value = "/chacarge_admin_member.do", method = RequestMethod.GET)
	public String chacarge_admin_member(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) {
		
		AdminTO to  = new AdminTO();
		to.setUser_search(request.getParameter("user_search"));
		
		// 회원 목록 데이터 받기
		if (request.getParameter("user_search")==null || request.getParameter("user_search").contentEquals("")) {
			// 회원 목록 검색 X 경우
			List<AdminTO> member_management = adminDAO.member_management();
			model.addAttribute("member_management", member_management);
		} else {
			// 회원 목록 검색 O 경우
			List<AdminTO> member_management_search = adminDAO.member_management_search(to.getUser_search());
			model.addAttribute("member_management", member_management_search);
		}
				
		// 현재 회원수 데이터 받기
		List<AdminTO> member_count = adminDAO.member_count();
		model.addAttribute("member_count", member_count);
		
		return "chacarge_admin_member";
	}

	
	@RequestMapping(value = "/chacarge_admin_deal.do", method = RequestMethod.GET)
	public String chacarge_admin_deal(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) {
		
		AdminTO to = new AdminTO();
		to.setBoard_search(request.getParameter("board_search"));
		if (request.getParameter("board_search")==null || request.getParameter("board_search").equals("")) {
			// 게시판 검색 X 경우
			List<AdminTO> deal_management = adminDAO.deal_management();
			model.addAttribute("deal_management", deal_management);
		} else {
			// 게시판 검색 O 경우
			List<AdminTO> deal_management_search = adminDAO.deal_management_search(to.getBoard_search());
			model.addAttribute("deal_management", deal_management_search);
		}
		return "chacarge_admin_deal";
	}
	
	@RequestMapping(value = "/chacarge_admin_statistics_visitor.do", method = RequestMethod.GET)
	public String chacarge_admin_statistics_visitor(Locale locale, Model model) {

		// 방문자 수 통계 데이터 받기
		List<AdminTO> statistics_visitor = adminDAO.statistics_visitor();
		model.addAttribute("statistics_visitor", statistics_visitor);
		
		return "chacarge_admin_statistics_visitor";
	}
	
	@RequestMapping(value = "/chacarge_admin_statistics_member.do", method = RequestMethod.GET)
	public String chacarge_admin_statistics_member(Locale locale, Model model) {
		
		// 회원 가입자 수 통계 데이터 받기
		List<AdminTO> statistics_member = adminDAO.statistics_member();
		model.addAttribute("statistics_member", statistics_member);
		
		return "chacarge_admin_statistics_member";
	}
	
	@RequestMapping(value = "/chacarge_admin_statistics_deal.do", method = RequestMethod.GET)
	public String chacarge_admin_statistics_deal(Locale locale, Model model) {

		// 게시물 수 통계 데이터 받기
		List<AdminTO> statistics_deal = adminDAO.statistics_deal();
		model.addAttribute("statistics_deal", statistics_deal);
		
		return "chacarge_admin_statistics_deal";
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
		
		if( to.getUser_id().startsWith( "AdminCar" ) ) {
			userService.join_admin_ok( to );
		} else {
			userService.join_ok( to );
		}
		
		redirectAttributes.addFlashAttribute( "msg", "join_ok" );
		
		return "redirect:/chacarge_login.do";
	}
}
