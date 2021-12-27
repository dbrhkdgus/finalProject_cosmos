package com.kh.cosmos.groupware.board.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int boardNo;
	private int groupNo;
	private String boardName;
	private char boardType;
	
}
