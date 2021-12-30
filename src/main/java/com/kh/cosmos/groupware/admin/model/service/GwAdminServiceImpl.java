package com.kh.cosmos.groupware.admin.model.service;

import java.util.List;

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

}
