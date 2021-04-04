package net.chacarge.model1;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// login_ok
	public UserTO login_ok( LoginTO to ) throws Exception {
		
		return sqlSession.selectOne( "login_ok", to );
	}
	
	// join_ok
	public void join_ok(UserTO to) throws Exception {

		sqlSession.insert("join_ok", to);
	}
	
	// id_check
	public UserTO id_check(UserTO to) {
		
		return sqlSession.selectOne( "id_check", to );
	}
	
	// kakao_id_check
	public UserTO kakao_id_check(UserTO to) {
		to = sqlSession.selectOne( "kakao_id_check", to );
		if( to == null ) {
			return null;
		}
		return to;
	}
	
	// kakao_join_ok
	public void kakao_join_ok(UserTO to) throws Exception {

		sqlSession.insert("kakao_join_ok", to);
	}
	
}