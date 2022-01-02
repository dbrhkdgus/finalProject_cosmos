package com.kh.cosmos.admin.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import oracle.sql.TIMESTAMP;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class EnrollMemberByMonth implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String MemberEnrollDate;
	private int cnt;
	
}
