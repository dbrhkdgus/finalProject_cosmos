package com.kh.cosmos.member.model.service;

import java.util.List;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
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

}
