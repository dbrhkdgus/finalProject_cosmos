package com.kh.cosmos.groupware.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.groupware.admin.model.dao.GwAdminDao;


@Service
public class GwAdminServiceImpl implements GwAdminService {
	
	@Autowired
	private GwAdminDao gwAdminDao;

	@Override
	public List<ApplocationGroup> selectAllAcceptGroupMemberList(int groupNo) {
		// TODO Auto-generated method stub
		return gwAdminDao.selectAllAcceptGroupMemberList(groupNo);
	}

	@Override
	public List<ApplocationGroup> selectAllWaitingGroupMemberList(int groupNo) {
		// TODO Auto-generated method stub
		return gwAdminDao.selectAllWaitingGroupMemberList(groupNo);
	}

	@Override
	public int updategroupAccept(Map<String, String> idList) {
		return gwAdminDao.updategroupAccept(idList);
	}

	@Override
	public int updategroupAcceptByList(Map<String, Object> param) {
		return gwAdminDao.updategroupAcceptByList(param);
	}

	@Override
	public int selectGwGroupPool(String groupNo) {
		return gwAdminDao.selectGwGroupPool(groupNo);
	}

	@Override
	public int selectGwGroupCount(String groupNo) {
		return gwAdminDao.selectGwGroupCount(groupNo);
	}

	@Override
	public int deletegroupRefuseByList(Map<String, Object> param) {
		return gwAdminDao.deletegroupRefuseByList(param);
	}

	@Override
	public int deleteGwMember(Map<String, Object> param) {
		return gwAdminDao.deleteGwMember(param);
	}

	@Override
	public int updateMemberRole(Map<String, Object> param) {
		return gwAdminDao.updateMemberRole(param);
	}


	
	
}
