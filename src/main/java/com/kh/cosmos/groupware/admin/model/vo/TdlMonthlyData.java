package com.kh.cosmos.groupware.admin.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class TdlMonthlyData implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String monthlyData;
	private int count;
	private int memberCount;
}
