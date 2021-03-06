package com.kh.cosmos.groupware.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.board.model.vo.Post;
import com.kh.cosmos.groupware.board.model.vo.PostReplyCount;
import com.kh.cosmos.groupware.board.model.vo.PostWithNickname;
import com.kh.cosmos.main.model.vo.Reply;
import com.kh.cosmos.member.model.vo.MemberWithGroup;

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
	public List<Post> selectAllPostInBoard(int boardNo, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("board.selectAllPostInBoard", boardNo, rowBounds);
	}
 
	@Override
	public int insertPost(Post post) {
		// TODO Auto-generated method stub
		return session.insert("board.insertPost", post);
	}

	@Override
	public int insertPostReply(Reply reply) {
		// TODO Auto-generated method stub
		return session.insert("board.insertPostReply", reply);
	}

	@Override
	public int insertAttach(Attachment attach) {
		// TODO Auto-generated method stub
		return session.insert("board.insertAttach", attach);
	}

	@Override
	public int insertPostFile(Post post) {
		// TODO Auto-generated method stub
		return session.insert("board.insertPostFile", post);
	}

	@Override
	public Board selectBoardByBoardNo(int boardNo) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectBoardByBoardNo", boardNo);
	}

	@Override
	public int selectPostInBoardTotalCount(int boardNo) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectPostInBoardTotalCount", boardNo);
	}

	@Override
	public List<MemberWithGroup> memberWithGroupList(int groupNo) {
		// TODO Auto-generated method stub
		return session.selectList("board.memberWithGroupList", groupNo);
	}

	@Override
	public List<Reply> selectReplyListByPostNo(int postNo) {
		// TODO Auto-generated method stub
		return session.selectList("board.selectReplyListByPostNo", postNo);
	}

	@Override
	public List<Attachment> selectProfileAttachmentList() {
		// TODO Auto-generated method stub
		return session.selectList("board.selectProfileAttachmentList");
	}

	@Override
	public int updateBoardRoom(Board board) {
		// TODO Auto-generated method stub
		return session.update("board.updateBoardRoom", board);
	}
	
	@Override
	public int deleteBoardRoom(Board board) {
		// TODO Auto-generated method stub
		return session.delete("board.deleteBoardRoom", board);
	}

	public Post selectOnePostInBoard(int postNo) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectOnePostInBoard", postNo);
	}

	@Override
	public Attachment selectOneAttachInBoard(int attachNo) {
		// TODO Auto-generated method stub
		return  session.selectOne("board.selectOneAttach", attachNo);
	}

	@Override
	public int updatePostFile(Post post) {
		// TODO Auto-generated method stub
		return session.delete("board.updatePostFile", post);
	}

	@Override
	public int updatePost(Post post) {
		// TODO Auto-generated method stub
		return session.delete("board.updatePost", post);
	}

	@Override
	public int deletePostInBoard(int postNo) {
		// TODO Auto-generated method stub
		return session.delete("board.deletePostInBoard", postNo);
	}

	@Override
	public int deleteAttachInBoard(int attachNo) {
		// TODO Auto-generated method stub
		return session.delete("board.deleteAttachInBoard", attachNo);
	}

	@Override
	public int insertPostInAnonymous(Post post) {
		// TODO Auto-generated method stub
		return session.insert("board.insertPostInAnonymous", post);
	}

	@Override
	public int updatePostReply(Reply reply) {
		// TODO Auto-generated method stub
		return session.update("board.updatePostReply", reply);
	}

	@Override
	public int deletePostReply(Reply reply) {
		// TODO Auto-generated method stub
		return session.update("board.deletePostReply", reply);
	}

	@Override
	public List<PostWithNickname> searchBoardList(Map<String, Object> param, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("board.searchBoardList", param, rowBounds);
	}
	
	@Override
	public int selectSearchBoardTotalCnt(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectSearchBoardTotalCnt", param);
	}

	@Override
	public int insertAnonymousReply(Reply reply) {
		// TODO Auto-generated method stub
		return session.insert("board.insertAnonymousReply", reply);
	}

	@Override
	public Reply selectOneReply(int replyNo) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectOneReply", replyNo);
	}

	@Override
	public List<PostReplyCount> selectReplyCount() {
		// TODO Auto-generated method stub
		return session.selectList("board.selectReplyCount");
	}

	@Override
	public int postViewCountUp(int postNo) {
		// TODO Auto-generated method stub
		return session.update("board.postViewCountUp",postNo);
	}

	
	

}
	
	

