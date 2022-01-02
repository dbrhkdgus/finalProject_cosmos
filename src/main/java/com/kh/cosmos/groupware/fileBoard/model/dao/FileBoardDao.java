package com.kh.cosmos.groupware.fileBoard.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.groupware.board.model.vo.Post;
import com.kh.cosmos.groupware.board.model.vo.PostWithCategory;
import com.kh.cosmos.groupware.fileBoard.vo.FileEnroll;
import com.kh.cosmos.groupware.fileBoard.vo.IdNickName;

public interface FileBoardDao {

	int insertFileAttach(Attachment attach);

	int insertFilePost(Post post);

	List<PostWithCategory> selectAllPostInfileBoard(int boardNo);


	Attachment selectOneAttachment(int attachNo);

	List<Attachment> selectAttachmentList();

	int deleteFilePost(int postNo);

	int deleteOneAttach(int attachNo);

	List<PostWithCategory> selectAllFileBoardListByParam(Map<String, Object> param, int limit, int offset);

	List<IdNickName> selectIdNickName();

	

}
