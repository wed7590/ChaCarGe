package net.chacarge.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import net.chacarge.model1.UserTO;

public class UserJoin {
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		
		String url = "jdbc:mysql://localhost:3306/chacarge";
		String user = "root";
		String password = "!123456";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName( "org.mariadb.jdbc.Driver" );
			
			conn = DriverManager.getConnection( url, user, password );
			
			String sql = "insert into user( user_id, user_password, user_email, user_name, user_grade )" + 
						"values( ?, ?, ?, ?, 1 )";	
			
			for( int i=1; i<20; i++ ) {
				UserTO to = new UserTO();
				to.setUser_id( "User" + i );
				to.setUser_password( "1234" );
				to.setUser_name( "User" + i);
				to.setUser_email( "User" + i + "@chacarge.net" );

				String hashedPw = BCrypt.hashpw( to.getUser_password(), BCrypt.gensalt() );
				to.setUser_password( hashedPw );
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString( 1, to.getUser_id() );
				pstmt.setString( 2, to.getUser_password() );
				pstmt.setString( 3, to.getUser_email() );
				pstmt.setString( 4, to.getUser_name() );
				
				int result = pstmt.executeUpdate();
				System.out.println( "result : " + result );
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		
	}

}
