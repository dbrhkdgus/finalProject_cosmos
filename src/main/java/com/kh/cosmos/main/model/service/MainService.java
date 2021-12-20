package com.kh.cosmos.main.model.service;

import java.util.List;

import com.kh.cosmos.main.model.vo.Notice;
import com.kh.cosmos.main.model.vo.Question;

public interface MainService {

	List<Question> selectQuestionList(int limit, int offset);

	List<Notice> selectNoticeList(int offset, int limit);

	int selectNoticeTotalCount();

	int selectQuestionTotalCount();

	int insertQuestion(Question que);

}
