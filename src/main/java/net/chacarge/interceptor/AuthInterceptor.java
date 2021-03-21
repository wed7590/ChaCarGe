package net.chacarge.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger( AuthInterceptor.class );
	
	@Override
	public boolean preHandle( HttpServletRequest request, HttpServletResponse response, Object handler ) throws Exception {
		HttpSession httpSession = request.getSession();
		
		if( httpSession.getAttribute( "login" ) == null ) {
			logger.info( "current user is not logged" );
			response.sendRedirect( "chacarge_login.do" );
			return false;
		}
		
		return true;
	}
	

}
