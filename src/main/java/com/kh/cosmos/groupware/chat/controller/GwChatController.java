package com.kh.cosmos.groupware.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.chat.model.service.ChatService;
import com.kh.cosmos.groupware.chat.model.vo.ChatMessage;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.chat.model.vo.ChatUser;
import com.kh.cosmos.groupware.service.GroupwareService;
import com.kh.cosmos.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/chat")
public class GwChatController {
	@Autowired
	private ChatService chatService;
	@Autowired
	private GroupwareService gwService;
	@GetMapping("/chatRoom.do")
	public String chatRoom(int groupNo, int chatRoomNo, Model model, Authentication auth, RedirectAttributes redirectAtt) {
		// 채팅방 참여 인원만 입장가능
		// 채팅방이 전체 채팅방인 경우(chatRoomOpenType == all), 채팅방에 입장한 사람들은 
		// 기존 chat_user 테이블에 인서트
		// 채팅방이 전체 채팅방이 아닌 경우는 리턴처리.
		ChatRoom chatRoom = chatService.selectChatRoomByChatRoomNo(chatRoomNo);
		if(!chatRoom.getChatRoomOpenType().equals("all")) {
				
			Member loginMember = (Member) auth.getPrincipal(); 
			List<ChatUser> chatUserList = chatService.selectChatUserList(chatRoomNo);
			log.debug("chatUserList = {}",chatUserList);
			boolean flag = false;
			for(ChatUser cu : chatUserList) {
				if(cu.getMemberId().equals(loginMember.getId())) {
					flag = true;
				}
			}
			if(!flag) {
				redirectAtt.addAttribute("msg", "채팅방 입장 권한이 없습니다.");
				return "redirect:/gw/gw.do?groupNo="+groupNo;
			}
		}
		
		// 채팅방이 전체 채팅방인 경우, 입장 인원에 대해 chatUser테이블에 인서트
		
		groupwareHeaderSet(groupNo, model, auth);
		
		
		List<ChatMessage> messageList = chatService.selectAllMessageFromChatRoomNo(chatRoomNo);
		model.addAttribute("messageList",messageList);
		model.addAttribute("title", "#"+chatRoom.getChatRoomName());
		model.addAttribute("chatRoomNo",chatRoomNo);
		
		return "gw/chat/chatRoom";
	}
	
	@GetMapping("/dm.do")
	public void dm() {}
	
	@PostMapping("/createChatRoom.do")
	public String createChatRoom(ChatRoom chatRoom, String chatRoomOpenType,int groupNo, RedirectAttributes redirectAtt, Authentication auth) {
		log.debug("chatRoom = {}", chatRoom);
		Member loginMember = (Member) auth.getPrincipal(); 
		List<Member> myGroupMemberList = gwService.selectAllGroupMembers(groupNo);
		
		
		//채팅방 개설
		int result = chatService.createChatRoom(chatRoom);
		
		//관리자 설정 (채팅방 개설자와 그룹장이 최초 채팅방 관리 권한을 가짐.)
		String groupMasterId = chatService.selectGroupMasterId(groupNo);
		String adminIds = groupMasterId;
		if(!groupMasterId.equals(loginMember.getId())) {
			adminIds += ", " + loginMember.getId();
		}
		
		Map<String, Object> param1 = new HashMap<String, Object>();
		param1.put("chatRoomNo", chatRoom.getChatRoomNo());
		param1.put("memberId", adminIds);
		result = chatService.insertChatAdminByParam(param1);
		
		
		// 전체채팅방 개설의 경우, 그룹원 모두를 채팅방의 참여자로 설정한다.
		if(chatRoomOpenType.equals("all")) {
			for(Member m : myGroupMemberList) {
				Map<String, Object> param = new HashMap<>();
				param.put("chatRoomNo", chatRoom.getChatRoomNo());
				param.put("memberId", m.getId());
								
				result = chatService.insertChatUserByParam(param);
							
							
			}
		}

		
		redirectAtt.addAttribute("groupNo", chatRoom.getGroupNo());
		return "redirect:/gw/gw.do";
	}
	
	public void groupwareHeaderSet(int groupNo, Model model, Authentication auth) {
		Member loginMember = (Member) auth.getPrincipal();
		Group myGroup = gwService.selectMyGroup(groupNo);
		List<Member> myGroupMemberList = gwService.selectAllGroupMembers(groupNo);
		
		
		
		List<Group> myGroupList = gwService.selectAllMyGroup(loginMember.getId());
		List<Attachment> groupBannerAttachList = gwService.selectAllGroupBannerAttach();
		List<String> memberProfileRenamedFilenameList = new ArrayList<String>();
		for(Member m : myGroupMemberList) {
			String memberProfileRenamedFilename = gwService.selectMemberProfileRenamedFilename(m.getId());
			memberProfileRenamedFilenameList.add(memberProfileRenamedFilename);
		}

		List<ChatRoom> chattingChannelList = gwService.selectAllChatRoomByGroupNo(groupNo);
		
		model.addAttribute("currGroupNo", groupNo);
		model.addAttribute("myGroup", myGroup);
		model.addAttribute("myGroupMemberList", myGroupMemberList);
		model.addAttribute("chattingChannelList", chattingChannelList);
		model.addAttribute("profile", gwService.selectMemberProfileRenamedFilename(loginMember.getId()));
		model.addAttribute("memberProfileRenamedFilenameList", memberProfileRenamedFilenameList);
		model.addAttribute("groupBannerAttachList", groupBannerAttachList);
		model.addAttribute("myGroupList", myGroupList);
	}
}
