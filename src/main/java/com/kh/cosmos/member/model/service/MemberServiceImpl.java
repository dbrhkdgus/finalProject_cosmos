package com.kh.cosmos.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.MemberInterestGroup;
import com.kh.cosmos.member.model.dao.MemberDao;
import com.kh.cosmos.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;

	@Override
	public Member selectOneMember(String id) {
		return memberDao.selectOneMember(id);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertMember(Member member) {
		int result=0;
		try {
			result = memberDao.insertMember(member);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateMember(Member updateMember) {
		// TODO Auto-generated method stub
		return memberDao.updateMember(updateMember);
	}

	@Override
	public int insertUserAuthority(String id) {
		// TODO Auto-generated method stub
		return memberDao.insertUserAuthority(id);
	}

	@Override
	public List<ApplocationGroup> selectMyGroupList(String userId) {
		return memberDao.selectMyGroupList(userId);
	}

	@Override
	public int insertAttach(Attachment attach) {
		// TODO Auto-generated method stub
		return memberDao.insertAttach(attach);
	}

	@Override
	public Attachment selectMemberProfile(String id) {
		// TODO Auto-generated method stub
		return memberDao.selectMemberProfile(id);
	}

	@Override
	public int updateAttach(Attachment oldProfile) {
		// TODO Auto-generated method stub
		return memberDao.updateAttach(oldProfile);
	}

	@Override
	public List<ApplocationGroup> selectmyNotAllowedGroupList(String userId) {
		return memberDao.selectmyNotAllowedGroupList(userId);
	}

	@Override
	public List<ApplocationGroup> selectmyNotJoinedGroupList(String userId) {
		return memberDao.selectmyNotJoinedGroupList(userId);
	}
	
	@Override
	public List<MemberInterestGroup> selectmyInterestedGroupList(String userId) {
		return memberDao.selectmyInterestedGroupList(userId); 
	}

	@Override
	public int updateMemberProfileAsDefault(String id) {
		// TODO Auto-generated method stub
		return memberDao.updateMemberProfileAsDefault(id);
	}

	@Override
	public int delete(int groupNo) {
		// TODO Auto-generated method stub
		return memberDao.delete(groupNo);
	}

	@Override
	public List<Member> selectAllMemberList() {
		// TODO Auto-generated method stub
		return memberDao.selectAllMemberList();
	}

	@Override
	public List<String> selectMemberAuthority(String id) {
		// TODO Auto-generated method stub
		return memberDao.selectMemberAuthority(id);
	}

	@Override
	public int deleteMember(String id) {
		// TODO Auto-generated method stub
		return memberDao.deleteMember(id);
	}

	@Override
	public int deleteMemberFromApplocationGroup(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return memberDao.deleteMemberFromApplocationGroup(param);
	}

	@Override
	public List<Integer> selectChatRoomNoList(int groupNo) {
		// TODO Auto-generated method stub
		return memberDao.selectChatRoomNoList(groupNo);
	}

	@Override
	public int deleteMemberFromChatuser(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return memberDao.deleteMemberFromChatuser(param);
	}

	@Override
	public int deleteMemberAuthorityAboutGroup(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return memberDao.deleteMemberAuthorityAboutGroup(param);
	}
	
	
	
}
