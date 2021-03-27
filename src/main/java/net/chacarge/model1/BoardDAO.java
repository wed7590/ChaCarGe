package net.chacarge.model1;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.chacarge.model1.BoardTO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;

	// list
	public List<BoardTO> boardList() {
		List<BoardTO> boardLists = sqlSession.selectList("board_list");
		return boardLists;
	}
	
	// write_ok
	public int boardWriteOk(BoardTO to) {
		int flag = 1;
		int result = sqlSession.insert("board_write_ok", to);
		if (result == 1) {
			flag = 0;
		}
		return flag;
	}
	
	public void boardUpload(PictureTO to) {
		sqlSession.insert("board_write_pic", to );
	}
	
	// view
	public void boardView_hit(BoardTO to) {
		sqlSession.update("board_view_hit", to );
	}
	
	public BoardTO boardView(BoardTO to) {
		return sqlSession.selectOne("board_view", to );
	}
	
	public List<PictureTO> boardView_pic(BoardTO to) {
		return sqlSession.selectList( "board_view_pic", to );
	}
	
	// delete
	public int boardDelete(BoardTO to) {
		return sqlSession.delete( "board_delete", to);
	}
	
	public int boardDelete_pic(BoardTO to) {
		return sqlSession.delete("board_delete_pic", to);
	}

	
}
