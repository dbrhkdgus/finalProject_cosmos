package com.kh.cosmos.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.NotApprovedGroup;
import com.kh.cosmos.member.model.vo.Member;
import com.kh.cosmos.member.model.vo.MemberWithGroup;

public interface AdminDao {

	List<Member> selectAllMembers(int limit, int offset);

	List<MemberWithGroup> selectOneMember(Map<String, Object> param);

	int updateBlack(Map<String, Object> param);

	List<Member> searchMembers(int limit, int offset, Map<String, String> param);

	List<ApplocationGroup> selectNotApprovedAGList(int limit, int offset);

	List<NotApprovedGroup> selectOneNotApprovedGroup(Map<String, Object> param);

	List<Attachment> selectKakaoImage(String id);
}
