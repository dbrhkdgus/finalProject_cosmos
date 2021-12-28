package com.kh.cosmos.groupware.fileBoard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.groupware.board.model.vo.Post;
import com.kh.cosmos.groupware.board.model.vo.PostWithCategory;
import com.kh.cosmos.groupware.fileBoard.model.dao.FileBoardDao;
import com.kh.cosmos.groupware.fileBoard.vo.FileEnroll;

@Service
public class FileBoardServiceImpl implements FileBoardService {
	

	@Autowired
	private FileBoardDao fileBoardDao;
	@Override
	public List<PostWithCategory> selectAllPostInfileBoard(int boardNo) {
		return fileBoardDao.selectAllPostInfileBoard(boardNo);
	}
	
	@Override
	public int insertFileAttach(Attachment attach) {
		return fileBoardDao.insertFileAttach(attach);
	}

	@Override
	public int insertFilePost(Post post) {
		return fileBoardDao.insertFilePost(post);
	}
	


		
}
