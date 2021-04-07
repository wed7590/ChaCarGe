package net.chacarge.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import net.chacarge.model1.BoardDAO;
import net.chacarge.model1.BoardTO;
import net.chacarge.model1.CommentTO;
import net.chacarge.model1.PictureTO;
import net.chacarge.model1.UserTO;

@Service
public class BoardService {
	private final BoardDAO boardDAO;
	
	@Inject
	public BoardService(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}
	
	public List<CommentTO> board_view_com( BoardTO bto ) {
		List<CommentTO> lcto = boardDAO.board_view_com( bto );
		// user_seq로 user_id 구해서 cto에 넣기
		for( CommentTO cto : lcto ) {
			UserTO uto = new UserTO();
			String user_seq = cto.getUser_seq();
			cto.setUser_id( boardDAO.select_user_id(cto).getUser_id() );
		}
		return lcto;
	}
	
	// 매물 게시판 write
	public void board_write(List<MultipartFile> fileList) throws Exception {
		// 업로드한 파일이 없으면 실행되지 않음
		if(fileList != null){
			// 파일이 저장될 경로 설정
			// resources/image/ 에 저장하고 싶음
			//String path = request.getSession().getServletContext().getRealPath( "/resource/image/" );
			// 윈도우 로컬용 업로드 경로
			//String path = "C://upload/";
			// 리눅스 서버용 업로드 경로
			String path = "/home/upload/";
			
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
					String saveFileName = random + "_" + originalfilename;
					//저장될 파일 경로
					String savePath = path + saveFileName;
					//파일사이즈
					int fileSize = (int) fileList.get(i).getSize();
					//파일 저장
					fileList.get(i).transferTo(new File(savePath));
					
					PictureTO pto = new PictureTO();
					pto.setO_pic_name( originalfilename );
					pto.setU_pic_name( saveFileName );
					
					boardDAO.board_upload( pto );
				}
			}
		}
	}
	
	// 매물 게시판 DB delete
	public int board_delete(BoardTO boardTO) {
		int result = boardDAO.board_delete(boardTO);
		if( result == 1 ) {
			return result;
		}
		return 0;
	}
	
	// 사진 DB 삭제
	public void board_delete_pic(BoardTO boardTO) {
		boardDAO.board_delete_pic(boardTO);
	}
	
	// 실제 파일 삭제
	public void board_real_delete_pic(List<PictureTO> lpto) {
		for( PictureTO pto : lpto ) {
			// 윈도우 로컬용 삭제 경로
			//String filePath = "C://upload/" + pto.getU_pic_name();
			// 리눅스 서버용 삭제 경로
			String filePath = "/home/upload/" + pto.getU_pic_name();
			File deleteFile = new File(filePath);
			
			// 파일이 존재하는지 체크 존재할 경우 true, 존재하지 않을 경우 false
			if( deleteFile.exists() ) {
				// 파일을 삭제합니다.
				deleteFile.delete();
			}
		}
		
	}
	
	// 매물 정보 수정
	public int board_modify( List<MultipartFile> fileList, BoardTO bto ) throws Exception {
		List<PictureTO> lpto = boardDAO.board_view_pic(bto);
		System.out.println( "원래 업로드된 파일 수: " + lpto.size() );
		System.out.println( "업로드 할 파일 수: " + fileList.size() );
		System.out.println( fileList.get(1).getOriginalFilename() );
		int process = 0;
		if( fileList.size() == 2 ) {
			if( fileList.get(1).getOriginalFilename().equals( "" ) ) {
				// 업로드 X
				process = 1;
			} else {
				// 1개 파일 업로드
				process = 0;
			}	
		}
		int flag = 0;
		
		switch(process) {
		case 0:
			// 파일을 새로 업로드 할때
			// 기존 파일 DB 내용 삭제, 실제 파일 삭제, 새로 파일 DB 쓰기, 게시판 내용 수정 + 파일 업로드
			boardDAO.board_delete_pic( bto );
			board_real_delete_pic( lpto );
			board_write( fileList );
			flag = boardDAO.board_modify_ok( bto );
			break;
		case 1:
			// 파일은 그대로인 경우
			// 게시판 내용만 수정 
			flag = boardDAO.board_modify_ok( bto );
			break;
		default:
		}
		
		return flag;
	}

}
