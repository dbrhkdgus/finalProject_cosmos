package com.kh.cosmos.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.MemberInterestGroup;
import com.kh.cosmos.member.model.vo.Member;

public interface MemberService {

	Member selectOneMember(String id);

	int insertMember(Member member);

	int updateMember(Member updateMember);

	int insertUserAuthority(String id);
 
	List<ApplocationGroup> selectMyGroupList(String userId);

	int insertAttach(Attachment attach);

	Attachment selectMemberProfile(String id);

	int updateAttach(Attachment oldProfile);

	List<ApplocationGroup> selectmyNotAllowedGroupList(String userId);

	List<ApplocationGroup> selectmyNotJoinedGroupList(String userId);
	
	List<MemberInterestGroup> selectmyInterestedGroupList(String userId);

	int updateMemberProfileAsDefault(String id);

	int delete(int groupNo);

	List<Member> selectAllMemberList();

	List<String> selectMemberAuthority(String id);

	int deleteMember(String id);

	int deleteMemberFromApplocationGroup(Map<String, Object> param);

	List<Integer> selectChatRoomNoList(int groupNo);

	int deleteMemberFromChatuser(Map<String, Object> param);

	int deleteMemberAuthorityAboutGroup(Map<String, Object> param);
}
