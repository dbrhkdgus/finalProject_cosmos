package com.kh.cosmos.main.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cosmos.main.model.service.MainService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	private MainService mainService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/noticeList.do")
	public String noticeList() {
		
		return "main/notice";
	}
	
	@GetMapping("/qa.do")
	public String qa() {
		
		return "main/qa";
	}
}
