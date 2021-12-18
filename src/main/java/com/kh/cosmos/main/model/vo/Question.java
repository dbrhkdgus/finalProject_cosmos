package com.kh.cosmos.main.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Question implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int queNo;
	private String memberId;
	private String memberName;
	private boolean status;
	private String queTitle;
	private String queContent;
	private Date regDate;
	private int attachNo;
	private String queCategory;
}
