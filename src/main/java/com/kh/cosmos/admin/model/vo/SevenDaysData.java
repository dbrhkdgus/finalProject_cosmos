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
public class SevenDaysData implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int today6;
	private int today5;
	private int today4;
	private int today3;
	private int today2;
	private int today1;
	private int today;
	
}
