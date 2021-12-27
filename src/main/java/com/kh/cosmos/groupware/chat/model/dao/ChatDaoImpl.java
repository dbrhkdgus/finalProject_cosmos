package com.kh.cosmos.groupware.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.groupware.chat.model.vo.ChatMessage;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;

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
	
	
}