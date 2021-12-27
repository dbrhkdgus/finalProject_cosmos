package com.kh.cosmos.groupware.service;

import java.util.List;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.model.vo.Room;
import com.kh.cosmos.member.model.vo.Member;

public interface GroupwareService {

	Group selectMyGroup(int groupNo);

	List<Member> selectAllGroupMembers(int groupNo);

	String selectMemberProfileRenamedFilename(String id);

	List<Group> selectAllMyGroup(String id);

	List<Attachment> selectAllGroupBannerAttach();

	List<ChatRoom> selectAllChatRoomByGroupNo(int groupNo);

	List<Room> selectAllZoomRoomList(int groupNo);

}
