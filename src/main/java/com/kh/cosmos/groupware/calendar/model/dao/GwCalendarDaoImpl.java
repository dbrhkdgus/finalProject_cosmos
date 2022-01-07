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

	@Override
	public int deleteSchedule(Map<String, String> param) {
		return session.update("calendar.deleteSchedule", param);
	}

	@Override
	public int changePrivateColor(Map<String, String> param) {
		return session.update("calendar.changePrivateColor", param);
	}
	
	@Override
	public int changeGroupColor(Map<String, String> param) {
		return session.update("calendar.changeGroupColor", param);
	}

	@Override
	public Schedule selectColor(Map<String, Object> param) {
		return session.selectOne("calendar.selectColor", param);
	}

	@Override
	public Schedule selectGroupColor(int groupNo) {
		return session.selectOne("calendar.selectGroupColor", groupNo);
	}

	@Override
	public String writerNickname(String id) {
		return session.selectOne("calendar.writerNickname", id);
	}




}
