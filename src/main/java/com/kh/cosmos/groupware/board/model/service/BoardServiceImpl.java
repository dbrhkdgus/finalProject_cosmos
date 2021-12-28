package com.kh.cosmos.groupware.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.groupware.board.model.dao.BoardDao;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.board.model.vo.Post;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;

	@Override
	public int createBoardRoom(Board board) {
		// TODO Auto-generated method stub
		return boardDao.createBoardRoom(board);
	}

	@Override
	public List<Post> selectAllPostInBoard(int boardNo) {
		// TODO Auto-generated method stub
		return boardDao.selectAllPostInBoard(boardNo);
	}

	
}
