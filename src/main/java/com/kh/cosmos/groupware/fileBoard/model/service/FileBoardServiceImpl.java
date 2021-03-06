package com.kh.cosmos.groupware.fileBoard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.groupware.board.model.vo.Post;
import com.kh.cosmos.groupware.board.model.vo.PostWithCategory;
import com.kh.cosmos.groupware.board.model.vo.PostWithNickname;
import com.kh.cosmos.groupware.fileBoard.model.dao.FileBoardDao;
import com.kh.cosmos.groupware.fileBoard.vo.IdNickName;

@Service
public class FileBoardServiceImpl implements FileBoardService {

	@Autowired
	private FileBoardDao fileBoardDao;
	@Override
	public List<PostWithCategory> selectAllPostInfileBoard(int boardNo, int limit, int offset) {
		return fileBoardDao.selectAllPostInfileBoard(boardNo, limit, offset);
	}

	@Override
	public int insertFileAttach(Attachment attach) {
		return fileBoardDao.insertFileAttach(attach);
	}

	@Override
	public int insertFilePost(Post post) {
		return fileBoardDao.insertFilePost(post);
	}
	
	@Override
	public Attachment selectOneAttachment(int attachNo) {
		return fileBoardDao.selectOneAttachment(attachNo);
	}

	@Override
	public int selectSearchFileBoardTotalCnt(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return fileBoardDao.selectSearchFileBoardTotalCnt(param);
	}

	@Override
	public List<Attachment> selectAttachmentList() {
		return fileBoardDao.selectAttachmentList();
	}

	@Override
	public int deleteFilePost(int postNo) {
		return fileBoardDao.deleteFilePost(postNo);
	}

	@Override
	public int deleteOneAttach(int attachNo) {
		return fileBoardDao.deleteOneAttach(attachNo);
	}
	
	
	@Override
	public List<PostWithNickname> selectAllFileBoardListByParam(Map<String, Object> param, int limit, int offset) {
		// TODO Auto-generated method stub
		return fileBoardDao.selectAllFileBoardListByParam(param, limit, offset);
	}

	@Override
	public List<IdNickName> selectIdNickName() {
		// TODO Auto-generated method stub
		return fileBoardDao.selectIdNickName();
	}

	@Override
	public int selectPostInFileBoardTotalCount(int boardNo) {
		// TODO Auto-generated method stub
		return fileBoardDao.selectPostInFileBoardTotalCount(boardNo);
	}
	
	
		
}
