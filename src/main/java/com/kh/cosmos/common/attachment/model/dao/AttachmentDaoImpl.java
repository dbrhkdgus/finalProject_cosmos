package com.kh.cosmos.common.attachment.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.common.attachment.model.vo.Attachment;

@Repository
public class AttachmentDaoImpl implements AttachmentDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<Attachment> selectGroupAttachmentList() {
		// TODO Auto-generated method stub
		return session.selectList("attachment.selectGroupAttachmentList");
	}

	@Override
	public Attachment selectGroupAttachmentListByGroupNo(String groupNo) {
		// TODO Auto-generated method stub
		return session.selectOne("attachment.selectGroupAttachmentListByGroupNo",groupNo);
	}
	
}
