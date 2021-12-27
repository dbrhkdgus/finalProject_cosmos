package com.kh.cosmos.groupware.chat.model.dao;

import java.util.List;

import com.kh.cosmos.groupware.chat.model.vo.ChatMessage;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;

public interface ChatDao {

	int createChatRoom(ChatRoom chatRoom);

	ChatRoom selectChatRoomByChatRoomNo(int chatRoomNo);

	List<ChatMessage> selectAllMessageFromChatRoomNo(int chatRoomNo);

}
