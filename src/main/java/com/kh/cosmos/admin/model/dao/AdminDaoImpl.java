package com.kh.cosmos.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.member.model.vo.Member;
import com.kh.cosmos.member.model.vo.MemberWithGroup;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Member> selectAllMembers(int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("admin.selectAllMembers",null,rowBounds);
	}

	@Override
	public List<MemberWithGroup> selectOneMember(Map<String, Object> param) {
		return session.selectList("admin.selectOneMember",param);
	}

	@Override
	public int updateBlack(Map<String, Object> param) {
		return session.update("admin.updateBlack",param);
	}

	@Override
	public List<Member> searchMembers(int limit, int offset, Map<String, String> param) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("admin.searchMembers",param, rowBounds);
	}

	@Override
	public List<ApplocationGroup> selectNotApprovedAGList() {
		return session.selectList("admin.selectNotApprovedAGList");
	}

}
