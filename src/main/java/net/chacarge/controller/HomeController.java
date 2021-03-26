package net.chacarge.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.google.gson.JsonObject;

import net.chacarge.model1.AdminDAO;
import net.chacarge.model1.AdminTO;
import net.chacarge.model1.BoardDAO;
import net.chacarge.model1.BoardTO;
import net.chacarge.model1.EstimateDAO;
import net.chacarge.model1.EstimateOkTO;
import net.chacarge.model1.EstimateTO;
import net.chacarge.model1.LoginTO;
import net.chacarge.model1.PictureTO;
import net.chacarge.model1.UserDAO;
import net.chacarge.model1.UserTO;
import net.chacarge.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private UserDAO userDAO;
	private final UserService userService;
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private EstimateDAO estimateDAO;
	
	@Inject
	public HomeController( UserService userService ) {
		this.userService = userService;
	}
	
	@RequestMapping(value = "/chacarge_home.do", method = RequestMethod.GET)
	public String chacarge_home(Locale locale, Model model) {

		return "chacarge_home";
	}
	
	@RequestMapping(value = "/chacarge_estimate.do", method = RequestMethod.GET)
	public String chacarge_estimate(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) {

		List<EstimateTO> estimate_forSelect_carNameData = estimateDAO.estimate_forSelect_carNameData();
		List<EstimateTO> estimate_forSelect_carYearData = estimateDAO.estimate_forSelect_carYearData();
		List<EstimateTO> estimate_forSelect_carAccidentData = estimateDAO.estimate_forSelect_carAccidentData();
		List<EstimateTO> estimate_forSelect_carDistanceData = estimateDAO.estimate_forSelect_carDistanceData();
		model.addAttribute("estimate_forSelect_carNameData", estimate_forSelect_carNameData);
		model.addAttribute("estimate_forSelect_carYearData", estimate_forSelect_carYearData);
		model.addAttribute("estimate_forSelect_carAccidentData", estimate_forSelect_carAccidentData);
		model.addAttribute("estimate_forSelect_carDistanceData", estimate_forSelect_carDistanceData);
		
		EstimateOkTO took = new EstimateOkTO();
		/*
		 * took.setCar_name(request.getParameter("car_name_selected"));
		 * took.setCar_year(request.getParameter("car_year_selected"));
		 * took.setCar_ref_distance(request.getParameter("car_distance_selected"));
		 * took.setCar_ref_accident(request.getParameter("car_accident_selected"));
		 */
		
		took.setCar_name(request.getParameter("car_name_selected"));
		took.setCar_year(request.getParameter("car_year_selected"));
		took.setCar_ref_distance(request.getParameter("car_distance_selected"));
		took.setCar_ref_accident(request.getParameter("car_accident_selected"));
		 
		List<EstimateOkTO> estimate_car_data_selected = estimateDAO.estimate_car_data_selected(took);
		List<EstimateOkTO> estimate_car_distance_selected = estimateDAO.estimate_car_distance_selected(took);
		List<EstimateOkTO> estimate_car_accident_selected = estimateDAO.estimate_car_accident_selected(took);
		model.addAttribute("estimate_car_data_selected", estimate_car_data_selected);
		model.addAttribute("estimate_car_distance_selected", estimate_car_distance_selected);
		model.addAttribute("estimate_car_accident_selected", estimate_car_accident_selected);
		
		return "chacarge_estimate";
	}
	
	@RequestMapping(value = "/chacarge_estimate_ok.do", method = RequestMethod.GET)
	public String chacarge_estimate_ok(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) {

		EstimateTO to = new EstimateTO();
		to.setCar_name(request.getParameter("car_name_selected"));
		to.setCar_year(request.getParameter("car_year_selected"));
		to.setCar_ref_distance(request.getParameter("car_distance_selected"));
		to.setCar_ref_accident(request.getParameter("car_accident_selected"));
		
		int flag_data = estimateDAO.estimate_car_data_selected_ok(to);
		int flag_distance = estimateDAO.estimate_car_distance_selected_ok(to);
		int flag_accident = estimateDAO.estimate_car_accident_selected_ok(to);
		
		model.addAttribute("flag_data", flag_data);
		model.addAttribute("flag_distance", flag_distance);
		model.addAttribute("flag_accident", flag_accident);
		
		model.addAttribute("car_name_selected", to.getCar_name());
		model.addAttribute("car_year_selected", to.getCar_year());
		model.addAttribute("car_distance_selected", to.getCar_ref_distance());
		model.addAttribute("car_accident_selected", to.getCar_ref_accident());
		
		return "chacarge_estimate_ok";
	}
	
	@RequestMapping(value = "/chacarge_deal_list.do", method = RequestMethod.GET)
	public String chacarge_deal_list(Locale locale, Model model) {

		List<BoardTO> boardLists = boardDAO.boardList();
		
		model.addAttribute( "boardLists", boardLists );
		return "chacarge_deal_list";
	}
	
	@RequestMapping(value = "/chacarge_deal_write.do", method = RequestMethod.GET)
	public String chacarge_deal_write(Locale locale, Model model) {

		return "chacarge_deal_write";
	}
	
	@RequestMapping(value = "/chacarge_deal_write_ok.do", method =  RequestMethod.POST)
	public String chacarge_deal_write_ok(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam("files") List<MultipartFile> fileList ) throws Exception {
		
		PictureTO pictureTO = new PictureTO();
		
		//업로드한 파일이 없으면 실행되지 않음
		if(fileList != null){
			//파일이 저장될 경로 설정
			String path = "D://upload/";
			File dir = new File(path);
			if(!dir.isDirectory()){
				dir.mkdirs();
			}
		
			if(!fileList.isEmpty()){
			//넘어온 파일을 리스트로 저장
				for( int i = 0; i < fileList.size() ; i++ ) {
					//파일 중복명 처리
					String random = UUID.randomUUID().toString();
					//원래 파일명
					String originalfilename = fileList.get(i).getOriginalFilename();
					//저장되는 파일이름
					String saveFileName = random + "_"+ originalfilename;
					//저장될 파일 경로
					String savePath = path + saveFileName;
					//파일사이즈
					int fileSize = (int) fileList.get(i).getSize();
					//파일 저장
					fileList.get(i).transferTo(new File(savePath));
				
					pictureTO.setO_pic_name( originalfilename );
					pictureTO.setU_pic_name( saveFileName );
					
					//boardDAO.boardUpload( PictureTO );
				}
			}
		}
		
		System.out.println( pictureTO.getBoard_pic_seq() );
		
		

		// board 정보 
		BoardTO boardTO = new BoardTO();
		boardTO.setBoard_subject( request.getParameter( "board_subject" ) );
		boardTO.setBoard_content( request.getParameter( "board_content" ) );

		UserTO userTO = new UserTO();
		userTO.setUser_seq( request.getParameter( "user_seq" ) );
		userTO = userDAO.id_check( userTO );
		
		boardTO.setUser_seq( userTO.getUser_seq() );
		
		int flag = boardDAO.boardWriteOk(boardTO) ;
		
		model.addAttribute( "flag", flag );
		model.addAttribute( "pictureTO", pictureTO );
		
		return "chacarge_deal_write_ok";
	}
	
	@RequestMapping(value = "/chacarge_deal_view.do", method = RequestMethod.GET)
	public String chacarge_deal_view(Locale locale, Model model) {

		return "chacarge_deal_view";
	}
	
	@RequestMapping(value = "/chacarge_admin_member.do", method = RequestMethod.GET)
	public String chacarge_admin_member(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) {
		
		AdminTO to  = new AdminTO();
		to.setUser_search(request.getParameter("user_search"));
		
		// 회원 목록 데이터 받기
		if (request.getParameter("user_search")==null || request.getParameter("user_search").contentEquals("")) {
			// 회원 목록 검색 X 경우
			List<AdminTO> member_management = adminDAO.member_management();
			model.addAttribute("member_management", member_management);
		} else {
			// 회원 목록 검색 O 경우
			List<AdminTO> member_management_search = adminDAO.member_management_search(to.getUser_search());
			model.addAttribute("member_management", member_management_search);
		}
				
		// 현재 회원수 데이터 받기
		List<AdminTO> member_count = adminDAO.member_count();
		model.addAttribute("member_count", member_count);
		
		return "chacarge_admin_member";
	}

	
	@RequestMapping(value = "/chacarge_admin_deal.do", method = RequestMethod.GET)
	public String chacarge_admin_deal(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) {
		
		AdminTO to = new AdminTO();
		to.setBoard_search(request.getParameter("board_search"));
		if (request.getParameter("board_search")==null || request.getParameter("board_search").equals("")) {
			// 게시판 검색 X 경우
			List<AdminTO> deal_management = adminDAO.deal_management();
			model.addAttribute("deal_management", deal_management);
		} else {
			// 게시판 검색 O 경우
			List<AdminTO> deal_management_search = adminDAO.deal_management_search(to.getBoard_search());
			model.addAttribute("deal_management", deal_management_search);
		}
		return "chacarge_admin_deal";
	}
	
	@RequestMapping(value = "/chacarge_admin_statistics_visitor.do", method = RequestMethod.GET)
	public String chacarge_admin_statistics_visitor(Locale locale, Model model) {

		// 방문자 수 통계 데이터 받기
		List<AdminTO> statistics_visitor = adminDAO.statistics_visitor();
		model.addAttribute("statistics_visitor", statistics_visitor);
		
		return "chacarge_admin_statistics_visitor";
	}
	
	@RequestMapping(value = "/chacarge_admin_statistics_member.do", method = RequestMethod.GET)
	public String chacarge_admin_statistics_member(Locale locale, Model model) {
		
		// 회원 가입자 수 통계 데이터 받기
		List<AdminTO> statistics_member = adminDAO.statistics_member();
		model.addAttribute("statistics_member", statistics_member);
		
		return "chacarge_admin_statistics_member";
	}
	
	@RequestMapping(value = "/chacarge_admin_statistics_deal.do", method = RequestMethod.GET)
	public String chacarge_admin_statistics_deal(Locale locale, Model model) {

		// 게시물 수 통계 데이터 받기
		List<AdminTO> statistics_deal = adminDAO.statistics_deal();
		model.addAttribute("statistics_deal", statistics_deal);
		
		return "chacarge_admin_statistics_deal";
	}
	
	@RequestMapping(value = "/chacarge_login.do", method = RequestMethod.GET)
	public String chacarge_login(@ModelAttribute("loginTO") LoginTO loginTO ) {

		return "chacarge_login";
	}
	
	@RequestMapping(value = "/chacarge_login_ok.do", method = RequestMethod.POST)
	public void chacarge_login_ok(HttpServletRequest request, HttpSession httpSession, Model model ) throws Exception {
		LoginTO loginTO = new LoginTO();
		loginTO.setUserId( request.getParameter( "user_id" ) );
		loginTO.setUserPw( request.getParameter( "user_password" ) );
		
		UserTO userTO = userService.login_ok( loginTO );
		
		if( userTO == null || !BCrypt.checkpw( loginTO.getUserPw(), userTO.getUser_password() ) ) {
			return;
		}
		
		model.addAttribute( "user", userTO );
	}
	
	@RequestMapping(value = "/chacarge_logout.do", method = RequestMethod.GET )
	public String chacarge_logout( HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception {
		
		Object object = httpSession.getAttribute( "login" );
		if( object != null ) {
			UserTO userTO = (UserTO) object;
			httpSession.removeAttribute( "login" );
			httpSession.invalidate();
			Cookie loginCookie = WebUtils.getCookie( request, "loginCookie" );
			if( loginCookie != null ) {
				loginCookie.setPath( "/" );
				loginCookie.setMaxAge( 0 );
				response.addCookie( loginCookie );
			}
		}
		
		return "chacarge_logout";
	}

	@RequestMapping(value = "/chacarge_join_ok.do", method = RequestMethod.POST)
	public String chacarge_join_ok(HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
		UserTO to = new UserTO();
		to.setUser_id( request.getParameter( "user_join_id" ) );
		to.setUser_password( request.getParameter( "user_join_password" ) );
		to.setUser_name( request.getParameter( "user_join_name" ) );
		to.setUser_email( request.getParameter( "user_join_email" ) );
		
		String hashedPw = BCrypt.hashpw( to.getUser_password(), BCrypt.gensalt() );
		to.setUser_password( hashedPw );
		
		if( to.getUser_id().startsWith( "AdminCar" ) ) {
			userService.join_admin_ok( to );
		} else {
			userService.join_ok( to );
		}
		
		redirectAttributes.addFlashAttribute( "msg", "join_ok" );
		
		return "redirect:/chacarge_login.do";
	}
	
	@RequestMapping(value="/uploadSummernoteImageFile.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
		/*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/image/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/image/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
}
