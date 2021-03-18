package net.chacarge.model1;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 유저관리 - 회원목록 출력 페이지
	// member_management
	public List<AdminTO> member_management() {

		List<AdminTO> member_management = sqlSession.selectList("member_management");
		return member_management;
	}
	
	
	// 유저관리 - 현재 회원수 출력 관련
	// member_count
	public List<AdminTO> member_count() {
		
		List<AdminTO> member_count = sqlSession.selectList("member_count");
		return member_count;
	}
	
	
	// 매물관리 - 매물 목록 출력 관련
	// item_management
	public List<AdminTO> item_management() {
		
		List<AdminTO> item_management = sqlSession.selectList("item_management");
		return item_management;
	}
	
	
	// 통계 - 방문자수 통계 출력 관련 
	// visitor_statistics 
	public List<AdminTO> visitor_statistics() {
		
		List<AdminTO> visitor_statistics = sqlSession.selectList("visitor_statistics");
		return visitor_statistics;
	}
	
	
	// 통계 - 회원 가입자수 통계 출력 관련
	// member_statistics
	public List<AdminTO> member_statistics() {
		
		List<AdminTO> member_statistics = sqlSession.selectList("member_statistics");
		return member_statistics;
	}

	
	// 통계 - 게시물수 통계 출력 관련
	// post_statistics
	public List<AdminTO> post_statistics() {
		
		List<AdminTO> post_statistics = sqlSession.selectList("post_statistics");
		return post_statistics;
	}
	
}