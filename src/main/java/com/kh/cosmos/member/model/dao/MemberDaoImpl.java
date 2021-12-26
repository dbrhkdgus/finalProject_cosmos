package com.kh.cosmos.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.MemberInterestGroup;
import com.kh.cosmos.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSession session;

	@Override
	public Member selectOneMember(String id) {
		return session.selectOne("member.selectOneMember", id);
	}

	@Override
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		return session.insert("member.insertMember", member);
	}

	@Override
	public int updateMember(Member updateMember) {
		// TODO Auto-generated method stub
		return session.update("member.updateMember", updateMember);
	}

	@Override
	public int insertUserAuthority(String id) {
		// TODO Auto-generated method stub
		return session.insert("member.insertUserAuthority",id);
	}

	@Override
	public List<ApplocationGroup> selectMyGroupList(String userId) {
		return session.selectList("member.selectMyGroupList", userId);
	}

	@Override
	public int insertAttach(Attachment attach) {
		// TODO Auto-generated method stub
		return session.insert("member.insertAttach", attach);
	}

	@Override
	public Attachment selectMemberProfile(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMemberProfile",id);
	}

	@Override
	public int updateAttach(Attachment oldProfile) {
		// TODO Auto-generated method stub
		return session.update("member.updateAttach", oldProfile);
	}

	@Override
	public List<ApplocationGroup> selectmyNotAllowedGroupList(String userId) {
		return session.selectList("member.selectmyNotAllowedGroupList", userId);
	}

	@Override
	public List<ApplocationGroup> selectmyNotJoinedGroupList(String userId) {
		return session.selectList("member.selectmyNotJoinedGroupList", userId);
	}

	@Override
	public List<MemberInterestGroup> selectmyInterestedGroupList(String userId) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectmyInterestedGroupList",userId);
	}

	@Override
	public int updateMemberProfileAsDefault(String id) {
		// TODO Auto-generated method stub
		return session.update("member.updateMemberProfileAsDefault", id);
	}
	
}
