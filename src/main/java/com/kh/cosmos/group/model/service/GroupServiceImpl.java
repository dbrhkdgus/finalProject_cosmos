package com.kh.cosmos.group.model.service;

import java.util.List;
import java.util.Map;

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
import com.kh.cosmos.group.model.vo.MemberInterestGroup;
import com.kh.cosmos.main.model.vo.Reply;


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
	public int selectGroupTotalCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return groupDao.selectGroupTotalCount(param);
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
	public List<Group> selectAllGroupListByParam(Map<String, Object> param, int limit, int offset) {
		// TODO Auto-generated method stub
		return groupDao.selectAllGroupListByParam(param, limit, offset);
	}

	@Override
	public List<Group> selectAllMyGroupList() {
		// TODO Auto-generated method stub
		return groupDao.selectAllMyGroupList();
	}

	@Override
	public Group selectGroupListByGroupNo(String groupNo) {
		// TODO Auto-generated method stub
		return groupDao.selectGroupListByGroupNo(groupNo);
	}

	@Override
	public GroupInfoConnect selectAllGroupInfoByGroupNo(String groupNo) {
		// TODO Auto-generated method stub
		return groupDao.selectAllGroupInfoByGroupNo(groupNo);
	}

	@Override
	public List<GroupInfo> selectGroupInfoListByGsNo(int gsNo) {
		// TODO Auto-generated method stub
		return groupDao.selectGroupInfoListByGsNo(gsNo);
	}

	@Override
	public CategoryOne selectCategoryOneByCateNo(String cateNo) {
		// TODO Auto-generated method stub
		return groupDao.selectCategoryOneByCateNo(cateNo);
	}

	@Override
	public List<GroupCategory> selectGroupCategoryListByGroupNo(String groupNo) {
		// TODO Auto-generated method stub
		return groupDao.selectGroupCategoryListByGroupNo(groupNo);
	}

	@Override
	public CategoryTwo selectCategoryTwoListByGroupNo(String num) {
		// TODO Auto-generated method stub
		return groupDao.selectCategoryTwoListByGroupNo(num);
	}

	@Override
	public int insertGroupJoin(ApplocationGroup applocationGroup) {
		// TODO Auto-generated method stub
		return groupDao.insertGroupJoin(applocationGroup);
	}

	@Override
	public int selectgroupLike(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return groupDao.selectgroupLike(param);
	}

	@Override
	public int deletegroupLike(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return groupDao.deletegroupLike(param);
	}

	@Override
	public int insertgroupLike(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return groupDao.insertgroupLike(param);
	}

	@Override
	public int countFontLike(int groupNo) {
		// TODO Auto-generated method stub
		return groupDao.countFontLike(groupNo);
	}

	@Override
	public int updateFontLike(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return groupDao.updateFontLike(map);
	}

	@Override
	public int selectCountGroupLike(int groupNo) {
		return groupDao.selectCountGroupLike(groupNo);
	}

	@Override
	public int updateGroupLikeCount(Map<String, Object> param1) {
		// TODO Auto-generated method stub
		return groupDao.updateGroupLikeCount(param1);
	}

	@Override

	public List<MemberInterestGroup> selectAllInterstGroup() {
		// TODO Auto-generated method stub
		return groupDao.selectAllInterstGroup();
	}

	public int insertGroupeReply(Reply reply) {
		return groupDao.insertGroupeReply(reply);
	}

	@Override
	public List<Reply> selectReplyListBygroupNo(String groupNo) {
		return groupDao.selectReplyListBygroupNo(groupNo);
	}

	@Override
	public int deleteGroupReply(int replyNo) {
		return groupDao.deleteGroupReply(replyNo);
	}
	


	
	
}
