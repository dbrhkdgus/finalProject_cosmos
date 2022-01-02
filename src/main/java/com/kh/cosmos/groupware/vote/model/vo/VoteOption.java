package com.kh.cosmos.groupware.vote.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class VoteOption implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int voteNo;
	private int voteQuestionNo;
	private String voteOption;

}
