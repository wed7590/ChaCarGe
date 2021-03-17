package net.chacarge.model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.chacarge.model1.UserTO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// login_ok
	public int login_ok( UserTO to ) {
		
		int flag = 1;
		UserTO to1 = sqlSession.selectOne( "login_ok", to );
		if( to1 != null ) {
			flag = 0;
		}
		return flag;
	}
	
}