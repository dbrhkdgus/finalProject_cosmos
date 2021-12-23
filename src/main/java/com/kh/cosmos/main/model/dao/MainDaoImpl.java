package com.kh.cosmos.main.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.main.model.vo.Notice;
import com.kh.cosmos.main.model.vo.Question;

@Repository
public class MainDaoImpl implements MainDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Question> selectQuestionList(int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("question.selectQuestionList",null,rowBounds);
	}

	@Override
	public List<Notice> selectNoticeList(int offset, int limit) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("notice.selectNoticeList", null, rowBounds);
	}

	@Override
	public int selectNoticeTotalCount() {
		return session.selectOne("notice.selectNoticeTotalCount");
	}

	@Override
	public int selectQuestionTotalCount() {
		// TODO Auto-generated method stub
		return session.selectOne("question.selectQuestionTotalCount");
	}

	@Override
	public int insertQuestionFile(Question que) {
		return session.insert("question.insertQuestionFile", que);
	}
	@Override
	public int insertAttach(Attachment attach) {
		// TODO Auto-generated method stub
		return session.insert("notice.insertAttach",attach);
	}

	@Override
	public int insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		return session.insert("notice.insertNotice",notice);

	}

	@Override
	public Question selectOneQuestionByNo(int queNo) {
		// TODO Auto-generated method stub
		return session.selectOne("question.selectOneQuestionByNo", queNo);
	}

	@Override
	public Notice selectOneNotice(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("notice.selectOneNotice", no);
	}

	@Override
	public Attachment selectOneAttach(int attachNo) {
		// TODO Auto-generated method stub
		return session.selectOne("notice.selectOneAttach", attachNo);
	}

	@Override
	public int insertQuestion(Question que) {
		// TODO Auto-generated method stub
		return session.insert("question.insertQuestion",que);
	}

	@Override
	public List<Group> selectAllGroupListByDate() {
		// TODO Auto-generated method stub
		return session.selectList("index.selectAllGroupListByDate" );
	}
	
	
}
