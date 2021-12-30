package com.kh.cosmos.groupware.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.group.model.vo.ApplocationGroup;

@Repository
public class GwAdminDaoImpl implements GwAdminDao {
	
	

	@Autowired
	private SqlSession session;
	
	@Override
	public List<ApplocationGroup> selectAllAcceptGroupMemberList(int groupNo) {
		// TODO Auto-generated method stub
		return session.selectList("gwAdmin.selectAllAcceptGroupMemberList",groupNo);
	}

	@Override
	public List<ApplocationGroup> selectAllWaitingGroupMemberList(int groupNo) {
		// TODO Auto-generated method stub
		return session.selectList("gwAdmin.selectAllWaitingGroupMemberList", groupNo);
	}
	
	
	
}