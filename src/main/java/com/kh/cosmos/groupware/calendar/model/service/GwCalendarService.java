package com.kh.cosmos.groupware.calendar.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.cosmos.groupware.calendar.model.vo.Schedule;

public interface GwCalendarService {

	int insertSchedule(Map<String, Object> obj);

	List<Schedule> selectScheduleList(int groupNo);

	int deleteSchedule(Map<String, String> param);

}
