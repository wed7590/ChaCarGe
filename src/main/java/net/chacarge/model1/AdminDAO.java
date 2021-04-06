package net.chacarge.model1;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 회원 관리 - 회원 목록 출력 + 검색
	// member_management
	public List<AdminTO> member_management() {

		List<AdminTO> member_management = sqlSession.selectList("member_management");
		return member_management;
	}
	// 회원 검색
	// member_mamagement_search
	public List<AdminTO> member_management_search(String user_search) {

		List<AdminTO> member_management_search = sqlSession.selectList("member_management_search", user_search);
		return member_management_search;
	}
	// 현재 회원수 출력
	// member_count
	public List<AdminTO> member_count() {
		
		List<AdminTO> member_count = sqlSession.selectList("member_count");
		return member_count;
	}
	
	
	// 탈퇴 회원 관리
	// member_delete_management
	public List<AdminTO> member_delete_management() {

		List<AdminTO> member_delete_management = sqlSession.selectList("member_delete_management");
		return member_delete_management;
	}
	// 탈퇴 회원 검색
	// member_delete_management_search
	public List<AdminTO> member_delete_management_search(String user_search) {

		List<AdminTO> member_delete_management_search = sqlSession.selectList("member_delete_management_search", user_search);
		return member_delete_management_search;
	}	
	
	
	// 탈퇴 회원 table 로 이관
	public void member_delete_move(AdminTO adminTO) {
		
		AdminTO member_delete_move_ok = sqlSession.selectOne("member_delete_move_ok", adminTO);
		sqlSession.insert("member_delete_move", member_delete_move_ok);
	}
	// 회원 table 에서 삭제
	public int member_delete(AdminTO adminTO) {
		
		return sqlSession.delete("member_delete", adminTO);
	}
	
	
	// 매물 게시판 관리 - 매물 목록 출력
	// deal_management
	public List<AdminTO> deal_management() {
		
		List<AdminTO> deal_management = sqlSession.selectList("deal_management");
		return deal_management;
	}
	public List<AdminTO> deal_management_search(String board_search) {
		
		List<AdminTO> deal_management_search = sqlSession.selectList("deal_management_search", board_search);
		return deal_management_search;
	}
	
	
	// 방문자 통계 관리 - 일별 방문자수 출력
	// statistics_visitor 
	public List<AdminTO> statistics_visitor() {
		
		List<AdminTO> statistics_visitor = sqlSession.selectList("statistics_visitor");
		return statistics_visitor;
	}
	// 회원 통계 관리 - 일별 회원수 출력
	// statistics_member
	public List<AdminTO> statistics_member() {
		
		List<AdminTO> statistics_member = sqlSession.selectList("statistics_member");
		return statistics_member;
	}
	// 게시물 통계 관리 - 일별 게시물수 출력
	// statistics_deal
	public List<AdminTO> statistics_deal() {
		
		List<AdminTO> statistics_deal = sqlSession.selectList("statistics_deal");
		return statistics_deal;
	}
	
}