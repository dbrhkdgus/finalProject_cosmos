package com.kh.cosmos.groupware.board.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostWithNickname extends Post implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String boardCategory;
	private String nickname;
	public PostWithNickname(int postNo, String memberId, int boardNo, String postTitle, String postContent,
			Date postRegDate, Date postUpdate, int attachNo, int boardCategoryNo, int postPassword, int readCount,
			String boardCategory, String nickname) {
		super(postNo, memberId, boardNo, postTitle, postContent, postRegDate, postUpdate, attachNo, boardCategoryNo,
				postPassword, readCount);
		this.boardCategory = boardCategory;
		this.nickname = nickname;
	}

	
	
	

}