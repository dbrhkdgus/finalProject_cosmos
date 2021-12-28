package com.kh.cosmos.groupware.calendar.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.groupware.calendar.model.dao.GwCalendarDao;

@Service
public class GwCalendarServiceImpl implements GwCalendarService {
	@Autowired
	private GwCalendarDao gwCalendarDao;
	
}
