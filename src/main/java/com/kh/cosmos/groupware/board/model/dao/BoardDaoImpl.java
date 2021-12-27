package com.kh.cosmos.groupware.board.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.groupware.board.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public int createBoardRoom(Board board) {
		// TODO Auto-generated method stub
		return session.insert("board.createBoardRoom", board);
	}

	
}
