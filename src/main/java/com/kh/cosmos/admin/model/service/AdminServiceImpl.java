package com.kh.cosmos.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.cosmos.admin.model.dao.AdminDao;
import com.kh.cosmos.admin.model.vo.SevenDaysData;
import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.group.model.vo.NotApprovedGroup;
import com.kh.cosmos.main.model.vo.Question;
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
	public List<ApplocationGroup> selectNotApprovedAGList(int limit, int offset) {
		return adminDao.selectNotApprovedAGList(limit, offset);
	}

	@Override
	public List<NotApprovedGroup> selectOneNotApprovedGroup(Map<String, Object> param) {
		return adminDao.selectOneNotApprovedGroup(param);
	}

	@Override
	public int updateGroupApprove(int groupNo) {
		return adminDao.updateGroupApprove(groupNo);
	}
	
	@Override
	public List<Attachment> selectKakaoImage(String id) {
		return adminDao.selectKakaoImage(id);
	}

	@Override
	public SevenDaysData thisWeekEnrollMember() {
		return adminDao.thisWeekEnrollMember();
	}

	@Override
	public List<Question> adminMainQuestionList() {
		return adminDao.adminMainQuestionList();
	}

	@Override
	public List<Group> adminMainGroupList() {
		return adminDao.adminMainGroupList();
	}

	@Override
	public List<Attachment> selectProfileImgList() {
		return adminDao.selectProfileImgList();
	}

	@Override
	public List<Question> searchQuestion(int limit, int offset,Map<String, Object> param) {
		return adminDao.searchQuestion(limit, offset, param);
	}

	
}
