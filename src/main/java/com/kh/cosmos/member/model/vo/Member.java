package com.kh.cosmos.member.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Member implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String memberId;
	private String memberName;
	private String nickname;
	private String password;
	private String memberEmail;
	private Date birthDay;
	private String phone;
	private String gender;
	private Date memberEnrollDate;
	private String memberJob;
	private String memberAchieve;
	

}
