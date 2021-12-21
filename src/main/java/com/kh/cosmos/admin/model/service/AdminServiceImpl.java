package com.kh.cosmos.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.admin.model.dao.AdminDao;
import com.kh.cosmos.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public List<Member> selectAllMembers() {
		return adminDao.selectAllMembers();
	}

	@Override
	public Member selectOneMember(String id) {
		return adminDao.selectOneMember(id);
	}

	
}
