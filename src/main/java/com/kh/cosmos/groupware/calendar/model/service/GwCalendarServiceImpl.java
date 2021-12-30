package com.kh.cosmos.groupware.calendar.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.groupware.calendar.model.dao.GwCalendarDao;
import com.kh.cosmos.groupware.calendar.model.vo.Schedule;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class GwCalendarServiceImpl implements GwCalendarService {
	@Autowired
	private GwCalendarDao gwCalendarDao;

	@Override
	public int insertSchedule(Map<String, Object> obj) {
		System.out.println("여기는 ServiceImpl입니다........................");
		int result = gwCalendarDao.insertSchedule(obj); 
		return result;
	}

	@Override
	public List<Schedule> selectScheduleList(int groupNo) {
		return gwCalendarDao.selectScheduleList(groupNo);
	}

	@Override
	public int deleteSchedule(Map<String, String> param) {
		return gwCalendarDao.deleteSchedule(param);
	}
	
}
