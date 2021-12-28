package com.kh.cosmos.groupware.board.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Post implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int postNo;
	private String memberId;
	private int boardNo;
	private String postTitle;
	private String postContent;
	private String postCategory;
	private Date postRegDate;
	private Date postUpdate;
	private int attachNo;
	
}
