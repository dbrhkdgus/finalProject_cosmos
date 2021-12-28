package com.kh.cosmos.groupware.fileBoard.vo;

import java.io.Serializable;
import java.util.Date;

import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class FileEnroll implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String fileTitle;
	private int fileCategoryNo;
	private Date fileRegDate;
	private int groupNo;
	private String boardType;
	private String boardTypeName;
	private String boardName;

	
}
