package com.kh.cosmos.common.attachment.model.service;

import java.util.List;

import com.kh.cosmos.common.attachment.model.vo.Attachment;

public interface AttachmentService {

	List<Attachment> selectGroupAttachmentList();

	Attachment selectGroupAttachmentListByGroupNo(String groupNo);

}
