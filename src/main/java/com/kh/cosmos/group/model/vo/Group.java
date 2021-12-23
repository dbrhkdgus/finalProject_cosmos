package com.kh.cosmos.group.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Group implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int groupNo;
	private int categoryNo;
	private String groupName;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date groupEnrollDate;
	private char groupCharge;
	private char groupClose;
	private int groupPool;
	private char groupPrivate;
	private int groupLikeCount;
	private String groupLocation;
	
}
