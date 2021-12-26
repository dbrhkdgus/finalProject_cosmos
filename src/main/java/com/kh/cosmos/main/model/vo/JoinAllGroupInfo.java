package com.kh.cosmos.main.model.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.kh.cosmos.group.model.vo.MemberInterestGroup;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JoinAllGroupInfo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int groupNo;
	private String groupName;
	private Date groupEnrollDate;
	private int groupLikeCount;
	private char groupClose;
	private int groupPool;
	private int numOfMember;
	private String giTitle;
	private String category1Name;
	private String renamedFilename;
	private char imgFlag;
	private String category2Name;
	private boolean bool;
	
}
