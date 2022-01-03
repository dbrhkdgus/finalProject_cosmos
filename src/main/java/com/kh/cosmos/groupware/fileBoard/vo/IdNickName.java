package com.kh.cosmos.groupware.fileBoard.vo;

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
public class IdNickName implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String nickName;
	
}
