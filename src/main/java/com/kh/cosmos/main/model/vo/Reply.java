package com.kh.cosmos.main.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply implements Serializable{

	private static final long serialVersionUID = 1L;

	private int replyNo;
	private String memberId;
	private String content;
	private int replyLevel;
	private int replyRef;
	private Date regDate;
	private String deleteYn;
	private int boardNo;
	private int queNo;
	private int groupNo;
	
}
