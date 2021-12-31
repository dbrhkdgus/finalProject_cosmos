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
	public List<Post> selectAllPostInNotice(int boardNo, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("board.selectAllPostInNotice", boardNo, rowBounds);
	}
 
	@Override
	public int insertPost(Post post) {
		// TODO Auto-generated method stub
		return session.insert("board.insertPost", post);
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
		return  session.selectOne("board.selectOneAttachInBoard", attachNo);
	}

	@Override
	public Post selectOnePostInNotice(int postNo) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectOnePostInNotice", postNo);
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
	public List<Post> selectAllPostInAnonymous(int boardNo, int limit, int offset) {
		// TODO Auto-generated method stub
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("board.selectAllPostInAnonymous", boardNo, rowBounds);
	}

	@Override
	public Post selectOnePostInAnonymous(int postNo) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectOnePostInAnonymous", postNo);
	}

	@Override
	public int insertPostInAnonymous(Post post) {
		// TODO Auto-generated method stub
		return session.insert("board.insertPostInAnonymous", post);
	}

	@Override
	public int deletePostInAnonymous(int postNo) {
		// TODO Auto-generated method stub
		return session.delete("board.deletePostInAnonymous", postNo);
	}

}
	
	

