package com.kh.cosmos.groupware.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.board.model.vo.Post;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public int createBoardRoom(Board board) {
		// TODO Auto-generated method stub
		return session.insert("board.createBoardRoom", board);
	}

	@Override
	public List<Post> selectAllPostInBoard(int boardNo) {
		// TODO Auto-generated method stub
		return session.selectList("board.selectAllPostInBoard", boardNo);
	}

	
}
