package com.kh.cosmos.admin.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BoardType implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String boardType;
	private String boardTypeName;
}
