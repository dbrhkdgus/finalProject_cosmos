package com.kh.cosmos.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cosmos.common.vo.Attachment;
import com.kh.cosmos.main.model.dao.MainDao;
import com.kh.cosmos.main.model.vo.Notice;
import com.kh.cosmos.main.model.vo.Question;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("mainService")
@Transactional
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainDao mainDao;

	@Override
	public List<Question> selectQuestionList(int limit, int offset) {
		return mainDao.selectQuestionList(limit, offset);
	}

	@Override
	public List<Notice> selectNoticeList(int offset, int limit) {
		return mainDao.selectNoticeList(offset, limit);
	}

	@Override
	public int selectNoticeTotalCount() {
		return mainDao.selectNoticeTotalCount();
	}

	@Override
	public int selectQuestionTotalCount() {
		// TODO Auto-generated method stub
		return mainDao.selectQuestionTotalCount();
	}

	@Override
	public int insertAttach(Attachment attach) {
		// TODO Auto-generated method stub
		return mainDao.insertAttach(attach);
	}

	@Override
	public int insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		return mainDao.insertNotice(notice);
	}

	@Override
	public Notice selectOneNotice(int no) {
		// TODO Auto-generated method stub
		return mainDao.selectOneNotice(no);
	}

	@Override
	public Attachment selectOneAttach(int attachNo) {
		// TODO Auto-generated method stub
		return mainDao.selectOneAttach(attachNo);
	}
	
	

}
