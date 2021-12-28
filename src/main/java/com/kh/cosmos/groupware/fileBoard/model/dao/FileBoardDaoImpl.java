package com.kh.cosmos.groupware.fileBoard.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.common.attachment.model.vo.Attachment;

@Repository
public class FileBoardDaoImpl implements FileBoardDao {
	@Autowired
	SqlSession session;
	
	@Override
	public int insertFileAttach(Attachment attach) {
		return session.insert("fileboard.insertFileAttach");
	}

		
}
