package com.kh.cosmos.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.admin.model.vo.SevenDaysData;
import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.group.model.vo.NotApprovedGroup;
import com.kh.cosmos.main.model.vo.Question;
import com.kh.cosmos.member.model.vo.Member;
import com.kh.cosmos.member.model.vo.MemberWithGroup;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Member> selectAllMembers(int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("admin.selectAllMembers",null,rowBounds);
	}

	@Override
	public List<MemberWithGroup> selectOneMember(Map<String, Object> param) {
		return session.selectList("admin.selectOneMember",param);
	}

	@Override
	public int updateBlack(Map<String, Object> param) {
		return session.update("admin.updateBlack",param);
	}

	@Override
	public List<Member> searchMembers(int limit, int offset, Map<String, String> param) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("admin.searchMembers",param, rowBounds);
	}

	@Override
	public List<ApplocationGroup> selectNotApprovedAGList(int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("admin.selectNotApprovedAGList",null,rowBounds);
	}

	@Override
	public List<NotApprovedGroup> selectOneNotApprovedGroup(Map<String, Object> param) {
		return session.selectList("admin.selectOneNotApprovedGroup", param);
	}

	@Override
	public int updateGroupApprove(int groupNo) {
		return session.update("admin.updateGroupApprove", groupNo);
	}
	
	@Override
	public List<Attachment> selectKakaoImage(String id) {
		return session.selectList("admin.selectKakaoImage", id);
	}

	@Override
	public SevenDaysData thisWeekEnrollMember() {
		return session.selectOne("admin.thisWeekEnrollMember");
	}

	@Override
	public List<Question> adminMainQuestionList() {
		return session.selectList("admin.adminMainQuestionList");
	}

	@Override
	public List<Group> adminMainGroupList() {
		return session.selectList("admin.adminMainGroupList");
	}

}
