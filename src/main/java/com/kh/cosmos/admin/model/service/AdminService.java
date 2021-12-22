package com.kh.cosmos.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.member.model.vo.Member;
import com.kh.cosmos.member.model.vo.MemberWithGroup;

public interface AdminService {

	List<Member> selectAllMembers(int limit, int offset);

	List<MemberWithGroup> selectOneMember(Map<String, Object> param);

	int updateBlack(Map<String, Object> param);


}
