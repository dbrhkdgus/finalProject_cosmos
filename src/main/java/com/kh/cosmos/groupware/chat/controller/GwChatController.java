package com.kh.cosmos.groupware.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.groupware.chat.model.service.ChatService;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/chat")
public class GwChatController {
	@Autowired
	private ChatService chatService;
	@GetMapping("/chat.do")
	public void chat() {}
	
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
}
