package com.kh.cosmos.group.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.dao.GroupDao;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.CategoryOne;
import com.kh.cosmos.group.model.vo.CategoryTwo;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.group.model.vo.GroupCategory;
import com.kh.cosmos.group.model.vo.GroupInfo;
import com.kh.cosmos.group.model.vo.GroupInfoConnect;

@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	private GroupDao groupDao;

	@Override
	public int insertGroup(Group group) {
		return groupDao.insertGroup(group);
	}

	@Override
	public int insertAttach(Attachment attach) {
		return groupDao.insertAttach(attach);
	}

	@Override
	public int insertGroupInfoConnect(GroupInfoConnect groupInfoConnect) {
		return groupDao.insertGroupInfoConnect(groupInfoConnect);
	}

	@Override
	public int insertGroupInfo(GroupInfo gi) {
		return groupDao.insertGroupInfo(gi);
	}

	@Override
	public List<CategoryOne> groupgroupContOne() {
		// TODO Auto-generated method stub
		return groupDao.groupgroupContOne();
	}
	
	@Override
	public List<CategoryTwo> groupgroupContTwo(String categoryOneNo) {
		// TODO Auto-generated method stub
		return groupDao.groupgroupContTwo(categoryOneNo);
	}

	@Override
	public int insertGroupCategory(GroupCategory category) {
		// TODO Auto-generated method stub
		return groupDao.insertGroupCategory(category);
	}

	@Override
	public int insertAlg(ApplocationGroup applocationGroup) {
		// TODO Auto-generated method stub
		return groupDao.insertAlg(applocationGroup);
	}

	@Override
	public int selectGroupTotalCount() {
		// TODO Auto-generated method stub
		return groupDao.selectGroupTotalCount();
	}

	@Override
	public List<Group> selectAllGroupList(int limit, int offset) {
		// TODO Auto-generated method stub
		return groupDao.selectAllGroupList(limit, offset);
	}

	@Override
	public List<GroupInfoConnect> selectAllGroupInfoList() {
		// TODO Auto-generated method stub
		return groupDao.selectAllGroupInfoList();
	}

	@Override
	public List<Group> selectAllGroupListByCa1No(int ca1No, int limit, int offset) {
		// TODO Auto-generated method stub
		return groupDao.selectAllGroupListByCa1No(ca1No, limit, offset);
	}

	@Override
	public List<Group> selectAllGroupListByCa2No(int ca2No, int limit, int offset) {
		// TODO Auto-generated method stub
		return groupDao.selectAllGroupListByCa2No(ca2No, limit, offset);
	}



	
	
}
