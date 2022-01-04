package com.kh.cosmos.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.admin.model.vo.BoardData;
import com.kh.cosmos.admin.model.vo.BoardType;
import com.kh.cosmos.admin.model.vo.EnrollMemberByMonth;
import com.kh.cosmos.admin.model.vo.GenderData;
import com.kh.cosmos.admin.model.vo.SevenDaysData;
import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.group.model.vo.NotApprovedGroup;
import com.kh.cosmos.main.model.vo.Question;
import com.kh.cosmos.main.model.vo.QuestionWithMemberNameAndNickName;
import com.kh.cosmos.member.model.vo.Member;
import com.kh.cosmos.member.model.vo.MemberWithGroup;

public interface AdminService {

	List<Member> selectAllMembers(int limit, int offset);

	List<MemberWithGroup> selectOneMember(Map<String, Object> param);

	int updateBlack(Map<String, Object> param);

	List<Member> searchMembers(int limit, int offset, Map<String, String> param);

	List<ApplocationGroup> selectNotApprovedAGList(int limit, int offset);

	List<NotApprovedGroup> selectOneNotApprovedGroup(Map<String, Object> param);

	int updateGroupApprove(int groupNo);

	List<Attachment> selectKakaoImage(String id);

	SevenDaysData thisWeekEnrollMember();

	List<Question> adminMainQuestionList();

	List<Group> adminMainGroupList();

	List<Attachment> selectProfileImgList();

	List<QuestionWithMemberNameAndNickName> searchQuestion(int limit, int offset,Map<String, Object> param);

	GenderData genderData();

	List<EnrollMemberByMonth> EnrollMemberByMonth(Map<String, Object> param);

	int selectAllBoardTotalCount();

	List<BoardData> selectAllBoardList(int limit, int offset);

	List<BoardType> selectAllBoardTypeList();

	List<BoardData> selectSearchBoardList(Map<String, Object> param1, int limit, int offset);

	int selectSearchBoardTotalCount(Map<String, Object> param1);

	int insertAuthoritiesValueForGroupMaster(Map<String, Object> param);

}
