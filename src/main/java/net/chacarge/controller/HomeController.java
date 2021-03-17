package net.chacarge.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.chacarge.model1.UserDAO;
import net.chacarge.model1.UserTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private UserDAO userDAO;

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
	
	@RequestMapping(value = "/chacarge_admin_deal.do", method = RequestMethod.GET)
	public String chacarge_admin_deal(Locale locale, Model model) {

		return "chacarge_admin_deal";
	}
	
	@RequestMapping(value = "/chacarge_admin_user.do", method = RequestMethod.GET)
	public String chacarge_admin_user(Locale locale, Model model) {

		return "chacarge_admin_user";
	}
	
	@RequestMapping(value = "/chacarge_login.do", method = RequestMethod.GET)
	public String chacarge_login(Locale locale, Model model) {

		return "chacarge_login";
	}
	
	@RequestMapping(value = "/chacarge_login_ok.do", method = RequestMethod.GET)
	public String chacarge_login_ok(HttpServletRequest request, HttpServletResponse response, Model model) {
		UserTO to = new UserTO();
		to.setUser_id( request.getParameter( "user_id" ) );
		to.setUser_password( request.getParameter( "user_password" ) );

		System.out.println( to.getUser_id() );
		System.out.println( to.getUser_password() );
		
		int flag = userDAO.login_ok(to) ;
		
		model.addAttribute( "flag", flag );
		
		return "chacarge_login_ok";
	}
	
	@RequestMapping(value = "/chacarge_join_ok.do", method = RequestMethod.GET)
	public String chacarge_join_ok(HttpServletRequest request, HttpServletResponse response, Model model) {
		UserTO to = new UserTO();
		to.setUser_id( request.getParameter( "user_join_id" ) );
		to.setUser_password( request.getParameter( "user_join_password" ) );
		to.setUser_name( request.getParameter( "user_join_name" ) );
		to.setUser_email( request.getParameter( "user_join_email" ) );

		System.out.println( to.getUser_id() );
		System.out.println( to.getUser_password() );
		
		int flag = userDAO.join_ok(to) ;
		
		model.addAttribute( "flag", flag );
		
		return "chacarge_join_ok";
	}
}
