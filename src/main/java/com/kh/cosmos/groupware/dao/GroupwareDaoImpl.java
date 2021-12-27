package com.kh.cosmos.groupware.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.member.model.vo.Member;

@Repository
public class GroupwareDaoImpl implements GroupwareDao {

	@Autowired
	private SqlSession session;

	@Override
	public Group selectMyGroup(int groupNo) {
		// TODO Auto-generated method stub
		return session.selectOne("gw.selectMyGroup", groupNo);
	}

	@Override
	public List<Member> selectAllGroupMembers(int groupNo) {
		// TODO Auto-generated method stub
		return session.selectList("gw.selectAllGroupMembers", groupNo);
	}

	@Override
	public String selectMemberProfileRenamedFilename(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("gw.selectMemberProfileRenamedFilename",id);
	}

	@Override
	public List<Group> selectAllMyGroup(String id) {
		// TODO Auto-generated method stub
		return session.selectList("gw.selectAllMyGroup",id);
	}

	@Override
	public List<Attachment> selectAllGroupBannerAttach() {
		// TODO Auto-generated method stub
		return session.selectList("gw.selectAllGroupBannerAttach");
	}

	@Override
	public List<ChatRoom> selectAllChatRoomByGroupNo(int groupNo) {
		// TODO Auto-generated method stub
		return session.selectList("gw.selectAllChatRoomByGroupNo",groupNo);
	}


	
}
