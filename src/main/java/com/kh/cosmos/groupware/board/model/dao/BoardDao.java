package com.kh.cosmos.groupware.board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.board.model.vo.Post;
import com.kh.cosmos.groupware.board.model.vo.PostReplyCount;
import com.kh.cosmos.groupware.board.model.vo.PostWithNickname;
import com.kh.cosmos.main.model.vo.Reply;
import com.kh.cosmos.member.model.vo.MemberWithGroup;

public interface BoardDao {

	int createBoardRoom(Board board);
	
	List<Post> selectAllPostInBoard(int boardNo, int limit, int offset);

	int insertPost(Post post);
	
	int insertPostReply(Reply reply);

	int insertAttach(Attachment attach);

	int insertPostFile(Post post);

	Board selectBoardByBoardNo(int boardNo);

	int selectPostInBoardTotalCount(int boardNo);

	List<MemberWithGroup> memberWithGroupList(int groupNo);
	
	List<Reply> selectReplyListByPostNo(int postNo);
	
	List<Attachment> selectProfileAttachmentList();

	int updateBoardRoom(Board board);

	int deleteBoardRoom(Board board);
	
	Attachment selectOneAttachInBoard(int attachNo);

	Post selectOnePostInBoard(int postNo);
	
	int updatePostFile(Post post);
	
	int updatePost(Post post);
	
	int deletePostInBoard(int postNo);

	int deleteAttachInBoard(int attachNo);

	int insertPostInAnonymous(Post post);

	int deletePostInAnonymous(int postNo);

	int updatePostReply(Reply reply);

	int deletePostReply(Reply reply);

	List<PostWithNickname> searchBoardList(Map<String, Object> param, int limit, int offset);

	int insertAnonymousReply(Reply reply);

	Reply selectOneReply(int replyNo);

	int selectSearchBoardTotalCnt(Map<String, Object> param);
	
	List<PostReplyCount> selectReplyCount();

	int postViewCountUp(int postNo);

}
