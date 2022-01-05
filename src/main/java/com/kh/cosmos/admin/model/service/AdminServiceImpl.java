package com.kh.cosmos.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.admin.model.vo.BoardData;
import com.kh.cosmos.admin.model.vo.BoardType;
import com.kh.cosmos.admin.model.vo.ColumnAndCount;
import com.kh.cosmos.admin.model.vo.Count;
import com.kh.cosmos.admin.model.vo.EnrollMemberByMonth;

import com.kh.cosmos.admin.model.dao.AdminDao;
import com.kh.cosmos.admin.model.vo.GenderData;
import com.kh.cosmos.admin.model.vo.SevenDaysData;
import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.group.model.vo.NotApprovedGroup;
import com.kh.cosmos.main.model.vo.Question;
import com.kh.cosmos.main.model.vo.QuestionWithMemberNameAndNickName;
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
	public List<QuestionWithMemberNameAndNickName> searchQuestion(int limit, int offset,Map<String, Object> param) {
		return adminDao.searchQuestion(limit, offset, param);
	}

	@Override
	public GenderData genderData() {
		return adminDao.genderData();
	}

	@Override
	public List<EnrollMemberByMonth> EnrollMemberByMonth(Map<String, Object> param) {
		return adminDao.EnrollMemberByMonth(param);
	}

	@Override
	public int selectAllBoardTotalCount() {
		// TODO Auto-generated method stub
		return adminDao.selectAllBoardTotalCount();
	}

	@Override
	public List<BoardData> selectAllBoardList(int limit, int offset) {
		// TODO Auto-generated method stub
		return adminDao.selectAllBoardList(limit,offset);
	}

	@Override
	public List<BoardType> selectAllBoardTypeList() {
		// TODO Auto-generated method stub
		return adminDao.selectAllBoardTypeList();
	}

	@Override
	public List<BoardData> selectSearchBoardList(Map<String, Object> param1, int limit, int offset) {
		// TODO Auto-generated method stub
		return adminDao.selectSearchBoardList(limit, offset, param1);
	}

	@Override
	public int selectSearchBoardTotalCount(Map<String, Object> param1) {
		// TODO Auto-generated method stub
		return adminDao.selectSearchBoardTotalCount(param1);
	}

	@Override
	public int insertAuthoritiesValueForGroupMaster(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return adminDao.insertAuthoritiesValueForGroupMaster(param);
	}
	
	@Override
	public Count totalCountOfGroup() {
		return adminDao.totalCountOfGroup();
	}

	@Override
	public Count countOfPremiumGroup() {
		return adminDao.countOfPremiumGroup();
	}

	@Override
	public Count countOfPost() {
		return adminDao.countOfPost();
	}

	@Override
	public Count countOfNewGroupInThisMonth() {
		return adminDao.countOfNewGroupInThisMonth();
	}

	@Override
	public List<ColumnAndCount> countOfnewPostInThisWeekList() {
		return adminDao.countOfnewPostInThisWeekList();
	}

	@Override
	public List<ColumnAndCount> countOfGroupLikeList() {
		return adminDao.countOfGroupLikeList();
	}

	@Override
	public List<ColumnAndCount> totalCountOfPost() {
		return adminDao.totalCountOfPost();
	}
	
	
}
