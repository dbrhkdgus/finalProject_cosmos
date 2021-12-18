package com.kh.cosmos.main.model.dao;

import java.util.List;

import com.kh.cosmos.main.model.vo.Notice;
import com.kh.cosmos.main.model.vo.Question;

public interface MainDao {

	List<Question> selectQuestionList();

	List<Notice> selectNoticeList(int offset, int limit);

}
