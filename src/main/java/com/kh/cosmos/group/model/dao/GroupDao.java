package com.kh.cosmos.group.model.dao;

import java.util.List;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.CategoryOne;
import com.kh.cosmos.group.model.vo.CategoryTwo;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.group.model.vo.GroupCategory;
import com.kh.cosmos.group.model.vo.GroupInfo;
import com.kh.cosmos.group.model.vo.GroupInfoConnect;

public interface GroupDao {

	int insertGroup(Group group);

	int insertAttach(Attachment attach);

	int insertGroupInfoConnect(GroupInfoConnect groupInfoConnect);

	int insertGroupInfo(GroupInfo gi);

	List<CategoryOne> groupgroupContOne();

	List<CategoryTwo> groupgroupContTwo(String categoryOneNo);

	int insertGroupCategory(GroupCategory category);

	int insertAlg(ApplocationGroup applocationGroup);

	int selectGroupTotalCount();

	List<Group> selectAllGroupList(int limit, int offset);

	List<GroupInfoConnect> selectAllGroupInfoList();


	List<Group> selectAllGroupListByCa1No(int ca1No, int limit, int offset);

	List<Group> selectAllGroupListByCa2No(int ca2No, int limit, int offset);



}
