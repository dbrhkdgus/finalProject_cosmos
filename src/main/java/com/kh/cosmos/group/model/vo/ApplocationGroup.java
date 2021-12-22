package com.kh.cosmos.group.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ApplocationGroup implements Serializable {/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int algNo;
	private String memberId;
	private int groupNo;
	private char groupAccept;
	private char role;
	private String answer;

}
