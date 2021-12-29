package com.kh.cosmos.groupware.board.model.dao;

import java.util.List;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.board.model.vo.Post;

public interface BoardDao {

	int createBoardRoom(Board board);

	List<Post> selectAllPostInBoard(int boardNo);

	List<Post> selectAllPostInNotice(int boardNo);

	int insertPost(Post post);

	int insertAttach(Attachment attach);

	int insertPostFile(Post post);

}
