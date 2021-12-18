package com.kh.cosmos.main.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cosmos.main.model.service.MainService;
import com.kh.cosmos.main.model.vo.Notice;
import com.kh.cosmos.main.model.vo.Question;
import com.kh.cosmos.common.HiSpringUtils;

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
	public String noticeList(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		log.debug("cPage = {}", cPage);
		
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		List<Notice> list = mainService.selectNoticeList(offset, limit);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		int totalContent = mainService.selectNoticeTotalCount();
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);
		
		String url = request.getRequestURI();
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
		log.debug("pagebar = {}", pagebar);
		model.addAttribute("pagebar", pagebar);
		
		return "main/notice";
	}
	@GetMapping("/noticeForm.do")
	public String noticeForm() {
		
		return "main/noticeForm";
	}
	
	@GetMapping("/qa.do")
	public String qa(Model model) {
		List<Question> list = mainService.selectQuestionList();
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		return "main/qa";
	}
	@GetMapping("/qaForm.do")
	public String qaForm() {
		
		return "main/qaForm";
	}
	@PostMapping("/queEnroll.do")
	public String queEnroll(Question que) {
	
		return "redirect:qa.do";
	}
}
