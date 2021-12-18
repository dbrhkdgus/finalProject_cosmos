package com.kh.cosmos.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSession session;

	@Override
	public Member selectOneMember(String id) {
		return session.selectOne("selectOneMember", id);
	}
}
