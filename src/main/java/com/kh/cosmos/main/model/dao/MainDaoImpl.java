package com.kh.cosmos.main.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.main.model.vo.Notice;
import com.kh.cosmos.main.model.vo.Question;

@Repository
public class MainDaoImpl implements MainDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Question> selectQuestionList() {
		// TODO Auto-generated method stub
		return session.selectList("question.selectQuestionList");
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
	
	
}