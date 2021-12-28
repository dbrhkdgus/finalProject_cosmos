package com.kh.cosmos.ws.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ws")
public class WebSocketController {
	
	@GetMapping("/websocket.do")
	public void websocket() {}

	@GetMapping("/sockjs.do")
	public void sockjs() {}
	
	@GetMapping("/stomp.do")
	public void stomp() {}
}
