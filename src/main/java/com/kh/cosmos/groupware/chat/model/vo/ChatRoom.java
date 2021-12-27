package com.kh.cosmos.groupware.chat.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ChatRoom implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int chatRoomNo;
	private String chatRoomName;
	private String chatRoomPush;
	private String chatRoomNew;
	private Date chatRegDate;
	private Date chatUpdate;
	private int groupNo;

}
