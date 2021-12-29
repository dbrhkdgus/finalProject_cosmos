package com.kh.cosmos.groupware.fileBoard.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.groupware.board.model.vo.Post;
import com.kh.cosmos.groupware.board.model.vo.PostWithCategory;
import com.kh.cosmos.groupware.fileBoard.vo.FileEnroll;

@Repository
public class FileBoardDaoImpl implements FileBoardDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<PostWithCategory> selectAllPostInfileBoard(int boardNo) {
		// TODO Auto-generated method stub
		return session.selectList("fileBoard.selectAllPostInfileBoard",boardNo);
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
	public Attachment selectOneAttachment(int attachNo) {
		// TODO Auto-generated method stub
		return  session.selectOne("fileBoard.selectOneAttachment", attachNo);
	}


		
}
