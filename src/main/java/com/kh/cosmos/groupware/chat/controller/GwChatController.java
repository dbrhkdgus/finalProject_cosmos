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
	public void chatRoom(int groupNo, int chatRoomNo, Model model, Authentication auth) {
		groupwareHeaderSet(groupNo, model, auth);
		
		ChatRoom chatRoom = chatService.selectChatRoomByChatRoomNo(chatRoomNo);
		
		List<ChatMessage> messageList = chatService.selectAllMessageFromChatRoomNo(chatRoomNo);
		model.addAttribute("messageList",messageList);
		model.addAttribute("title", "#"+chatRoom.getChatRoomName());
		model.addAttribute("chatRoomNo",chatRoomNo);
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
		List<String> chatAdminId = new ArrayList<String>();
		chatAdminId.add(groupMasterId);
		chatAdminId.add(loginMember.getId());
		for(String id : chatAdminId) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("chatRoomNo", chatRoom.getChatRoomNo());
			param.put("memberId", id);
			result = chatService.insertChatAdminByParam(param);
		}
		
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
