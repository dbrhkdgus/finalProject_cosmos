package com.kh.cosmos.groupware.chat.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.groupware.chat.model.vo.ChatMessage;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.chat.model.vo.ChatUser;

public interface ChatDao {

	int createChatRoom(ChatRoom chatRoom);

	ChatRoom selectChatRoomByChatRoomNo(int chatRoomNo);

	List<ChatMessage> selectAllMessageFromChatRoomNo(int chatRoomNo);

	String selectGroupMasterId(int groupNo);

	int insertChatAdminByParam(Map<String, Object> param);

	int insertChatUserByParam(Map<String, Object> param);

	List<ChatUser> selectChatUserList(int chatRoomNo);

}
