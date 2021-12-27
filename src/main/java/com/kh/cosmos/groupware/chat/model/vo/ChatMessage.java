package com.kh.cosmos.groupware.chat.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ChatMessage implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int chatMessageNo;
	private int chatRoomNO;
	private int chatUserNo;
	private String chatMessageContent;
	private Date chatMessageAt;
	private int chatMessageTypeNo;
	private int attachNo;

}
