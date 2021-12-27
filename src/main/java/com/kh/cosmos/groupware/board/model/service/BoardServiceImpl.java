package com.kh.cosmos.groupware.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.groupware.board.model.dao.BoardDao;
import com.kh.cosmos.groupware.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;

	@Override
	public int createBoardRoom(Board board) {
		// TODO Auto-generated method stub
		return boardDao.createBoardRoom(board);
	}

}
