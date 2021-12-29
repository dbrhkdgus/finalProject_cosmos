package com.kh.cosmos.groupware.board.model.service;

import java.util.List;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.board.model.vo.Post;
import com.kh.cosmos.member.model.vo.MemberWithGroup;

public interface BoardService {

	int createBoardRoom(Board board);

	List<Post> selectAllPostInBoard(int boardNo, int limit, int offset);

	List<Post> selectAllPostInNotice(int boardNo, int limit, int offset);

	int insertPost(Post post);

	int insertAttach(Attachment attach);

	int insertPostFile(Post post);

	Board selectBoardByBoardNo(int boardNo);

	int selectPostInBoardTotalCount(int boardNo);

	int updateBoardRoom(Board board);

	List<MemberWithGroup> memberWithGroupList(int groupNo);
	
	

}
