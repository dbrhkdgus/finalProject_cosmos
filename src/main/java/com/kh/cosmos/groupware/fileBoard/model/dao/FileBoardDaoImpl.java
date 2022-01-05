package com.kh.cosmos.groupware.fileBoard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.groupware.board.model.vo.Post;
import com.kh.cosmos.groupware.board.model.vo.PostWithCategory;
import com.kh.cosmos.groupware.board.model.vo.PostWithNickname;
import com.kh.cosmos.groupware.fileBoard.vo.IdNickName;

@Repository
public class FileBoardDaoImpl implements FileBoardDao {

	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<PostWithCategory> selectAllPostInfileBoard(int boardNo, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("fileBoard.selectAllPostInfileBoard", boardNo, rowBounds);
	}
	
	@Override
	public int insertFileAttach(Attachment attach) {
		return session.insert("fileBoard.insertFileAttach",attach);
	}

	@Override
	public int insertFilePost(Post post) {
		return session.insert("fileBoard.insertFilePost",post);
	}

	@Override
	public List<Attachment> selectAttachmentList() {
		return session.selectList("fileBoard.selectAttachmentList");
	}


	@Override
	public int selectSearchFileBoardTotalCnt(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("fileBoard.selectSearchFileBoardTotalCnt", param);
	}

	@Override
	public Attachment selectOneAttachment(int attachNo) {
		return  session.selectOne("fileBoard.selectOneAttachment", attachNo);
	}

	@Override
	public int deleteFilePost(int postNo) {
		return session.delete("fileBoard.deleteFilePost",postNo);
	}

	@Override
	public int deleteOneAttach(int attachNo) {
		return session.delete("fileBoard.deleteOneAttach",attachNo);
	}
	
	@Override
	public List<PostWithNickname> selectAllFileBoardListByParam(Map<String, Object> param, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("fileBoard.selectAllFileBoardListByParam", param, rowBounds);
	}

	@Override
	public List<IdNickName> selectIdNickName() {
		// TODO Auto-generated method stub
		return session.selectList("fileBoard.selectIdNickName");
	}

	@Override
	public int selectPostInFileBoardTotalCount(int boardNo) {
		// TODO Auto-generated method stub
		return session.selectOne("fileBoard.selectPostInFileBoardTotalCount", boardNo);
	}


	
		
}
