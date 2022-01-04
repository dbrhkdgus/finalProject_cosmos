package com.kh.cosmos.groupware.board.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostReplyCount extends Post implements Serializable {
			
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;	
	
	private int postNo;
	private int replyCnt;

}
