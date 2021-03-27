package net.chacarge.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.chacarge.model1.EstimateDAO;
import net.chacarge.model1.EstimateOkTO;
import net.chacarge.model1.EstimateTO;

@Controller
public class EstimateController {

	@Autowired
	private EstimateDAO estimateDAO;

	@RequestMapping(value = "/chacarge_estimate.do", method = RequestMethod.GET)
	public String chacarge_estimate(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) {

		List<EstimateTO> estimate_forSelect_carNameData = estimateDAO.estimate_forSelect_carNameData();
		List<EstimateTO> estimate_forSelect_carYearData = estimateDAO.estimate_forSelect_carYearData();
		List<EstimateTO> estimate_forSelect_carAccidentData = estimateDAO.estimate_forSelect_carAccidentData();
		List<EstimateTO> estimate_forSelect_carDistanceData = estimateDAO.estimate_forSelect_carDistanceData();
		model.addAttribute("estimate_forSelect_carNameData", estimate_forSelect_carNameData);
		model.addAttribute("estimate_forSelect_carYearData", estimate_forSelect_carYearData);
		model.addAttribute("estimate_forSelect_carAccidentData", estimate_forSelect_carAccidentData);
		model.addAttribute("estimate_forSelect_carDistanceData", estimate_forSelect_carDistanceData);
		
		EstimateOkTO took = new EstimateOkTO();
		/*
		 * took.setCar_name(request.getParameter("car_name_selected"));
		 * took.setCar_year(request.getParameter("car_year_selected"));
		 * took.setCar_ref_distance(request.getParameter("car_distance_selected"));
		 * took.setCar_ref_accident(request.getParameter("car_accident_selected"));
		 */
		
		took.setCar_name(request.getParameter("car_name_selected"));
		took.setCar_year(request.getParameter("car_year_selected"));
		took.setCar_ref_distance(request.getParameter("car_distance_selected"));
		took.setCar_ref_accident(request.getParameter("car_accident_selected"));
		 
		List<EstimateOkTO> estimate_car_data_selected = estimateDAO.estimate_car_data_selected(took);
		List<EstimateOkTO> estimate_car_distance_selected = estimateDAO.estimate_car_distance_selected(took);
		List<EstimateOkTO> estimate_car_accident_selected = estimateDAO.estimate_car_accident_selected(took);
		model.addAttribute("estimate_car_data_selected", estimate_car_data_selected);
		model.addAttribute("estimate_car_distance_selected", estimate_car_distance_selected);
		model.addAttribute("estimate_car_accident_selected", estimate_car_accident_selected);
		
		return "chacarge_estimate";
	}
	
	@RequestMapping(value = "/chacarge_estimate_ok.do", method = RequestMethod.GET)
	public String chacarge_estimate_ok(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) {

		EstimateTO to = new EstimateTO();
		to.setCar_name(request.getParameter("car_name_selected"));
		to.setCar_year(request.getParameter("car_year_selected"));
		to.setCar_ref_distance(request.getParameter("car_distance_selected"));
		to.setCar_ref_accident(request.getParameter("car_accident_selected"));
		
		int flag_data = estimateDAO.estimate_car_data_selected_ok(to);
		int flag_distance = estimateDAO.estimate_car_distance_selected_ok(to);
		int flag_accident = estimateDAO.estimate_car_accident_selected_ok(to);
		
		model.addAttribute("flag_data", flag_data);
		model.addAttribute("flag_distance", flag_distance);
		model.addAttribute("flag_accident", flag_accident);
		
		model.addAttribute("car_name_selected", to.getCar_name());
		model.addAttribute("car_year_selected", to.getCar_year());
		model.addAttribute("car_distance_selected", to.getCar_ref_distance());
		model.addAttribute("car_accident_selected", to.getCar_ref_accident());
		
		return "chacarge_estimate_ok";
	}
}
