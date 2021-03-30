package net.chacarge.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.chacarge.model1.AdminDAO;
import net.chacarge.model1.AdminTO;
import net.chacarge.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminDAO adminDAO;

	private final AdminService adminService;
	
	@Inject
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@RequestMapping(value = "/chacarge_admin_member.do", method = RequestMethod.GET)
	public String chacarge_admin_member(HttpServletRequest request, Locale locale, Model model) {
		
		AdminTO adminTO  = new AdminTO();
		adminTO.setUser_search(request.getParameter("user_search"));
		
		// 회원 목록 데이터 받기
		if (request.getParameter("user_search")==null || request.getParameter("user_search").contentEquals("")) {
			// 회원 목록 검색 X 경우
			List<AdminTO> member_management = adminDAO.member_management();
			model.addAttribute("member_management", member_management);
		} else {
			// 회원 목록 검색 O 경우
			List<AdminTO> member_management_search = adminDAO.member_management_search(adminTO.getUser_search());
			model.addAttribute("member_management", member_management_search);
		}

		// 현재 회원수 데이터 받기
		List<AdminTO> member_count = adminDAO.member_count();
		model.addAttribute("member_count", member_count);
		
		return "chacarge_admin_member";
	}

	@RequestMapping(value = "/chacarge_admin_member_delete.do", method = RequestMethod.GET)
	public String chacarge_admin_member_delete(HttpServletRequest request, Locale locale, Model model) throws Exception {

		AdminTO adminTO = new AdminTO();
		adminTO.setUser_id(request.getParameter("user_id"));
		
		int flag = adminService.member_delete(adminTO);
		model.addAttribute("flag", flag);
		
		return "chacarge_admin_member_delete";
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
}
