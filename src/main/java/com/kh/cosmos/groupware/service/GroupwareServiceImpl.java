package com.kh.cosmos.groupware.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.dao.GroupwareDao;
import com.kh.cosmos.member.model.vo.Member;

@Service
public class GroupwareServiceImpl implements GroupwareService {
	
	@Autowired
	private GroupwareDao gwDao;

	@Override
	public Group selectMyGroup(int groupNo) {
		// TODO Auto-generated method stub
		return gwDao.selectMyGroup(groupNo);
	}

	@Override
	public List<Member> selectAllGroupMembers(int groupNo) {
		// TODO Auto-generated method stub
		return gwDao.selectAllGroupMembers(groupNo);
	}

	@Override
	public String selectMemberProfileRenamedFilename(String id) {
		// TODO Auto-generated method stub
		return gwDao.selectMemberProfileRenamedFilename(id);
	}

	@Override
	public List<Group> selectAllMyGroup(String id) {
		// TODO Auto-generated method stub
		return gwDao.selectAllMyGroup(id);
	}

	@Override
	public List<Attachment> selectAllGroupBannerAttach() {
		// TODO Auto-generated method stub
		return gwDao.selectAllGroupBannerAttach();
	}


	
}