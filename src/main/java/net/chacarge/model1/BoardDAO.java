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
	public List<BoardTO> board_list() {
		return sqlSession.selectList("board_list");
	}
	
	// write_ok
	public int board_write_ok(BoardTO bto) {
		int flag = 1;
		int result = sqlSession.insert("board_write_ok", bto);
		if (result == 1) {
			flag = 0;
		}
		return flag;
	}
	
	public void board_upload(PictureTO pto) {
		sqlSession.insert("board_write_pic", pto );
	}
	
	// view
	public void board_view_hit(BoardTO bto) {
		sqlSession.update("board_view_hit", bto );
	}
	
	public BoardTO board_view(BoardTO bto) {
		return sqlSession.selectOne("board_view", bto );
	}
	
	public List<PictureTO> board_view_pic(BoardTO bto) {
		return sqlSession.selectList( "board_view_pic", bto );
	}
	
	// 댓글 보기
	public List<CommentTO> board_view_com(BoardTO bto) {
		return sqlSession.selectList( "board_view_com", bto );
	}
	// 댓글 작성
	public int board_comment_write(CommentTO cto ) {
		return sqlSession.insert( "board_comment_write", cto );
	}
	// 댓글 작성자 확인
	public CommentTO board_comment_id_check( CommentTO cto ) {
		return sqlSession.selectOne( "board_comment_id_check", cto );
	}
	// 댓글 삭제
	public int board_comment_delete( CommentTO cto ) {
		return sqlSession.delete( "board_comment_delete", cto );
	}
	
	
	// user_seq로 user_id 가져오기
	public CommentTO select_user_id(CommentTO cto) {
		return sqlSession.selectOne( "select_user_id", cto );
	}
	
	// delete
	public int board_delete(BoardTO bto) {
		return sqlSession.delete( "board_delete", bto);
	}
	
	public int board_delete_pic(BoardTO bto) {
		return sqlSession.delete("board_delete_pic", bto);
	}

	// modify_ok
	public int board_modify_ok(BoardTO bto) {
		int flag = 1;
		int result = sqlSession.update("board_modify_ok", bto);
		if (result == 1) {
			flag = 0;
		}
		return flag;
	}
		
}
