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
public class Vote implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int groupNo;
	private int voteNo;
	private String voteTitle;
	private Date voteDeadline;
	private Date voteEnrollDate;
	private String memberId;
	
}
