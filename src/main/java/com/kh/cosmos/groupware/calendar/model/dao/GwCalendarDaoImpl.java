package com.kh.cosmos.groupware.calendar.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.groupware.calendar.model.vo.Schedule;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class GwCalendarDaoImpl implements GwCalendarDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public int insertSchedule(Map<String, Object> obj) {
		int result= session.insert("calendar.insertSchedule", obj);
		return result;
	}

	@Override
	public List<Schedule> selectScheduleList(int groupNo) {
		return session.selectList("calendar.selectScheduleList", groupNo);
	}

}
