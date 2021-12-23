package com.kh.cosmos.main.model.dao;

import java.util.List;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.main.model.vo.Notice;
import com.kh.cosmos.main.model.vo.Question;
import com.kh.cosmos.main.model.vo.Reply;

public interface MainDao {

	List<Question> selectQuestionList(int limit, int offset);

	List<Notice> selectNoticeList(int offset, int limit);

	int selectNoticeTotalCount();

	int selectQuestionTotalCount();


	int insertQuestionFile(Question que);

	int insertAttach(Attachment attach);

	int insertNotice(Notice notice);

	Notice selectOneNotice(int no);

	Attachment selectOneAttach(int attachNo);
	
	Question selectOneQuestionByNo(int queNo);

	int insertQuestion(Question que);

	int insertQueReply(Reply reply);
}
