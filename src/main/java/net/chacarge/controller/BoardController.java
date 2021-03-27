package net.chacarge.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import net.chacarge.model1.BoardDAO;
import net.chacarge.model1.BoardTO;
import net.chacarge.model1.PictureTO;
import net.chacarge.model1.UserDAO;
import net.chacarge.model1.UserTO;
import net.chacarge.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private BoardDAO boardDAO;
	private final BoardService boardService;
	
	@Inject
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
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
	public String chacarge_deal_write_ok(MultipartHttpServletRequest request, HttpServletResponse response, Model model, @RequestParam("files") List<MultipartFile> fileList ) throws Exception {
		
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
		
		PictureTO pictureTO = new PictureTO();
		
		// 업로드한 파일이 없으면 실행되지 않음
		if(fileList != null){
			// 파일이 저장될 경로 설정
			// resources/image/ 에 저장하고 싶음
			//String path = request.getSession().getServletContext().getRealPath( "/resource/image/" );
			String path = "C://upload/";
			System.out.println( path );
			File dir = new File(path);
			if(!dir.isDirectory()){
				dir.mkdirs();
			}
		
			if(!fileList.isEmpty()){
			//넘어온 파일을 리스트로 저장
				for( int i = 1; i < fileList.size() ; i++ ) {
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
					
					boardDAO.boardUpload( pictureTO );
				}
				
				model.addAttribute( "pictureTO", pictureTO );
			}
			
		}
		
		return "chacarge_deal_write_ok";
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
	
	@RequestMapping(value = "/chacarge_deal_view.do", method = RequestMethod.GET)
	public String chacarge_deal_view(HttpServletRequest request, Model model) {
		BoardTO bto = new BoardTO();
		
		bto.setBoard_seq( request.getParameter( "seq" ) );
		
		boardDAO.boardView_hit(bto);
		bto = boardDAO.boardView( bto );
		
		List<PictureTO> pto = boardDAO.boardView_pic( bto );
		
		model.addAttribute( "bto", bto );
		model.addAttribute( "pto", pto );
		
		return "chacarge_deal_view";
	}
	
	@RequestMapping(value = "/chacarge_deal_delete.do", method = RequestMethod.GET)
	public String chacarge_deal_delete(HttpServletRequest request, Model model) {
		UserTO uto = new UserTO();
		uto.setUser_seq( request.getParameter( "user_seq" ) );
		
		BoardTO bto = new BoardTO();
		bto.setBoard_seq( request.getParameter( "seq" ) );

		List<PictureTO> pto = boardDAO.boardView_pic( bto );
		
		bto = boardDAO.boardView(bto);
		
		int flag = 2;
		if( bto.getUser_seq().equals( uto.getUser_seq() ) ) {
			boardService.boardDelete_pic( bto );
			boardService.boardRealDelete_pic( pto );
			boardService.boardDelete( bto );
			
			flag = 1;
		}
		
		model.addAttribute( "flag", flag );
		return "chacarge_deal_delete_ok";
	}
}
