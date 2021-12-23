package com.kh.cosmos.main.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.core.Authentication;

import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.common.CosmosUtils;
import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.main.model.service.MainService;
import com.kh.cosmos.main.model.vo.Notice;
import com.kh.cosmos.main.model.vo.Question;
import com.kh.cosmos.member.model.vo.Member;

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
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
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
		String memberId = notice.getMemberId();
		log.debug("memberId = {}", notice.getMemberId());
		 try {
			 String saveDirectory = application.getRealPath("/resources/upFile/notice");
			 log.debug("saveDirectory = {}", saveDirectory);
		 
		 
		 if(!upFile.isEmpty() && upFile.getSize() != 0) {
			 log.debug("upFile = {}", upFile);
			 log.debug("upFile.name = {}",upFile.getOriginalFilename());
			 log.debug("upFile.size = {}",upFile.getSize());
		 
			 String originalFilename = upFile.getOriginalFilename();
			 String renamedFilename = CosmosUtils.getRenamedFilename(originalFilename);
			 
			 // 1.서버컴퓨터에 저장
			 File dest = new File(saveDirectory, renamedFilename);
			 log.debug("dest = {}", dest);
			 upFile.transferTo(dest);
			 
			 // 2.DB에 attachment 레코드 등록
			 Attachment attach = new Attachment();
			 attach.setRenamedFilename(renamedFilename);
			 attach.setOriginalFilename(originalFilename);
			 attach.setMemberId(memberId);
			 int attachNo = mainService.insertAttach(attach);
			 log.debug("attachNo = {}", attachNo);
		 }
		 
		 // 업무로직
		 int result = mainService.insertNotice(notice); String msg = result > 0 ? "공지사항 등록 성공!" : "공지사항 등록 실패!";
		 redirectAttr.addFlashAttribute("msg", msg);
		 } catch (Exception e){
		 	log.error(e.getMessage(), e); // 로깅 throw e; //spring container에게 던짐.
		 }
		 
		return "redirect:/main/noticeList.do";
	}
	@GetMapping("/noticeDetail.do")
	public void noticeDetail(@RequestParam("no") int no, Model model) {
		log.debug("noticeNo = {}", no);
		
		Notice notice = mainService.selectOneNotice(no);
		log.debug("notice = {}", notice);
		int attachNo = notice.getAttachNo();
		Attachment attach = mainService.selectOneAttach(attachNo);
		model.addAttribute("notice", notice);
		model.addAttribute("attach", attach);
	}
	
	@GetMapping("/qa.do")
	public String qa(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		List<Question> list = mainService.selectQuestionList(limit, offset);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		int totalContent = mainService.selectQuestionTotalCount();
		model.addAttribute("totalContent", totalContent);
		
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		
		model.addAttribute("pagebar", pagebar);
		return "main/qa";
	}
	@GetMapping("/qaForm.do")
	public String qaForm(Authentication authentication) {
		
		return "main/qaForm";
	}
	

	@PostMapping("/queEnroll.do")
	public String queEnroll(Question que, @RequestParam(value="upFile", required=false) MultipartFile upFile, RedirectAttributes redirectAttr) throws IllegalStateException, IOException {
		log.debug("upFile = {}", upFile);
		log.debug("que = {}", que);
		
		String memberId = que.getMemberId();
		log.debug("memberId = {}", que.getMemberId());
		 try {
			 String saveDirectory = application.getRealPath("/resources/upFile/question");
			 log.debug("saveDirectory = {}", saveDirectory);
		 
		 
		 if(upFile != null && !upFile.isEmpty() && upFile.getSize() != 0) {
			 log.debug("upFile = {}", upFile);
			 log.debug("upFile.name = {}",upFile.getOriginalFilename());
			 log.debug("upFile.size = {}",upFile.getSize());
		 
			 String originalFilename = upFile.getOriginalFilename();
			 String renamedFilename = CosmosUtils.getRenamedFilename(originalFilename);
			 
			 // 1.서버컴퓨터에 저장
			 File dest = new File(saveDirectory, renamedFilename);
			 log.debug("dest = {}", dest);
			 upFile.transferTo(dest);
			 
			 // 2.DB에 attachment 레코드 등록
			 Attachment attach = new Attachment();
			 attach.setRenamedFilename(renamedFilename);
			 attach.setOriginalFilename(originalFilename);
			 attach.setMemberId(memberId);
			 int attachNo = mainService.insertAttach(attach);
			 
			 int result = mainService.insertQuestionFile(que);
		 }else {
			 // 업무로직
			 int result = mainService.insertQuestion(que);		 
		 }
		 
		 } catch (Exception e){
		 	log.error(e.getMessage(), e); // 로깅 throw e; //spring container에게 던짐.
		 	
		 	redirectAttr.addFlashAttribute("msg", "문의사항 등록 실패");
		 }
		 
		return "redirect:/main/qa.do";
	}
	
	@GetMapping("/qaDetail.do")
	public String queDetail(@RequestParam int queNo, Model model, Authentication authentication, RedirectAttributes redirectAttr) {

		log.debug("queNo = {}", queNo);
		Question que = mainService.selectOneQuestionByNo(queNo);
		Attachment att = mainService.selectOneAttach(que.getAttachNo());
		Member member = (Member)authentication.getPrincipal();
		log.debug("member = {}", member);
		

		if(!que.getMemberId().equals(member.getId()) || "admin".equals(member.getId()) || member == null) {

			redirectAttr.addFlashAttribute("msg", "작성자만 확인 가능합니다.");
			return "redirect:/main/qa.do";
		}
		
		log.debug("que = {} ", que);
		model.addAttribute("que",que);
		model.addAttribute("att",att);
		
		return "main/qaDetail";
	}
	
	@GetMapping("/index.do")
	public String index(Model model) {
		
		List<Group> list = mainService.selectAllGroupListByDate();
		log.debug("list= {}",list);
		model.addAttribute("list",list);
		return "/index";
	}
	
	@GetMapping("/about.do")
	public String about() {
		return "main/about";
	}
}
