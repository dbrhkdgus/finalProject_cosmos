package com.kh.cosmos.main.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.main.model.service.MainService;
import com.kh.cosmos.main.model.vo.Notice;
import com.kh.cosmos.main.model.vo.Question;
import com.kh.cosmos.common.HiSpringUtils;
import com.kh.cosmos.common.vo.Attachment;

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
	@PostMapping("/noticeEnroll.do")
	public String noticeEnroll(Notice notice, @RequestParam(value="upFile", required=false) MultipartFile upFile, RedirectAttributes redirectAttr) throws IllegalStateException, IOException {
		log.debug("notice = {}", notice);
		try {
			String saveDirectory = application.getRealPath("/resources/upFile/notice");
			log.debug("saveDirectory = {}", saveDirectory);
			
	
				if(!upFile.isEmpty() && upFile.getSize() != 0) {
					
					log.debug("upFile = {}", upFile);
					log.debug("upFile.name = {}", upFile.getOriginalFilename());
					log.debug("upFile.size = {}", upFile.getSize());
					
					String originalFilename = upFile.getOriginalFilename();
					String renamedFilename = HiSpringUtils.getRenamedFilename(originalFilename);
	
					// 1.서버컴퓨터에 저장
					File dest = new File(saveDirectory, renamedFilename);
					log.debug("dest = {}", dest);
					upFile.transferTo(dest);
					
					// 2.DB에 attachment 레코드 등록
					Attachment attach = new Attachment();
					attach.setRenamedFilename(renamedFilename);
					attach.setOriginalFilename(originalFilename);
					attachments.add(attach);
				}
			
			
			// 업무로직
			int result = mainService.insertNotice(notice);
			String msg = result > 0 ? "공지사항 등록 성공!" : "공지사항 등록 실패!";
			redirectAttr.addFlashAttribute("msg", msg);
		} catch (Exception e) {
			log.error(e.getMessage(), e); // 로깅
			throw e; // spring container에게 던짐.
		}
		return "redirect:/main/noticeList.do";
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
