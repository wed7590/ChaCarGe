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

import net.chacarge.model1.EstimateDAO;
import net.chacarge.model1.EstimateTO;
import net.chacarge.service.EstimateService;
import net.chacarge.service.UserService;

@Controller
public class EstimateController {
	private final EstimateService estimateService;
	
	@Inject
	public EstimateController( EstimateService estimateService ) {
		this.estimateService = estimateService;
	}
	
	@Autowired
	private EstimateDAO estimateDAO;

	@RequestMapping(value = "/chacarge_estimate.do", method = RequestMethod.GET)
	public String chacarge_estimate(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) throws Exception {

		// 페이지 열었을 경우 검색할 수 있도록 DB 에서 불러오는 부분
		List<EstimateTO> estimate_forSelect_carNameData = estimateDAO.estimate_forSelect_carNameData();
		List<EstimateTO> estimate_forSelect_carYearData = estimateDAO.estimate_forSelect_carYearData();
		List<EstimateTO> estimate_forSelect_carAccidentData = estimateDAO.estimate_forSelect_carAccidentData();
		List<EstimateTO> estimate_forSelect_carDistanceData = estimateDAO.estimate_forSelect_carDistanceData();
		model.addAttribute("estimate_forSelect_carNameData", estimate_forSelect_carNameData);
		model.addAttribute("estimate_forSelect_carYearData", estimate_forSelect_carYearData);
		model.addAttribute("estimate_forSelect_carAccidentData", estimate_forSelect_carAccidentData);
		model.addAttribute("estimate_forSelect_carDistanceData", estimate_forSelect_carDistanceData);
		
		// 검색한 경우 : 견적 계산을 위한 데이터 가져오기
		EstimateTO took = new EstimateTO();
		took.setCar_name(request.getParameter("car_name_selected"));
		took.setCar_ref_year(request.getParameter("car_year_selected"));
		took.setCar_ref_distance(request.getParameter("car_distance_selected"));
		took.setCar_ref_accident(request.getParameter("car_accident_selected"));
		List<EstimateTO> estimate_car_name_selected = estimateDAO.estimate_car_name_selected_ok(took);
		List<EstimateTO> estimate_car_year_selected = estimateDAO.estimate_car_year_selected_ok(took);
		List<EstimateTO> estimate_car_distance_selected = estimateDAO.estimate_car_distance_selected_ok(took);
		List<EstimateTO> estimate_car_accident_selected = estimateDAO.estimate_car_accident_selected_ok(took);
		model.addAttribute("estimate_car_name_selected", estimate_car_name_selected);
		model.addAttribute("estimate_car_year_selected", estimate_car_year_selected);
		model.addAttribute("estimate_car_distance_selected", estimate_car_distance_selected);
		model.addAttribute("estimate_car_accident_selected", estimate_car_accident_selected);
		
		return "chacarge_estimate";
	}
	
	@RequestMapping(value = "/chacarge_estimate_ok.do", method = RequestMethod.GET)
	public String chacarge_estimate_ok(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) {

		// 검색한 경우 : 입력된 값을 가져오기
		EstimateTO to = new EstimateTO();
		to.setCar_name(request.getParameter("car_name_selected"));
		to.setCar_ref_year(request.getParameter("car_year_selected"));
		to.setCar_ref_distance(request.getParameter("car_distance_selected"));
		to.setCar_ref_accident(request.getParameter("car_accident_selected"));
		
		// 검색한 경우 : 입력된 값을 이용한 flag 값을 가져오기
		int flag_car = estimateService.estimate_car_name_selected_ok(to);
		int flag_year = estimateService.estimate_car_year_selected_ok(to);
		int flag_distance = estimateService.estimate_car_distance_selected_ok(to);
		int flag_accident = estimateService.estimate_car_accident_selected_ok(to);
		
		// model 에 입력된 값, flag 값 입력
		model.addAttribute("flag_car", flag_car);
		model.addAttribute("flag_year", flag_year);
		model.addAttribute("flag_distance", flag_distance);
		model.addAttribute("flag_accident", flag_accident);
		model.addAttribute("car_name_selected", to.getCar_name());
		model.addAttribute("car_year_selected", to.getCar_ref_year());
		model.addAttribute("car_distance_selected", to.getCar_ref_distance());
		model.addAttribute("car_accident_selected", to.getCar_ref_accident());
		
		return "chacarge_estimate_ok";
	}
}
