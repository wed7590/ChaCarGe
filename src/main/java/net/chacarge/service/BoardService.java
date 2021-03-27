package net.chacarge.service;

import java.io.File;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.chacarge.model1.BoardDAO;
import net.chacarge.model1.BoardTO;
import net.chacarge.model1.PictureTO;

@Service
public class BoardService {
	private final BoardDAO boardDAO;
	
	@Inject
	public BoardService(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}
	
	// 매물 게시판 DB 삭제
	public int boardDelete(BoardTO boardTO) {
		int result = boardDAO.boardDelete(boardTO);
		if( result == 1 ) {
			return result;
		}
		return 0;
	}
	
	// 사진 DB 삭제
	public void boardDelete_pic(BoardTO boardTO) {
		boardDAO.boardDelete_pic(boardTO);
	}
	
	// 실제 파일 삭제
	public void boardRealDelete_pic(List<PictureTO> list_pic) {
		for( PictureTO pictureTO : list_pic ) {
			String filePath = "C://upload/" + pictureTO.getU_pic_name();
			File deleteFile = new File(filePath);
			
			// 파일이 존재하는지 체크 존재할 경우 true, 존재하지 않을 경우 false
			if( deleteFile.exists() ) {
				// 파일을 삭제합니다.
				deleteFile.delete();
			}
		}
		
	}
}
