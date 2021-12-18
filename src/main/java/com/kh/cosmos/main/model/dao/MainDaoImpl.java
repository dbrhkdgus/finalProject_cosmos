package com.kh.cosmos.main.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	
}
