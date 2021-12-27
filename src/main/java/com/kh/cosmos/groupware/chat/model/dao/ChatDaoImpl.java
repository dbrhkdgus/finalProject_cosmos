package com.kh.cosmos.groupware.chat.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	
}
