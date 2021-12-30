package com.kh.cosmos.groupware.calendar.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Schedule implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String scheduleNo;
	private String groupNo;
	private String memberId;
	private String title;
	private String content;
	private String startDate;
	private String endDate;
	private String allDay;
	private String category;
	private String regDate;
}
