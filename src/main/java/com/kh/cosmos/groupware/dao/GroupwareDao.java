package com.kh.cosmos.groupware.dao;

import java.util.List;
import java.util.Map;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.board.model.vo.PostWithBoardName;
import com.kh.cosmos.groupware.calendar.model.vo.Schedule;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.model.vo.Room;
import com.kh.cosmos.member.model.vo.Member;

public interface GroupwareDao {

	Group selectMyGroup(int groupNo);

	List<Member> selectAllGroupMembers(int groupNo);

	String selectMemberProfileRenamedFilename(String id);

	List<Group> selectAllMyGroup(String id);

	List<Attachment> selectAllGroupBannerAttach();

	List<ChatRoom> selectAllChatRoomByGroupNo(int groupNo);

	List<Board> selectAllBoardRoomByGroupNo(int groupNo);
	
	List<Room> selectAllZoomRoomList(int groupNo);

	Room selectRoomInfoByGroupNoAndRoomNo(Map<String, Object> param);

	int insertVoiceChatRoom(Room room);

	int deleteVoiceChatRoom(int roomNo);

	List<Board> selectAllBoardRoomByGroupNotice(int groupNo);

	ApplocationGroup selectApplocationGroup(Map<String,Object> param);

	List<Schedule> selectTodayScheduleListByGroupNo(int groupNo);

	List<PostWithBoardName> selectNewPostsListByParam(Map<String, Object> param);



	
}
