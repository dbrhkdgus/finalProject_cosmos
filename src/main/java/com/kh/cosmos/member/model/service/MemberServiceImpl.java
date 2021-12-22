package com.kh.cosmos.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cosmos.group.model.vo.ApplocationGroup;
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
	
}
