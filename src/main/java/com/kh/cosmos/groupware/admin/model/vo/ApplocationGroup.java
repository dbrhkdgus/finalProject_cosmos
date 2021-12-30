package com.kh.cosmos.groupware.admin.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.kh.cosmos.groupware.fileBoard.vo.FileEnroll;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ApplocationGroup implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int algNo;
	private String memberId;
	private int groupNo;
	private String groupAccept;
	private String answer;
	private String role;
	private Date joinRegDate;
	

}
