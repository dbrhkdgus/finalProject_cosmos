package com.kh.cosmos.groupware.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.calendar.model.vo.Schedule;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.dao.GroupwareDao;
import com.kh.cosmos.groupware.model.vo.Room;
import com.kh.cosmos.member.model.vo.Member;

@Service
public class GroupwareServiceImpl implements GroupwareService {
	
	@Autowired
	private GroupwareDao gwDao;

	@Override
	public Group selectMyGroup(int groupNo) {
		// TODO Auto-generated method stub
		return gwDao.selectMyGroup(groupNo);
	}

	@Override
	public List<Member> selectAllGroupMembers(int groupNo) {
		// TODO Auto-generated method stub
		return gwDao.selectAllGroupMembers(groupNo);
	}

	@Override
	public String selectMemberProfileRenamedFilename(String id) {
		// TODO Auto-generated method stub
		return gwDao.selectMemberProfileRenamedFilename(id);
	}

	@Override
	public List<Group> selectAllMyGroup(String id) {
		// TODO Auto-generated method stub
		return gwDao.selectAllMyGroup(id);
	}

	@Override
	public List<Attachment> selectAllGroupBannerAttach() {
		// TODO Auto-generated method stub
		return gwDao.selectAllGroupBannerAttach();
	}

	@Override
	public List<ChatRoom> selectAllChatRoomByGroupNo(int groupNo) {
		// TODO Auto-generated method stub
		return gwDao.selectAllChatRoomByGroupNo(groupNo);
	}

	@Override
	public List<Board> selectAllBoardRoomByGroupNo(int groupNo) {
		// TODO Auto-generated method stub
		return gwDao.selectAllBoardRoomByGroupNo(groupNo);
	}
	
	@Override
	public List<Room> selectAllZoomRoomList(int groupNo) {
		return gwDao.selectAllZoomRoomList(groupNo);
	}

	@Override
	public Room selectRoomInfoByGroupNoAndRoomNo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return gwDao.selectRoomInfoByGroupNoAndRoomNo(param);
	}

	@Override
	public int insertVoiceChatRoom(Room room) {
		// TODO Auto-generated method stub
		return gwDao.insertVoiceChatRoom(room);
	}

	@Override
	public int deleteVoiceChatRoom(int roomNo) {
		// TODO Auto-generated method stub
		return gwDao.deleteVoiceChatRoom(roomNo);
	}

	@Override
	public List<Board> selectAllBoardRoomByGroupNotice(int groupNo) {
		// TODO Auto-generated method stub
		return gwDao.selectAllBoardRoomByGroupNotice(groupNo);
	}

	@Override
	public ApplocationGroup selectApplocationGroup(Map<String,Object> param) {
		// TODO Auto-generated method stub
		return gwDao.selectApplocationGroup(param);
	}

	@Override
	public List<Schedule> selectTodayScheduleListByGroupNo(int groupNo) {
		// TODO Auto-generated method stub
		return gwDao.selectTodayScheduleListByGroupNo(groupNo);
	}

	


	
}
