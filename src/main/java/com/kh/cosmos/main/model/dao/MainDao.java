package com.kh.cosmos.main.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.dao.GroupDao;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.main.model.vo.JoinAllGroupInfo;
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

	List<Group> selectAllGroupListByDate();

	List<Reply> selectReplyListByqueNo(int queNo);

	List<JoinAllGroupInfo> selectJoinAllGroupInfo(Map<String, Object> param);

	int deleteOneReply(int replyNo);

	List<Question> selectQueListByMemberId(String id);

	String memberProfileRenamedFileName(String id);

}
