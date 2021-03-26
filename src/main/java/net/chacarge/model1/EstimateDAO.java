package net.chacarge.model1;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EstimateDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// estimate 테이블의 초기 car_name 설정 부분
	// estimate_forSelect_carNameData
	public List<EstimateTO> estimate_forSelect_carNameData() {

		List<EstimateTO> estimate_forSelect_carNameData = sqlSession.selectList("estimate_forSelect_carNameData");
		return estimate_forSelect_carNameData;
	}
	// estimate_forSelect_carYearData
	public List<EstimateTO> estimate_forSelect_carYearData() {

		List<EstimateTO> estimate_forSelect_carYearData = sqlSession.selectList("estimate_forSelect_carYearData");
		return estimate_forSelect_carYearData;
	}
	// estimate_forSelect_carAccidentData
	public List<EstimateTO> estimate_forSelect_carAccidentData() {

		List<EstimateTO> estimate_forSelect_carAccidentData = sqlSession.selectList("estimate_forSelect_carAccidentData");
		return estimate_forSelect_carAccidentData;
	}
	// estimate_forSelect_carDistanceData
	public List<EstimateTO> estimate_forSelect_carDistanceData() {

		List<EstimateTO> estimate_forSelect_carDistanceData = sqlSession.selectList("estimate_forSelect_carDistanceData");
		return estimate_forSelect_carDistanceData;
	}
	
	
	// estimate 페이지에서 select 된 값에 대한 데이터 확인
	// estimate_car_data_selected_ok
	public int estimate_car_data_selected_ok(EstimateTO to) {
		
		int flag_data = 2;
		List<EstimateTO> car_data_selected_ok = sqlSession.selectList("car_data_selected", to);
		if (car_data_selected_ok.size() == 0) {
			flag_data = 1;
		} else {
			flag_data = 0;
		}
		return flag_data;
	}
	// estimate_car_distance_selected_ok
	public int estimate_car_distance_selected_ok(EstimateTO to) {
			
		int flag_distance = 2;
		List<EstimateTO> car_distance_selected_ok = sqlSession.selectList("car_distance_selected", to);
		if (car_distance_selected_ok.size() == 0) {
			flag_distance = 1;
		} else {
			flag_distance = 0;
		}
		return flag_distance;
	}
	// estimate_car_accident_selected_ok
	public int estimate_car_accident_selected_ok(EstimateTO to) {
		
		int flag_accident = 2;
		List<EstimateTO> car_accident_selected_ok = sqlSession.selectList("car_accident_selected", to);
		if (car_accident_selected_ok.size() == 0) {
			flag_accident = 1;
		} else {
			flag_accident = 0;
		}
		return flag_accident;
	}
	
	
	// estimate 페이지에서 select 된 값에 대한 데이터 가져오기
	// estimate_car_data_selected
	public List<EstimateOkTO> estimate_car_data_selected(EstimateOkTO took) {
		
		List<EstimateOkTO> estimate_car_data_selected = sqlSession.selectList("car_data_selected_ok", took);
		return estimate_car_data_selected;
	}
	// estimate_car_data_selected
	public List<EstimateOkTO> estimate_car_distance_selected(EstimateOkTO took) {
		
		List<EstimateOkTO> estimate_car_distance_selected = sqlSession.selectList("car_distance_selected_ok", took);
		return estimate_car_distance_selected;
	}
	// estimate_car_data_selected
	public List<EstimateOkTO> estimate_car_accident_selected(EstimateOkTO took) {
		
		List<EstimateOkTO> estimate_car_accident_selected = sqlSession.selectList("car_accident_selected_ok", took);
		return estimate_car_accident_selected;
	}
}