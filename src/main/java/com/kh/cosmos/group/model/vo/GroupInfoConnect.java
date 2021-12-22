package com.kh.cosmos.group.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class GroupInfoConnect implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int seqNo;
	private int groupNo;
	private String giTitle;
	
}
