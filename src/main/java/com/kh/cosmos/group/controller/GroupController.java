package com.kh.cosmos.group.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/group")
public class GroupController {
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/groupSearch.do")
	public String groupSearch() {
		return "group/groupSearch";
	}
	
	@GetMapping("/groupDetail.do")
	public String groupDetail() {
		return "group/groupDetail";
	}
	@GetMapping("/groupJoin.do")
	public String groupJoin() {
		return "group/groupJoin";
	}
	@GetMapping("/groupEnroll.do")
	public String groupEnroll() {
		return "group/groupEnroll";
	}
}





