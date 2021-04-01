package net.chacarge.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.chacarge.model1.EstimateDAO;
import net.chacarge.model1.EstimateTO;

@Service
public class EstimateService {
	
	private final EstimateDAO estimateDAO;
	
	@Inject
	public EstimateService(EstimateDAO estimateDAO) {
		this.estimateDAO = estimateDAO;
	}

	public int estimate_car_name_selected_ok(EstimateTO to) {
		
		int flag_car = 2;
		List<EstimateTO> result = estimateDAO.estimate_car_name_selected_ok(to);
		if (result.size() == 0) {
			flag_car = 1;		// 실패!!
		} else {
			flag_car = 0;		// 성공!!
		}
		return flag_car;
	}
	
	public int estimate_car_year_selected_ok(EstimateTO to) {

		int flag_year = 2;
		List<EstimateTO> result = estimateDAO.estimate_car_year_selected_ok(to);
		if (result.size() == 0) {
			flag_year = 1;		// 실패!!
		} else {
			flag_year = 0;		// 성공!!
		}
		return flag_year;
	}
	
	
	public int estimate_car_distance_selected_ok(EstimateTO to) {
		
		int flag_distance = 2;
		List<EstimateTO> result = estimateDAO.estimate_car_distance_selected_ok(to);
		if (result.size() == 0) {
			flag_distance = 1;		// 실패!!
		} else {
			flag_distance = 0;		// 성공!!
		}
		return flag_distance;
	}
	
	public int estimate_car_accident_selected_ok(EstimateTO to) {
		
		int flag_accident = 2;
		List<EstimateTO> result = estimateDAO.estimate_car_accident_selected_ok(to);
		if (result.size() == 0) {
			flag_accident = 1;		// 실패!!
		} else {
			flag_accident = 0;		// 성공!!
		}
		return flag_accident;
	}
}
