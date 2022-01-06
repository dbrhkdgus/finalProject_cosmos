package com.kh.cosmos.group.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.ToString;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MemberOfGroup implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int algNo;
	private String memberId;
	private int groupNo;
	private String groupAccept;
	private String answer;
	private String role;
	private Date joinRegDate;
}
