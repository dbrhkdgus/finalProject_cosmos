package com.kh.cosmos.groupware.chat.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.common.CosmosUtils;
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
	public String createChatRoom(ChatRoom chatRoom, RedirectAttributes redirectAtt) {
		log.debug("chatRoom = {}", chatRoom);
		int result = chatService.createChatRoom(chatRoom);
		redirectAtt.addAttribute("groupNo", chatRoom.getGroupNo());
		redirectAtt.addAttribute("msg", result > 0 ? "채팅방 ["+chatRoom.getChatRoomName()+"]이 개설되었습니다." : "실패");
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
