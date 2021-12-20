package com.kh.cosmos.member.model.service;

import com.kh.cosmos.member.model.vo.Member;

public interface MemberService {

	Member selectOneMember(String id);

	int insertMember(Member member);

}
