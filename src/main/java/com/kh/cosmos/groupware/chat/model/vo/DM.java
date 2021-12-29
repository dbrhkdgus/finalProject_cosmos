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
public class DM implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int dmNO;
	private String dmSender;
	private String dmReceiver;
	private String dmContent;
	private Date dmMessageAt;
	private int chatMessageTypeNo;
	private int attchNo;
	
	private String dmSenderName;
	private String dmSenderProfileRenamedFilename;
}
