package com.kh.cosmos.groupware.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.groupware.board.model.dao.BoardDao;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.board.model.vo.Post;
import com.kh.cosmos.groupware.board.model.vo.PostReplyCount;
import com.kh.cosmos.groupware.board.model.vo.PostWithNickname;
import com.kh.cosmos.main.model.vo.Reply;
import com.kh.cosmos.member.model.vo.MemberWithGroup;

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
	public List<Post> selectAllPostInBoard(int boardNo, int limit, int offset) {
		// TODO Auto-generated method stub
		return boardDao.selectAllPostInBoard(boardNo,limit,offset);
	}

	@Override
	public List<Post> selectAllPostInNotice(int boardNo, int limit, int offset) {
		// TODO Auto-generated method stub
		return  boardDao.selectAllPostInNotice(boardNo, limit, offset);
	}

	@Override
	public int insertPost(Post post) {
		// TODO Auto-generated method stub
		return boardDao.insertPost(post);
	}

	@Override
	public int insertPostReply(Reply reply) {
		// TODO Auto-generated method stub
		return boardDao.insertPostReply(reply);
	}

	@Override
	public int insertAttach(Attachment attach) {
		// TODO Auto-generated method stub
		return boardDao.insertAttach(attach);
	}

	@Override
	public int insertPostFile(Post post) {
		// TODO Auto-generated method stub
		return boardDao.insertPostFile(post);
	}

	@Override
	public Board selectBoardByBoardNo(int boardNo) {
		// TODO Auto-generated method stub
		return boardDao.selectBoardByBoardNo(boardNo);
	}

	@Override
	public int selectPostInBoardTotalCount(int boardNo) {
		// TODO Auto-generated method stub
		return boardDao.selectPostInBoardTotalCount(boardNo);
	}

	@Override
	public List<MemberWithGroup> memberWithGroupList(int groupNo) {
		// TODO Auto-generated method stub
		return boardDao.memberWithGroupList(groupNo);
	}

	@Override
	public List<Reply> selectReplyListByPostNo(int postNo) {
		// TODO Auto-generated method stub
		return boardDao.selectReplyListByPostNo(postNo);
	}

	@Override
	public List<Attachment> selectProfileAttachmentList() {
		// TODO Auto-generated method stub
		return boardDao.selectProfileAttachmentList();
	}

	@Override
	public int updateBoardRoom(Board board) {
		// TODO Auto-generated method stub
		return boardDao.updateBoardRoom(board);
	}

	@Override
	public int deleteBoardRoom(Board board) {
		// TODO Auto-generated method stub
		return boardDao.deleteBoardRoom(board);
	}

	public Post selectOnePostInBoard(int postNo) {
		// TODO Auto-generated method stub
		return boardDao.selectOnePostInBoard(postNo);
	}

	@Override
	public Attachment selectOneAttachInBoard(int attachNo) {
		// TODO Auto-generated method stub
		return boardDao.selectOneAttachInBoard(attachNo);
	}

	@Override
	public Post selectOnePostInNotice(int postNo) {
		// TODO Auto-generated method stub
		return boardDao.selectOnePostInNotice(postNo);
	}

	@Override
	public int updatePostFile(Post post) {
		// TODO Auto-generated method stub
		return boardDao.updatePostFile(post);
	}

	@Override
	public int updatePost(Post post) {
		// TODO Auto-generated method stub
		return boardDao.updatePost(post);
	}

	@Override
	public int deletePostInBoard(int postNo) {
		// TODO Auto-generated method stub
		return boardDao.deletePostInBoard(postNo);
	}

	@Override
	public int deleteAttachInBoard(int attachNo) {
		// TODO Auto-generated method stub
		return boardDao.deleteAttachInBoard(attachNo);
	}

	@Override
	public List<Post> selectAllPostInAnonymous(int boardNo, int limit, int offset) {
		// TODO Auto-generated method stub
		return  boardDao.selectAllPostInAnonymous(boardNo, limit, offset);
	}

	@Override
	public Post selectOnePostInAnonymous(int postNo) {
		// TODO Auto-generated method stub
		return boardDao.selectOnePostInAnonymous(postNo);
	}

	@Override
	public int insertPostInAnonymous(Post post) {
		// TODO Auto-generated method stub
		return boardDao.insertPostInAnonymous(post);
	}

	@Override
	public int deletePostInAnonymous(int postNo) {
		// TODO Auto-generated method stub
		return boardDao.deletePostInAnonymous(postNo);
	}

	@Override
	public int updatePostInAnonymous(Post post) {
		// TODO Auto-generated method stub
		return boardDao.updatePostInAnonymous(post);
	}

	@Override
	public int updatePostReply(Reply reply) {
		// TODO Auto-generated method stub
		return boardDao.updatePostReply(reply);
	}

	@Override
	public int deletePostReply(Reply reply) {
		// TODO Auto-generated method stub
		return boardDao.deletePostReply(reply);
	}

	@Override
	public List<PostWithNickname> searchBoardList(Map<String, Object> param, int limit, int offset) {
		// TODO Auto-generated method stub
		return boardDao.searchBoardList(param, limit, offset);
	}
	
	@Override
	public int selectSearchBoardTotalCnt(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return boardDao.selectSearchBoardTotalCnt(param);
	}

	@Override
	public int insertAnonymousReply(Reply reply) {
		// TODO Auto-generated method stub
		return boardDao.insertAnonymousReply(reply);
	}

	@Override
	public Reply selectOneReply(int replyNo) {
		// TODO Auto-generated method stub
		return boardDao.selectOneReply(replyNo);
	}

	@Override
	public List<PostReplyCount> selectReplyCount() {
		// TODO Auto-generated method stub
		return boardDao.selectReplyCount();
	}

	
	
}
