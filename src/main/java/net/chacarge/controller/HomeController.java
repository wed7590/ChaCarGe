package net.chacarge.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.chacarge.model1.AdminDAO;
import net.chacarge.model1.AdminTO;
import net.chacarge.model1.LoginTO;
import net.chacarge.model1.UserDAO;
import net.chacarge.model1.UserTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private AdminDAO adminDAO;
	
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
	public String chacarge_login(Locale locale, Model model) {

		return "chacarge_login";
	}
	
	@RequestMapping(value = "/chacarge_login_ok.do", method = RequestMethod.POST)
	public String chacarge_login_ok(HttpServletRequest request, HttpServletResponse response, Model model) {
		LoginTO to = new LoginTO();
		to.setLogin_id( request.getParameter( "user_id" ) );
		to.setLogin_pw( request.getParameter( "user_password" ) );

		UserTO to1 = new UserTO();
		to1 = userDAO.login_ok(to) ;
		
		int flag = 0;

		if( to1 == null || !BCrypt.checkpw( to.getLogin_pw(), to1.getUser_password() ) ) {
			flag = 1;
		}
		
		model.addAttribute( "flag", flag );
		
		return "chacarge_login_ok";
	}
	
	@RequestMapping(value = "/chacarge_join_ok.do", method = RequestMethod.POST)
	public String chacarge_join_ok(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		UserTO to = new UserTO();
		to.setUser_id( request.getParameter( "user_join_id" ) );
		to.setUser_password( request.getParameter( "user_join_password" ) );
		to.setUser_name( request.getParameter( "user_join_name" ) );
		to.setUser_email( request.getParameter( "user_join_email" ) );
		String hashedPw = BCrypt.hashpw( to.getUser_password(), BCrypt.gensalt() );
		to.setUser_password( hashedPw );
		
		int flag = userDAO.join_ok(to) ;
		
		model.addAttribute( "flag", flag );
		
		return "chacarge_join_ok";
	}
}
