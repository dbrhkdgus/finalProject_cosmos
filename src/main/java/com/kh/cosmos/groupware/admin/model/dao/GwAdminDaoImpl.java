package com.kh.cosmos.groupware.admin.model.dao;

import java.util.List;
import java.util.Map;

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

	@Override
	public int updategroupAccept(Map<String, String> idList) {
		return session.update("gwAdmin.updategroupAccept",idList);
	}

	@Override
	public int updategroupAcceptByList(Map<String, Object> param) {
		return session.update("gwAdmin.updategroupAcceptByList",param);
	}
	
	
	
	
	
}
