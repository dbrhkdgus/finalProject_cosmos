package com.kh.cosmos.groupware.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/chat")
public class GwChatController {
	@GetMapping("/chat.do")
	public void chat() {}
	
	@GetMapping("/dm.do")
	public void dm() {}
}
