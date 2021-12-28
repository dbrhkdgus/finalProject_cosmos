package com.kh.cosmos.ws.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.cosmos.groupware.chat.model.vo.ChatMessage;

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
	@SendTo("/dm/{path}")
	public String app(String chatMessageContent, @DestinationVariable String path) {
		log.debug("message = {}",chatMessageContent);
		return chatMessageContent;
	}
	@MessageMapping("/chat/{chatRoomNo}")
	@SendTo("/chat/{chatRoomNo}")
	public String chat(String chatMessageContent, @DestinationVariable int chatRoomNo) {
		log.debug("chatMessageContent = {}",chatMessageContent);

		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, String> map = new HashMap<String, String>();
		try {
			map = mapper.readValue(chatMessageContent, 
			        new TypeReference<HashMap<String, String>>() {});
		} catch (IOException e) {
			
		}  
		
		// 메시지 객체화
		ChatMessage chatMessage = new ChatMessage();
		chatMessage.setChatMessageContent(map.get("msg"));
		chatMessage.setChatRoomNo(Integer.parseInt(map.get("chatRoomNo")));
		// 메시지 타입 분기
		if(chatMessage.getChatMessageContent().startsWith("https://")) {
			chatMessage.setChatMessageTypeNo(2);
		}else if(chatMessage.getChatMessageContent().endsWith(".jpg") || chatMessage.getChatMessageContent().endsWith(".png") ) {
			chatMessage.setChatMessageTypeNo(3);
		}else {
			chatMessage.setChatMessageTypeNo(1);
		}
		
		
		log.debug("chatMessage = {}", chatMessage);
		
		return chatMessageContent;
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
