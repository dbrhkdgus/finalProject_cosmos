package com.kh.cosmos.groupware.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw/calendar")
public class GwCalendarController {

	@GetMapping("calendar.do")
	public void calendar(){
		
	}
}
