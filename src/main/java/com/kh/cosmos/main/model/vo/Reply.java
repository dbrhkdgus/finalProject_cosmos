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

	int replyNo;
	String memberId;
	String content;
	int replyLevel;
	int replyRef;
	Date regDate;
	String deleteYn;
	int boardNo;
	int queNo;
	
}
