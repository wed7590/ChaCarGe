package net.chacarge.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@RequestMapping(value = "/chacarge_home.do", method = RequestMethod.GET)
	public String chacarge_home() {

		return "chacarge_home";
	}
	
}
