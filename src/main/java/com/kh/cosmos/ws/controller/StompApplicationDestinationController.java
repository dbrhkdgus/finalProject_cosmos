package com.kh.cosmos.ws.controller;

import java.util.Map;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class StompApplicationDestinationController {

	/**
	 * /app 메시지를 발행시 처리할 핸들러
	 * @MessageMapping : prefix를 제외한 주소
	 * @SendTo : simpleBroker에 보낼 주소, simpleBroker에 등록되어 있어야 한다.
	 * 
	 * @return
	 */
	@MessageMapping("/{path}")
	@SendTo("/foo/{path}")
	public String app(String message, @DestinationVariable String path) {
		log.debug("message = {}",message);
		return message;
	}
	
	/**
	 *  /app/admin/notice
	 *  /app/admin/notice/qwerty
	 *  
	 *  jsonStr -> Map<String,Object> -> jsonStr
	 * @return
	 */
	@MessageMapping("/admin/notice/{memberId}")
	@SendTo("/notice/{memberId}")
	public Map<String, Object> notice(@DestinationVariable String memberId, Map<String, Object> notice) {
		
		log.debug("memberId = {}", memberId);
		log.debug("notice = {}", notice);
		return notice;
	}
	

}
