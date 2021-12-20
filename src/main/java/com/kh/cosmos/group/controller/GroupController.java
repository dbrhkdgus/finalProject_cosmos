package com.kh.cosmos.group.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.group.model.service.GroupService;
import com.kh.cosmos.group.model.vo.Group;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/group")
public class GroupController {
	
	@Autowired
	private GroupService groupService;
	
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
	
	@PostMapping("/insertGroup.do")
	public String insertGroup(@ModelAttribute Group group, RedirectAttributes redirectAttributes) {
		log.debug("group = {}", group);
		try {
			int result = groupService.insertGroup(group);
			String msg = result > 0 ? "그룹 신청 성공!" : "그룹 신청 실패!";
			redirectAttributes.addFlashAttribute("msg", msg);
		} catch (Exception e) {
			log.error("메모등록 오류", e);
			throw e;
		}
		
		return "redirect:/";
	}
	
}





