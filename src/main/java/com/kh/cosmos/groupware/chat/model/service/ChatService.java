package com.kh.cosmos.groupware.chat.model.service;

import java.util.List;

import com.kh.cosmos.groupware.chat.model.vo.ChatMessage;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;

public interface ChatService {

	int createChatRoom(ChatRoom chatRoom);

	ChatRoom selectChatRoomByChatRoomNo(int chatRoomNo);

	List<ChatMessage> selectAllMessageFromChatRoomNo(int chatRoomNo);

}
