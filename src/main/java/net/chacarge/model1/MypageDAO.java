package net.chacarge.model1;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	// 회원 정보 수정
	public int mypage_modify_ok(AdminTO adminTO) {
		
		return sqlSession.update("mypage_modify", adminTO);
	}
	
	// 회원 활동
	public List<AdminTO> deal_list(AdminTO adminTO) {
		
		List<AdminTO> deal_list = sqlSession.selectList("mypage_deal_list", adminTO);
		return deal_list;
	}
	
	// 회원 탈퇴
	public int mypage_withdrawal_ok(AdminTO adminTO) {
		
		return sqlSession.delete("mypage_withdrawal", adminTO);
	}
	
	// 회원 정보 수정시 password 확인용
	// login_ok
	public UserTO mypage_ok( AdminTO adminTO ) throws Exception {
		
		return sqlSession.selectOne( "mypage_ok", adminTO );
	}
}