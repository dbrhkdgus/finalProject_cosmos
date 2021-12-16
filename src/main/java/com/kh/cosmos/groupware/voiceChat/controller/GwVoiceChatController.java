package com.kh.cosmos.groupware.voiceChat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/voiceChat")
public class GwVoiceChatController {
	@GetMapping("/voiceChat.do")
	public void voice() {}
}
