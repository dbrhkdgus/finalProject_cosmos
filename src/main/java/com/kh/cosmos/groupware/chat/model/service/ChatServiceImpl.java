package com.kh.cosmos.groupware.chat.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.groupware.chat.model.dao.ChatDao;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;

@Service
public class ChatServiceImpl implements ChatService {
	@Autowired
	private ChatDao chatDao;

	@Override
	public int createChatRoom(ChatRoom chatRoom) {
		// TODO Auto-generated method stub
		return chatDao.createChatRoom(chatRoom);
	}
	
	
}
