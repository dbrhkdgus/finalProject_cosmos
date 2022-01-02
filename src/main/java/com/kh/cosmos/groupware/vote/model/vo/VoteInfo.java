package com.kh.cosmos.groupware.vote.model.vo;

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
public class VoteInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String voteTitle;
	private Date voteDeadline;
	private String memberName;
	private String voteQuestionTitle;
	private String voteQuestionType;
	private String memberId;
}
