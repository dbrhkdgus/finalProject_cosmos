package com.kh.cosmos.groupware.board.model.service;

import java.util.List;

import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.board.model.vo.Post;

public interface BoardService {

	int createBoardRoom(Board board);

	List<Post> selectAllPostInBoard(int boardNo);

	List<Post> selectAllPostInNotice(int boardNo);

}
