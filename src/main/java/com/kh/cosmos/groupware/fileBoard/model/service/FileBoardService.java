package com.kh.cosmos.groupware.fileBoard.model.service;

import java.util.List;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.groupware.board.model.vo.Post;
import com.kh.cosmos.groupware.board.model.vo.PostWithCategory;
import com.kh.cosmos.groupware.fileBoard.vo.FileEnroll;

public interface FileBoardService {

	int insertFileAttach(Attachment attach);

	int insertFilePost(Post post);

	List<PostWithCategory> selectAllPostInfileBoard(int boardNo);

	Attachment selectOneAttachment(int attachNo);

	List<Attachment> selectAttachmentList();



}
