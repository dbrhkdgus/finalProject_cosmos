package com.kh.cosmos.groupware.fileBoard.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.groupware.board.model.vo.Post;
import com.kh.cosmos.groupware.fileBoard.vo.FileEnroll;

@Repository
public class FileBoardDaoImpl implements FileBoardDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertFileAttach(Attachment attach) {
		return session.insert("fileBoard.insertFileAttach",attach);
	}

	@Override
	public int insertFilePost(Post post) {
		return session.insert("fileBoard.insertFilePost",post);
	}



		
}
