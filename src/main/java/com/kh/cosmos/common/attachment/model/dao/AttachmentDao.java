package com.kh.cosmos.common.attachment.model.dao;

import java.util.List;

import com.kh.cosmos.common.attachment.model.vo.Attachment;

public interface AttachmentDao {

	List<Attachment> selectGroupAttachmentList();

}
