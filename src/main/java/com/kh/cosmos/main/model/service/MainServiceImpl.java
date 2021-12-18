package com.kh.cosmos.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cosmos.main.model.dao.MainDao;
import com.kh.cosmos.main.model.vo.Question;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("mainService")
@Transactional
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainDao mainDao;

	@Override
	public List<Question> selectQuestionList() {
		return mainDao.selectQuestionList();
	}
	
	

}
