package com.kh.cosmos.admin.model.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.admin.model.vo.BoardData;
import com.kh.cosmos.admin.model.vo.BoardType;
import com.kh.cosmos.admin.model.vo.ColumnAndCount;
import com.kh.cosmos.admin.model.vo.Count;
import com.kh.cosmos.admin.model.vo.EnrollMemberByMonth;
import com.kh.cosmos.admin.model.vo.GenderData;
import com.kh.cosmos.admin.model.vo.SevenDaysData;
import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.group.model.vo.MemberOfGroup;
import com.kh.cosmos.group.model.vo.NotApprovedGroup;
import com.kh.cosmos.main.model.vo.Question;
import com.kh.cosmos.main.model.vo.QuestionWithMemberNameAndNickName;
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

	@Override
	public List<Attachment> selectProfileImgList() {
		return session.selectList("admin.selectProfileImgList");
	}

	@Override
	public List<QuestionWithMemberNameAndNickName> searchQuestion(int limit, int offset, Map<String, Object> param) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("admin.searchQuestion", param, rowBounds);
	}

	@Override
	public GenderData genderData() {
		return session.selectOne("admin.genderData");
	}

	@Override
	public List<EnrollMemberByMonth> EnrollMemberByMonth(Map<String, Object> param) {
		return session.selectList("admin.EnrollMemberByMonth", param);
	}

	@Override
	public int selectAllBoardTotalCount() {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectAllBoardTotalCount");
	}

	@Override
	public List<BoardData> selectAllBoardList(int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("admin.selectAllBoardList", null , rowBounds);
	}

	@Override
	public List<BoardType> selectAllBoardTypeList() {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectAllBoardTypeList");
	}

	@Override
	public List<BoardData> selectSearchBoardList(int limit, int offset, Map<String, Object> param1) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("admin.selectSearchBoardList", param1, rowBounds);
	}

	@Override
	public int selectSearchBoardTotalCount(Map<String, Object> param1) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectSearchBoardTotalCount", param1);
	}

	@Override
	public int insertAuthoritiesValueForGroupMaster(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.insert("admin.insertAuthoritiesValueForGroupMaster", param);
	}
	
	@Override
	public Count totalCountOfGroup() {
		return session.selectOne("admin.totalCountOfGroup");
	}

	@Override
	public Count countOfPremiumGroup() {
		return session.selectOne("admin.countOfPremiumGroup");
	}

	@Override
	public Count countOfPost() {
		return session.selectOne("admin.countOfPost");
	}

	@Override
	public Count countOfNewGroupInThisMonth() {
		return session.selectOne("admin.countOfNewGroupInThisMonth");
	}

	@Override
	public List<ColumnAndCount> countOfnewPostInThisWeekList() {
		return session.selectList("admin.countOfnewPostInThisWeekList");
	}

	@Override
	public List<ColumnAndCount> countOfGroupLikeList() {
		return session.selectList("admin.countOfGroupLikeList");
	}

	@Override
	public List<ColumnAndCount> totalCountOfPost() {
		return session.selectList("admin.totalCountOfPost");
	}

	@Override
	public int totalCountOfMembers() {
		return session.selectOne("admin.totalCountOfMembers");
	}

	@Override
	public List<Group> allGroupList(int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("admin.allGroupList",null, rowBounds);
	}

	@Override
	public int allGroupCount() {
		return session.selectOne("admin.allGroupCount");
	}

	@Override
	public List<Group> searchGroupList(Map<String, String> param, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("admin.searchGroupList",param, rowBounds);
	}

	@Override
	public int searchGroupListCounts(Map<String, String> param) {
		return session.selectOne("admin.searchGroupListCounts", param);
	}

	@Override
	public MemberOfGroup selectLeader(String groupNo) {
		return session.selectOne("admin.selectLeader", groupNo);
	}

	@Override
	public List<MemberOfGroup> memberOfGroupList(String groupNo) {
		return session.selectList("admin.memberOfGroupList", groupNo);
	}

	@Override
	public List<ColumnAndCount> statisticsCategory() {
		return session.selectList("admin.statisticsCategory");
	}

	@Override
	public int totalSales() {
		return session.selectOne("admin.totalSales");
	}

	@Override
	public int salesOfThisMonth() {
		return session.selectOne("admin.salesOfThisMonth");
	}

	@Override
	public int salesOfLastMonth() {
		return session.selectOne("admin.salesOfLastMonth");
	}

	@Override
	public int salesOfMonth(Map<String, Object> param) {
		return session.selectOne("admin.salesOfMonth", param);
	}

	
	
}
