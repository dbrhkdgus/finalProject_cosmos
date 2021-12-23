package com.kh.cosmos.main.model.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.main.model.dao.MainDao;
import com.kh.cosmos.main.model.vo.Notice;
import com.kh.cosmos.main.model.vo.Question;
import com.kh.cosmos.main.model.vo.Reply;

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
	public int insertQuestionFile(Question que) {
		// TODO Auto-generated method stub
		return mainDao.insertQuestionFile(que);
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
	
	@Override
	public Question selectOneQuestionByNo(int queNo) {
		// TODO Auto-generated method stub
		return mainDao.selectOneQuestionByNo(queNo);
	}

	@Override
	public int insertQuestion(Question que) {
		// TODO Auto-generated method stub
		return mainDao.insertQuestion(que);
	}

	@Override
	public int insertQueReply(Reply reply) {
		// TODO Auto-generated method stub
		return mainDao.insertQueReply(reply);
	}
	
	@Override
	public List<Group> selectAllGroupListByDate() {
		// TODO Auto-generated method stub
		return mainDao.selectAllGroupListByDate();
	}

	@Override
	public List<Reply> selectReplyListByqueNo(int queNo) {
		return mainDao.selectReplyListByqueNo(queNo);
	}

	

}
