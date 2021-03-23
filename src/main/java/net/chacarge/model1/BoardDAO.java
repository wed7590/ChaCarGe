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
}
