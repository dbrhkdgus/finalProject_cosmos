package com.kh.cosmos.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.admin.model.dao.AdminDao;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.member.model.vo.Member;
import com.kh.cosmos.member.model.vo.MemberWithGroup;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public List<Member> selectAllMembers(int limit, int offset) {
		return adminDao.selectAllMembers(limit, offset);
	}

	@Override
	public List<MemberWithGroup> selectOneMember(Map<String, Object> param) {
		return adminDao.selectOneMember(param);
	}

	@Override
	public int updateBlack(Map<String, Object> param) {
		return adminDao.updateBlack(param);
	}

	@Override
	public List<Member> searchMembers(int limit, int offset, Map<String, String> param) {
		return adminDao.searchMembers(limit, offset, param);
	}

	@Override
	public List<ApplocationGroup> selectNotApprovedAGList() {
		return adminDao.selectNotApprovedAGList();
	}



	
}
