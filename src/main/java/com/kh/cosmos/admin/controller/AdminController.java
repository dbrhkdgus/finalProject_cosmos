package com.kh.cosmos.admin.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cosmos.common.CosmosUtils;
import com.kh.cosmos.main.model.service.MainService;
import com.kh.cosmos.main.model.vo.Question;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private MainService mainService;

	@GetMapping("/main.do")
	public String main() {
		return "admin/main";
	}
	
	@GetMapping("/QnA.do")
	public String QnA(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		int limit = 10;
		int offset = (cPage -1)*limit;
		
		List<Question> list = mainService.selectQuestionList(limit, offset);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		int totalContent = mainService.selectQuestionTotalCount();
		model.addAttribute("totalContent", totalContent);
		
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		
		model.addAttribute("pagebar", pagebar);
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
