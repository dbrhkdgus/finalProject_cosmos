package com.kh.cosmos.group.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.CategoryOne;
import com.kh.cosmos.group.model.vo.CategoryTwo;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.group.model.vo.GroupCategory;
import com.kh.cosmos.group.model.vo.GroupInfo;
import com.kh.cosmos.group.model.vo.GroupInfoConnect;

@Repository
public class GroupDaoImpl implements GroupDao {

	@Autowired
	private SqlSession session;

	@Override
	public int insertGroup(Group group) {
		return session.insert("group.insertGroup", group);
	}

	@Override
	public int insertAttach(Attachment attach) {
		return session.insert("group.insertAttach", attach);
	}

	@Override
	public int insertGroupInfoConnect(GroupInfoConnect groupInfoConnect) {
		return session.insert("group.insertGroupInfoConnect", groupInfoConnect);
	}

	@Override
	public int insertGroupInfo(GroupInfo gi) {
		return session.insert("group.insertGroupInfo", gi);
	}

	@Override
	public List<CategoryOne> groupgroupContOne() {
		// TODO Auto-generated method stub
		return session.selectList("group.groupgroupContOne");
	}

	@Override
	public List<CategoryTwo> groupgroupContTwo(String categoryOneNo) {
		// TODO Auto-generated method stub
		return session.selectList("group.groupgroupContTwo", categoryOneNo);
	}

	@Override
	public int insertGroupCategory(GroupCategory category) {
		// TODO Auto-generated method stub
		return session.insert("group.insertGroupCategory" , category);
	}

	@Override
	public int insertAlg(ApplocationGroup applocationGroup) {
		// TODO Auto-generated method stub
		return session.insert("group.insertAlg" ,applocationGroup);
	}

	@Override
	public int selectGroupTotalCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("group.selectGroupTotalCount",param);
	}

	@Override
	public List<Group> selectAllGroupList(int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("group.selectAllGroupList",null, rowBounds);
	}

	@Override
	public List<GroupInfoConnect> selectAllGroupInfoList() {
		// TODO Auto-generated method stub
		return session.selectList("group.selectAllGroupInfoList");
	}


	@Override
	public List<Group> selectAllGroupListByParam(Map<String, Object> param, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("group.selectAllGroupListByParam",param,rowBounds);
	}

	@Override
	public List<Group> selectAllMyGroupList() {
		return session.selectList("group.selectAllMyGroupList");
	}

	@Override
	public Group selectGroupListByGroupNo(String groupNo) {
		// TODO Auto-generated method stub
		return session.selectOne("group.selectGroupListByGroupNo",groupNo);
	}

	@Override
	public GroupInfoConnect selectAllGroupInfoByGroupNo(String groupNo) {
		// TODO Auto-generated method stub
		return session.selectOne("group.selectAllGroupInfoByGroupNo",groupNo);
	}

	@Override
	public List<GroupInfo> selectGroupInfoListByGsNo(int gsNo) {
		// TODO Auto-generated method stub
		return session.selectList("group.selectGroupInfoListByGsNo",gsNo);
	}

	@Override
	public CategoryOne selectCategoryOneByCateNo(String cateNo) {
		// TODO Auto-generated method stub
		return session.selectOne("group.selectCategoryOneByCateNo",cateNo);
	}

	@Override
	public List<GroupCategory> selectGroupCategoryListByGroupNo(String groupNo) {
		// TODO Auto-generated method stub
		return session.selectList("group.selectGroupCategoryListByGroupNo",groupNo);
	}

	@Override
	public CategoryTwo selectCategoryTwoListByGroupNo(String num) {
		// TODO Auto-generated method stub
		return session.selectOne("group.selectCategoryTwoListByGroupNo",num);
	}

	@Override
	public int insertGroupJoin(ApplocationGroup applocationGroup) {
		// TODO Auto-generated method stub
		return session.insert("group.insertGroupJoin",applocationGroup);
	}

	@Override
	public int selectgroupLike(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("group.selectgroupLike",param);
	}

	@Override
	public int deletegroupLike(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.delete("group.deletegroupLike",param);
	}

	@Override
	public int insertgroupLike(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.insert("group.insertgroupLike",param);
	}

	@Override
	public int countFontLike(int groupNo) {
		// TODO Auto-generated method stub
		return session.selectOne("group.countFontLike",groupNo);
	}

	@Override
	public int updateFontLike(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.update("group.updateFontLike",map);
	}

	@Override
	public int selectCountGroupLike(int groupNo) {
		// TODO Auto-generated method stub
		return session.selectOne("group.selectCountGroupLike",groupNo);
	}

	@Override
	public int updateGroupLikeCount(Map<String, Object> param1) {
		// TODO Auto-generated method stub
		return session.update("group.updateGroupLikeCount",param1);
	}
	
	


	
	
}
