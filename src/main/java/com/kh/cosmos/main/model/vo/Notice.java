package com.kh.cosmos.main.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice implements Serializable{

	private static final long serialVersionUID = 1L;

	private int no;
	private String title;
	private String content;
	private Date regDate;
	private int readCount;
	
}
