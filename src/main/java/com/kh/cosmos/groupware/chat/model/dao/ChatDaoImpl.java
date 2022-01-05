package com.kh.cosmos.groupware.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.groupware.chat.model.vo.ChatMessage;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.chat.model.vo.ChatUser;
import com.kh.cosmos.groupware.chat.model.vo.DM;
import com.kh.cosmos.member.model.vo.Member;

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

	@Override
	public int selectChatUserNoByMemberId(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("chat.selectChatUserNoByMemberId", param);
	}

	@Override
	public int insertChatMessage(ChatMessage chatMessage) {
		// TODO Auto-generated method stub
		return session.insert("chat.insertChatMessage", chatMessage);
	}

	@Override
	public String selectMemberNameByMemberId(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("chat.selectMemberNameByMemberId", id);
	}

	@Override
	public List<Attachment> selectMemberProfileAttachList() {
		// TODO Auto-generated method stub
		return session.selectList("chat.selectMemberProfileAttachList");
	}

	@Override
	public int insertDm(DM dm) {
		// TODO Auto-generated method stub
		return session.insert("chat.insertDm", dm);
	}

	@Override
	public List<DM> selectDMListByParam(Map<String, String> param) {
		// TODO Auto-generated method stub
		return session.selectList("chat.selectDMListByParam", param);
	}

	@Override
	public DM selectMynewDM(Map<String, String> param) {
		// TODO Auto-generated method stub
		return session.selectOne("chat.selectMynewDM", param);
	}

	@Override
	public List<String> selectMySenderList(String receiver) {
		// TODO Auto-generated method stub
		return session.selectList("chat.selectMySenderList", receiver);
	}

	@Override
	public int newDMCheck(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("chat.newDMCheck", id);
	}

	@Override
	public int insertChatMessageWithFile(ChatMessage chatMessage) {
		// TODO Auto-generated method stub
		return session.insert("chat.insertChatMessageWithFile", chatMessage);
	}

	@Override
	public int deleteChatRoom(int chatRoomNo) {
		// TODO Auto-generated method stub
		return session.delete("chat.deleteChatRoom",chatRoomNo);
	}
	
	
	
	
	
}
