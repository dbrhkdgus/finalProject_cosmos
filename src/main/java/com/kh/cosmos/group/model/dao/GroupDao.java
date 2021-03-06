package com.kh.cosmos.group.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.CategoryOne;
import com.kh.cosmos.group.model.vo.CategoryTwo;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.group.model.vo.GroupCategory;
import com.kh.cosmos.group.model.vo.GroupInfo;
import com.kh.cosmos.group.model.vo.GroupInfoConnect;


import com.kh.cosmos.group.model.vo.MemberInterestGroup;


import com.kh.cosmos.group.model.vo.NumberOfGroupMember;

import com.kh.cosmos.main.model.vo.Reply;

public interface GroupDao {

	int insertGroup(Group group);

	int insertAttach(Attachment attach);

	int insertGroupInfoConnect(GroupInfoConnect groupInfoConnect);

	int insertGroupInfo(GroupInfo gi);

	List<CategoryOne> groupgroupContOne();

	List<CategoryTwo> groupgroupContTwo(String categoryOneNo);

	int insertGroupCategory(GroupCategory category);

	int insertAlg(ApplocationGroup applocationGroup);

	int selectGroupTotalCount(Map<String, Object> param);

	List<Group> selectAllGroupList(int limit, int offset);

	List<GroupInfoConnect> selectAllGroupInfoList();

	List<Group> selectAllGroupListByParam(Map<String, Object> param, int limit, int offset);

	List<Group> selectAllMyGroupList();

	Group selectGroupListByGroupNo(String groupNo);

	GroupInfoConnect selectAllGroupInfoByGroupNo(String groupNo);

	List<GroupInfo> selectGroupInfoListByGsNo(int gsNo);

	CategoryOne selectCategoryOneByCateNo(String cateNo);

	List<GroupCategory> selectGroupCategoryListByGroupNo(String groupNo);

	CategoryTwo selectCategoryTwoListByGroupNo(String num);

	int insertGroupJoin(ApplocationGroup applocationGroup);

	int selectgroupLike(Map<String, Object> param);

	int deletegroupLike(Map<String, Object> param);

	int insertgroupLike(Map<String, Object> param);

	int countFontLike(int groupNo);

	int updateFontLike(Map<String, Object> map);

	int selectCountGroupLike(int groupNo);

	int updateGroupLikeCount(Map<String, Object> param1);


	List<MemberInterestGroup> selectAllInterstGroup();

	List<GroupCategory> selectAllGroupCategory();

	List<CategoryTwo> selectAllCategoryTwoList();

	List<NumberOfGroupMember> selectAllNumOfGM();
	
	int insertGroupeReply(Reply reply);

	List<Reply> selectReplyListBygroupNo(String groupNo);

	int deleteGroupReply(int replyNo);

	List<CategoryOne> CategoryOneList();

	List<ApplocationGroup> selectALGroupListByGroupNo(String groupNo);

	int deleteInterestGroupByParam(Map<String, Object> param);

	List<ApplocationGroup> selectApprovedAG();

	int deleteGroup(int groupNo);

	int deleteAuthoritiesRelatedGroup(String groupNo);

	int insertGroupwareBanner(Map<String, Object> param);

}
