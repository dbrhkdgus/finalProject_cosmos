package com.kh.cosmos.groupware.board.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostWithCategory extends Post implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String boardCategory;

	public PostWithCategory(int postNo, String memberId, int boardNo, String postTitle, String postContent,
			Date postRegDate, Date postUpdate, int attachNo, int boardCategoryNo, String boardCategory, int postPassword, int readCount) {
		super(postNo, memberId, boardNo, postTitle, postContent, postRegDate, postUpdate, attachNo, boardCategoryNo, postPassword, readCount);
		this.boardCategory = boardCategory;
	}
	
	
}
