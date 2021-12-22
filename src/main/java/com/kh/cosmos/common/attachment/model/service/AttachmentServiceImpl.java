package com.kh.cosmos.common.attachment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.common.attachment.model.dao.AttachmentDao;
import com.kh.cosmos.common.attachment.model.vo.Attachment;

@Service
public class AttachmentServiceImpl implements AttachmentService {
	@Autowired
	private AttachmentDao attachmentDao;

	@Override
	public List<Attachment> selectGroupAttachmentList() {
		// TODO Auto-generated method stub
		return attachmentDao.selectGroupAttachmentList();
	}

	@Override
	public Attachment selectGroupAttachmentListByGroupNo(String groupNo) {
		// TODO Auto-generated method stub
		return attachmentDao.selectGroupAttachmentListByGroupNo(groupNo);
	}
	
}
