package com.kh.cosmos.groupware.vote.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class VoteQuestion implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int voteNo;
	private int voteQuestionNO;
	private String voteQuestionTitle;
	private String voteOptionNo;
	private String voteQuestionType;
}
