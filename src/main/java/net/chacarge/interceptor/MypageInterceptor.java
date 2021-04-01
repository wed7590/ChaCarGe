package net.chacarge.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.chacarge.model1.UserTO;

public class MypageInterceptor extends HandlerInterceptorAdapter {
	
	private static final String MYPAGE = "mypage";
	private static final Logger logger = LoggerFactory.getLogger( MypageInterceptor.class );
	
	@Override
	public void postHandle( HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		HttpSession httpSession = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object userTO = modelMap.get( "user" );
		
		if( userTO != null ) {
			logger.info( "new login success" );
			httpSession.setAttribute( MYPAGE, userTO );
			
			UserTO to = (UserTO) modelMap.get("user");
			response.sendRedirect( "chacarge_mypage_privacy.do");
		}
	}		
}
