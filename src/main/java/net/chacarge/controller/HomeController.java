package net.chacarge.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

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
}
