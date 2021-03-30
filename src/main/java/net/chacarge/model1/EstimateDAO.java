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
	public List<EstimateTO> estimate_car_name_selected_ok(EstimateTO to) {
		
		List<EstimateTO> car_name_selected_ok = sqlSession.selectList("car_name_selected", to);
		return car_name_selected_ok;
	}
	// estimate_car_year_selected_ok
	public List<EstimateTO> estimate_car_year_selected_ok(EstimateTO to) {
		
		List<EstimateTO> car_year_selected_ok = sqlSession.selectList("car_year_selected", to);
		return car_year_selected_ok;
	}
	// estimate_car_distance_selected_ok
	public List<EstimateTO> estimate_car_distance_selected_ok(EstimateTO to) {
		
		List<EstimateTO> car_distance_selected_ok = sqlSession.selectList("car_distance_selected", to);
		return car_distance_selected_ok;
	}
	// estimate_car_accident_selected_ok
	public List<EstimateTO> estimate_car_accident_selected_ok(EstimateTO to) {
		
		List<EstimateTO> car_accident_selected_ok = sqlSession.selectList("car_accident_selected", to);
		return car_accident_selected_ok;
	}
	
	
	
	
	
	
	
	
	
	
	
	
		
	
		/*
		 * // estimate 페이지에서 select 된 값에 대한 데이터 확인 // estimate_car_data_selected public
		 * EstimateTO estimate_car_name_selected(EstimateTO to) {
		 * 
		 * EstimateTO car_name_selected_ok = sqlSession.selectOne("car_name_selected",
		 * to); return car_name_selected_ok; } // estimate_car_year_selected public
		 * EstimateTO estimate_car_year_selected(EstimateTO to) {
		 * 
		 * EstimateTO car_year_selected_ok = sqlSession.selectOne("car_year_selected",
		 * to); return car_year_selected_ok; } // estimate_car_distance_selected public
		 * EstimateTO estimate_car_distance_selected(EstimateTO to) {
		 * 
		 * EstimateTO car_distance_selected_ok =
		 * sqlSession.selectOne("car_distance_selected", to); return
		 * car_distance_selected_ok; } // estimate_car_accident_selected public
		 * EstimateTO estimate_car_accident_selected(EstimateTO to) {
		 * 
		 * EstimateTO car_accident_selected_ok =
		 * sqlSession.selectOne("car_accident_selected", to); return
		 * car_accident_selected_ok; }
		 */
}