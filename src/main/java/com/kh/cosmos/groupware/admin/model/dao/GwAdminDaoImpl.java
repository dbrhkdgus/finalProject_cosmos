package com.kh.cosmos.groupware.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.groupware.admin.model.vo.TdlMemberCount;
import com.kh.cosmos.groupware.app.model.vo.TDL;
import com.kh.cosmos.groupware.fileBoard.vo.IdNickName;

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

	@Override
	public int selectGwGroupPool(String groupNo) {
		return session.selectOne("gwAdmin.selectGwGroupPool",groupNo);
	}

	@Override
	public int selectGwGroupCount(String groupNo) {
		return session.selectOne("gwAdmin.selectGwGroupCount",groupNo);
	}

	@Override
	public int deletegroupRefuseByList(Map<String, Object> param) {
		return session.delete("gwAdmin.deletegroupRefuseByList",param);
	}

	@Override
	public int deleteGwMember(Map<String, Object> param) {
		return session.delete("gwAdmin.deleteGwMember",param);
	}

	@Override
	public int updateMemberRole(Map<String, Object> param) {
		return session.update("gwAdmin.updateMemberRole",param);
	}

	@Override
	public List<IdNickName> selectChartIdNickNameList() {
		// TODO Auto-generated method stub
		return session.selectList("gwAdmin.selectChartIdNickNameList");
	}

	@Override
	public List<TdlMemberCount> selectcheckedToDoList(int groupNo) {
		// TODO Auto-generated method stub
		return session.selectList("gwAdmin.selectcheckedToDoList" , groupNo);
	}

	
	
	
	
	
}
