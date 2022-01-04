package com.kh.cosmos.admin.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BoardData implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int postNo;
	private String memberId;
	private String postTitle;
	private Date postRegDate;
	private String nickname;
	private int groupNo;
	private String boardType;
	private String boardName;
	private String boardTypeName;
	private String groupName;
}
