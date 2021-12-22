package com.kh.cosmos.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Member> selectAllMembers() {
		return session.selectList("admin.selectAllMembers");
	}

	@Override
	public Member selectOneMember(Map<String, Object> param) {
		return session.selectOne("admin.selectOneMember",param);
	}

}
