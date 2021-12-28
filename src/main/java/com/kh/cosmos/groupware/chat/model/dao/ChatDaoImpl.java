package com.kh.cosmos.groupware.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.groupware.chat.model.vo.ChatMessage;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.chat.model.vo.ChatUser;

@Repository
public class ChatDaoImpl implements ChatDao {
	@Autowired
	private SqlSession session;

	@Override
	public int createChatRoom(ChatRoom chatRoom) {
		// TODO Auto-generated method stub
		return session.insert("chat.createChatRoom", chatRoom);
	}

	@Override
	public ChatRoom selectChatRoomByChatRoomNo(int chatRoomNo) {
		// TODO Auto-generated method stub
		return session.selectOne("chat.selectChatRoomByChatRoomNo", chatRoomNo);
	}

	@Override
	public List<ChatMessage> selectAllMessageFromChatRoomNo(int chatRoomNo) {
		// TODO Auto-generated method stub
		return session.selectList("chat.selectAllMessageFromChatRoomNo", chatRoomNo);
	}

	@Override
	public String selectGroupMasterId(int groupNo) {
		// TODO Auto-generated method stub
		return session.selectOne("chat.selectGroupMasterId", groupNo);
	}

	@Override
	public int insertChatAdminByParam(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.insert("chat.insertChatAdminByParam", param);
	}

	@Override
	public int insertChatUserByParam(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.insert("chat.insertChatUserByParam", param);
	}

	@Override
	public List<ChatUser> selectChatUserList(int chatRoomNo) {
		// TODO Auto-generated method stub
		return session.selectList("chat.selectChatUserList", chatRoomNo);
	}

	@Override
	public List<String> selectChatUserIdList(int chatRoomNo) {
		// TODO Auto-generated method stub
		return session.selectList("chat.selectChatUserIdList", chatRoomNo);
	}

	@Override
	public int insertChatUserByParamWithAdminNo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.insert("chat.insertChatUserByParamWithAdminNo", param);
	}
	
	
	
}
