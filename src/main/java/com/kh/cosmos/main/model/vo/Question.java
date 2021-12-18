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
	
	private int No;
	private String memberId;
	private boolean status;
	private String title;
	private String content;
	private Date regDate;
	private int attachNo;
}
