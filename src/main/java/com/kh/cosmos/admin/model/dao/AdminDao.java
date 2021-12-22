package com.kh.cosmos.admin.model.dao;

import java.util.List;

import com.kh.cosmos.member.model.vo.Member;

public interface AdminDao {

	List<Member> selectAllMembers();

	Member selectOneMember(String id);

}
