package com.kh.cosmos.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.member.model.vo.Member;

public interface AdminService {

	List<Member> selectAllMembers();

	Member selectOneMember(Map<String, Object> param);

}
