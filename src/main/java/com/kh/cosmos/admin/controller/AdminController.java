package com.kh.cosmos.admin.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/main.do")
	public String main() {
		return "admin/main";
	}
	
	@GetMapping("/QnA.do")
	public String QnA() {
		return "admin/QnA";
	}
	
	@GetMapping("/board.do")
	public String board() {
		return "admin/board";
	}
	
	@GetMapping("/members.do")
	public String members() {
		return "admin/members";
	}
	@GetMapping("/groups.do")
	public String groups() {
		return "admin/groups";
	}
	
	@GetMapping("/StatisticsOfMember.do")
	public String StatisticsOfMember() {
		return "admin/StatisticsOfMember";
	}
	@GetMapping("/StatisticsOfGroup.do")
	public String StatisticsOfGroup() {
		return "admin/StatisticsOfGroup";
	}
	
}
