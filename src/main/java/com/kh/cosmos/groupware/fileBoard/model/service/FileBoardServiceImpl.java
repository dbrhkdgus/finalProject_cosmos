package com.kh.cosmos.groupware.fileBoard.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.groupware.fileBoard.model.dao.FileBoardDao;

@Service
public class FileBoardServiceImpl implements FileBoardService {
	
	@Autowired
	private FileBoardDao fileBoardDao;
	
	@Override
	public int insertFileAttach(Attachment attach) {
		return fileBoardDao.insertFileAttach(attach);
	}

		
}
