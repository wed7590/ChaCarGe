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
import javax.servlet.http.HttpSession;

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
import net.chacarge.model1.CommentTO;
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

		List<BoardTO> boardLists = boardDAO.board_list();
		
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
		BoardTO bto = new BoardTO();
		bto.setBoard_subject( request.getParameter( "board_subject" ) );
		bto.setBoard_content( request.getParameter( "board_content" ) );

		UserTO uto = new UserTO();
		uto.setUser_seq( request.getParameter( "user_seq" ) );
		uto = userDAO.id_check( uto );
		
		bto.setUser_seq( uto.getUser_seq() );
		
		// 글쓰기
		int flag = boardDAO.board_write_ok(bto) ;
		
		// 파일 업로드
		boardService.board_write(fileList);
		
		model.addAttribute( "flag", flag );
		
		return "chacarge_deal_write_ok";
	}
	
	@RequestMapping(value = "/chacarge_deal_view.do", method = RequestMethod.GET)
	public String chacarge_deal_view(HttpServletRequest request, Model model) {
		BoardTO bto = new BoardTO();
		
		bto.setBoard_seq( request.getParameter( "seq" ) );

		boardDAO.board_view_hit(bto);
		bto = boardDAO.board_view( bto );
		
		List<CommentTO> lcto = boardService.board_view_com( bto );
		List<PictureTO> lpto = boardDAO.board_view_pic( bto );
		
		model.addAttribute( "bto", bto );
		model.addAttribute( "lpto", lpto );
		model.addAttribute( "lcto", lcto );
		
		return "chacarge_deal_view";
	}
	
	@RequestMapping(value = "/chacarge_deal_comment_write.do", method = RequestMethod.POST)
	public String chacarge_deal_comment_write(HttpServletRequest request, Model model) {
		CommentTO cto = new CommentTO();
		
		cto.setBoard_seq( request.getParameter( "board_seq" ) );
		String board_seq = cto.getBoard_seq();
		cto.setComment_content( request.getParameter( "ccontent" ) );
		cto.setUser_seq( request.getParameter( "user_seq" ) );
		
		int flag = boardDAO.board_comment_write( cto );
		
		model.addAttribute( "seq", board_seq );
		model.addAttribute( "flag", flag );
		
		return "chacarge_deal_comment_write";
	}
	
	@RequestMapping(value = "/chacarge_deal_comment_delete.do", method = RequestMethod.POST)
	public String chacarge_deal_comment_delete(HttpServletRequest request, Model model, HttpSession httpSession) {
		CommentTO cto = new CommentTO();
		cto.setComment_seq( request.getParameter( "comment_seq" ) );
		cto = boardDAO.board_comment_id_check(cto);
		
		Object object = httpSession.getAttribute( "login" );
		UserTO userTO = (UserTO) object;
		String login_seq = userTO.getUser_seq();
		
		int flag = 0;
		// 작성자 체크( 댓글 작성자 seq == 로그인 seq)
		if( boardDAO.board_comment_id_check(cto).getUser_seq().equals(login_seq) ) {
			flag = boardDAO.board_comment_delete( cto );
		}
		
		model.addAttribute( "seq", cto.getBoard_seq() );
		model.addAttribute( "flag", flag );
		
		return "chacarge_deal_comment_delete";
	}
	
	@RequestMapping(value = "/chacarge_deal_delete.do", method = RequestMethod.GET)
	public String chacarge_deal_delete(HttpServletRequest request, Model model) {
		UserTO uto = new UserTO();
		uto.setUser_seq( request.getParameter( "user_seq" ) );
		
		BoardTO bto = new BoardTO();
		bto.setBoard_seq( request.getParameter( "seq" ) );

		List<PictureTO> pto = boardDAO.board_view_pic( bto );
		
		bto = boardDAO.board_view(bto);
		
		int flag = 2;
		if( bto.getUser_seq().equals( uto.getUser_seq() ) ) {
			boardService.board_delete_pic( bto );
			boardService.board_real_delete_pic( pto );
			flag = boardService.board_delete( bto );
		}
		
		model.addAttribute( "flag", flag );
		return "chacarge_deal_delete_ok";
	}
	
	@RequestMapping(value = "/chacarge_deal_modify.do", method = RequestMethod.GET)
	public String chacarge_deal_modify(HttpServletRequest request, HttpServletResponse response, Model model ) throws Exception {
		
		int flag = 2;

		model.addAttribute( "flag", flag );
		UserTO uto = new UserTO();
		if( request.getParameter( "user_seq" ) == null || request.getParameter( "user_seq" ).equals( "" ) ) {
			// 로그인 안했을시
			return "chacarge_deal_delete_ok";
		}
		
		uto.setUser_seq( request.getParameter( "user_seq" ) );
		
		BoardTO bto = new BoardTO();
		bto.setBoard_seq( request.getParameter( "seq" ) );

		List<PictureTO> lpto = boardDAO.board_view_pic( bto );
		
		bto = boardDAO.board_view(bto);
		
		if( bto.getUser_seq().equals( uto.getUser_seq() ) ) {
			// 로그인 아이디가 작성자 일때
			bto = boardDAO.board_view( bto );
			lpto = boardDAO.board_view_pic( bto );
			flag = 1;
		}
		
		model.addAttribute( "bto", bto );
		model.addAttribute( "lpto", lpto );
		model.addAttribute( "flag", flag );
		
		return "chacarge_deal_modify";
	}
	
	@RequestMapping(value = "/chacarge_deal_modify_ok.do", method = RequestMethod.POST)
	public String chacarge_deal_modify_ok(MultipartHttpServletRequest request, HttpServletResponse response, Model model, @RequestParam("files") List<MultipartFile> fileList ) throws Exception {
		
		// board 정보 
		BoardTO bto = new BoardTO();
		bto.setBoard_seq( request.getParameter( "board_seq" ) );
		bto.setBoard_subject( request.getParameter( "board_subject" ) );
		bto.setBoard_content( request.getParameter( "board_content" ) );
		
		int flag = boardService.board_modify( fileList, bto );

		model.addAttribute( "flag", flag );
		model.addAttribute( "bto", bto );

		return "chacarge_deal_modify_ok";
	}
}
