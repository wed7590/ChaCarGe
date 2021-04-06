package net.chacarge.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;

import org.mindrot.jbcrypt.BCrypt;

import net.chacarge.model1.UserTO;

public class UserJoin {
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		
		String url = "jdbc:mysql://localhost:3306/chacarge";
		String user = "root";
		String password = "!123456";
		
		// Admin 수 설정
		int numAdmin = 4;
		// User 수 설정
		/* int numUser = 16; */
		String[] name = { "dinos83", "bears79", "wiz81", "twins79", "heros80", "tigers73", "giants71", "lions64", "wyverns51", "eagles46", "user1", "user2", "user3", "user4" };
		// Visitor 수 설정
		int numVisitor = 100;
		// dummy 총 인원수
		int userNum = numAdmin + name.length;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		try {
			Class.forName( "org.mariadb.jdbc.Driver" );
			
			conn = DriverManager.getConnection( url, user, password );
			
			String sqlAdmin = "insert into user( user_id, user_password, user_email, user_name, user_grade, user_join_date )" 
							+ "values( ?, ?, ?, ?, 2, DATE_FORMAT(DATE_SUB(now(), INTERVAL ? DAY), '%Y-%m-%d') )";	
		
			for( int i=1; i<=numAdmin; i++ ) {
				++result;
				Random ran = new Random();
				int ranNum = ran.nextInt(userNum) + 1 + userNum;
				// String ranString = Integer.toString(ranNum);
				String user_password = "!1234" + i;
				String hashedPw = BCrypt.hashpw( user_password, BCrypt.gensalt() );
				
				pstmt = conn.prepareStatement(sqlAdmin);
				pstmt.setString(1, "AdminCar" + i);
				pstmt.setString(2, hashedPw);
				pstmt.setString(3, "AdminCar" + i + "@chacarge.shop");
				pstmt.setString(4, "AdminCar" + i);
				pstmt.setInt(5, ranNum);
				pstmt.executeUpdate();
				System.out.println(result + " : 관리자 id");
			}
			
			String sqlUser = "insert into user( user_id, user_password, user_email, user_name, user_grade, user_join_date )" 
					       + "values( ?, ?, ?, ?, 1, DATE_FORMAT(DATE_SUB(now(), INTERVAL ? DAY), '%Y-%m-%d') )";	
						
			for( String obj : name ) {
				++result;
				Random ran = new Random();
				int ranNum = ran.nextInt(userNum) + 1 + userNum;
				String user_password = "1234";
				String hashedPw = BCrypt.hashpw( user_password, BCrypt.gensalt() );
				
				pstmt = conn.prepareStatement(sqlUser);
				pstmt.setString(1, obj);
				pstmt.setString(2, hashedPw);
				pstmt.setString(3, obj + "@chacarge.shop");
				pstmt.setString(4, obj);
				pstmt.setInt(5, ranNum);
			
				pstmt.executeUpdate();
				System.out.println(result + " : 유저 id");
			}
			
			String sqlVisitor = "insert into visitor (visit_date, user_seq)"
					   		  + "values( DATE_FORMAT(DATE_SUB(now(), INTERVAL ? DAY), '%Y-%m-%d'), ? )";
			for (int i=0; i<numVisitor; i++) {
				++result;
				Random ran1 = new Random();
				Random ran2 = new Random();
				int ranNum1 = ran1.nextInt(userNum) + 1;
				int ranNum2 = ran2.nextInt(userNum) + 1;
				pstmt = conn.prepareStatement(sqlVisitor);
				pstmt.setInt(1, ranNum1);
				pstmt.setInt(2, ranNum2);
				pstmt.executeUpdate();
				System.out.println(result + " : visitor");
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
