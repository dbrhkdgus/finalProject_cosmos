package com.kh.cosmos.common.attachment.model.vo;

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
public class Attachment implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int attachNo;
	private String memberId;
	private int groupNo;
	private String originalFilename;
	private String renamedFilename;
	private Date regDate;
	private String imgFlag;
	private String attachDeleted;
	
}
