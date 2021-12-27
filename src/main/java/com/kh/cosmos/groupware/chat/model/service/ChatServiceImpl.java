package com.kh.cosmos.groupware.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.groupware.chat.model.dao.ChatDao;
import com.kh.cosmos.groupware.chat.model.vo.ChatMessage;
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

	@Override
	public ChatRoom selectChatRoomByChatRoomNo(int chatRoomNo) {
		// TODO Auto-generated method stub
		return chatDao.selectChatRoomByChatRoomNo(chatRoomNo);
	}

	@Override
	public List<ChatMessage> selectAllMessageFromChatRoomNo(int chatRoomNo) {
		// TODO Auto-generated method stub
		return chatDao.selectAllMessageFromChatRoomNo(chatRoomNo);
	}
	
	
}