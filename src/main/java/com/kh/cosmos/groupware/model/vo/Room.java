package com.kh.cosmos.groupware.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Room implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int roomNo;
	private int groupNo;
	private String zoomId;
	private String zoomPassword;
	private String roomName;
	private String roomAdmin;

}
