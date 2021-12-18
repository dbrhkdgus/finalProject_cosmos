package com.kh.cosmos.group.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.group.model.dao.GroupDao;
import com.kh.cosmos.group.model.vo.Group;

@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	private GroupDao groupDao;

	@Override
	public int insertGroup(Group group) {
		return groupDao.insertGroup(group);
	}
}
