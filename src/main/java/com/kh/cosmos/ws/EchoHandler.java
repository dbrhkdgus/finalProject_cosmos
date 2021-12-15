package com.kh.cosmos.ws;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class EchoHandler extends TextWebSocketHandler {
	/**
	 * ThreadSafe한 ArrayList
	 * - 동기화 지원
	 */
	List<WebSocketSession> sessionList = new CopyOnWriteArrayList<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		log.debug("[현재 세션 수 {}] {} 연결!", sessionList.size(),session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String sessionId = session.getId();
		String payload = message.getPayload(); // 실제 내용
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(sessionId + " : " + payload));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		log.debug("[현재 세션 수 {}] {} 연결해제!", sessionList.size(),session.getId());
	}
	
}
