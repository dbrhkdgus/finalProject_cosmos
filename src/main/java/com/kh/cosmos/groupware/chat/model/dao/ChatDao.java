package com.kh.cosmos.groupware.chat.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.groupware.chat.model.vo.ChatMessage;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.chat.model.vo.ChatUser;
import com.kh.cosmos.groupware.chat.model.vo.DM;
import com.kh.cosmos.member.model.vo.Member;

public interface ChatDao {

	int createChatRoom(ChatRoom chatRoom);

	ChatRoom selectChatRoomByChatRoomNo(int chatRoomNo);

	List<ChatMessage> selectAllMessageFromChatRoomNo(int chatRoomNo);

	String selectGroupMasterId(int groupNo);

	int insertChatAdminByParam(Map<String, Object> param);

	int insertChatUserByParam(Map<String, Object> param);

	List<ChatUser> selectChatUserList(int chatRoomNo);

	List<String> selectChatUserIdList(int chatRoomNo);

	int insertChatUserByParamWithAdminNo(Map<String, Object> param);

	int selectChatUserNoByMemberId(Map<String, Object> param);

	int insertChatMessage(ChatMessage chatMessage);

	String selectMemberNameByMemberId(String id);

	List<Attachment> selectMemberProfileAttachList();

	int insertDm(DM dm);

	List<DM> selectDMListByParam(Map<String, String> param);

	DM selectMynewDM(Map<String, String> param);

	List<String> selectMySenderList(String receiver);

	int newDMCheck(String id);

	int insertChatMessageWithFile(ChatMessage chatMessage);

	int deleteChatRoom(int chatRoomNo);

}
