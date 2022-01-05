package com.kh.cosmos.groupware.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.groupware.chat.model.dao.ChatDao;
import com.kh.cosmos.groupware.chat.model.vo.ChatMessage;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.chat.model.vo.ChatUser;
import com.kh.cosmos.groupware.chat.model.vo.DM;
import com.kh.cosmos.member.model.vo.Member;

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

	@Override
	public String selectGroupMasterId(int groupNo) {
		// TODO Auto-generated method stub
		return chatDao.selectGroupMasterId(groupNo);
	}

	@Override
	public int insertChatAdminByParam(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return chatDao.insertChatAdminByParam(param);
	}

	@Override
	public int insertChatUserByParam(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return chatDao.insertChatUserByParam(param);
	}

	@Override
	public List<ChatUser> selectChatUserList(int chatRoomNo) {
		// TODO Auto-generated method stub
		return chatDao.selectChatUserList(chatRoomNo);
	}

	@Override
	public List<String> selectChatUserIdList(int chatRoomNo) {
		// TODO Auto-generated method stub
		return chatDao.selectChatUserIdList(chatRoomNo);
	}

	@Override
	public int insertChatUserByParamWithAdminNo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return chatDao.insertChatUserByParamWithAdminNo(param);
	}

	@Override
	public int selectChatUserNoByMemberId(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return chatDao.selectChatUserNoByMemberId(param);
	}

	@Override
	public int insertChatMessage(ChatMessage chatMessage) {
		// TODO Auto-generated method stub
		return chatDao.insertChatMessage(chatMessage);
	}

	@Override
	public String selectMemberNameByMemberId(String id) {
		// TODO Auto-generated method stub
		return chatDao.selectMemberNameByMemberId(id);
	}

	@Override
	public List<Attachment> selectMemberProfileAttachList() {
		// TODO Auto-generated method stub
		return chatDao.selectMemberProfileAttachList();
	}

	@Override
	public int insertDm(DM dm) {
		// TODO Auto-generated method stub
		return chatDao.insertDm(dm);
	}

	@Override
	public List<DM> selectDMListByParam(Map<String, String> param) {
		// TODO Auto-generated method stub
		return chatDao.selectDMListByParam(param);
	}

	@Override
	public DM selectMynewDM(Map<String, String> param) {
		// TODO Auto-generated method stub
		return chatDao.selectMynewDM(param);
	}

	@Override
	public List<String> selectMySenderList(String receiver) {
		// TODO Auto-generated method stub
		return chatDao.selectMySenderList(receiver);
	}

	@Override
	public int newDMCheck(String id) {
		// TODO Auto-generated method stub
		return chatDao.newDMCheck(id);
	}

	@Override
	public int insertChatMessageWithFile(ChatMessage chatMessage) {
		// TODO Auto-generated method stub
		return chatDao.insertChatMessageWithFile(chatMessage);
	}

	@Override
	public int deleteChatRoom(int chatRoomNo) {
		// TODO Auto-generated method stub
		return chatDao.deleteChatRoom(chatRoomNo);
	}

	@Override
	public int deleteChatMessage(int chatMessageNo) {
		// TODO Auto-generated method stub
		return chatDao.deleteChatMessage(chatMessageNo);
	}

	@Override
	public int deleteDmMessage(int dmMessageNo) {
		// TODO Auto-generated method stub
		return chatDao.deleteDmMessage(dmMessageNo);
	}

	@Override
	public List<Member> selectAllChatUsers(int chatRoomNo) {
		// TODO Auto-generated method stub
		return chatDao.selectAllChatUsers(chatRoomNo);
	}

	@Override
	public String selectChatRoomNoByChatRoomNo(int chatRoomNo) {
		// TODO Auto-generated method stub
		return chatDao.selectChatRoomNoByChatRoomNo(chatRoomNo);
	}
	
	
	
	
}
