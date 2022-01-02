package com.kh.cosmos.groupware.app.model.vo;

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
public class TDL implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int tdlNo;
	private String tdlContent;
	private char tdlChecked;
	private Date tdlCreateDate;
	private Date tdlEndDate;
	private String memberId;
	private int groupNo;
}
