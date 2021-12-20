package com.kh.cosmos.group.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.common.CosmosUtils;
import com.kh.cosmos.common.vo.Attachment;
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
	public String insertGroup(
			@ModelAttribute Group group, 
			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles, 
			RedirectAttributes redirectAttributes
			) throws IllegalStateException, IOException {
		log.debug("group = {}", group);
		char groupPrivate = group.getGroupPrivate();
		if(groupPrivate != 'L') {
			group.setGroupPrivate('U');
		}
		
		try {
			// 첨부파일 list생성
			// List<Attachment> attachments = new ArrayList<>();
			
			// application객체(ServletContext)
			String saveDirectory = application.getRealPath("/resources/upFile/group");
			log.debug("saveDirectory = {}", saveDirectory);
			
			for(MultipartFile upFile : upFiles) {
	
				if(!upFile.isEmpty() && upFile.getSize() != 0) {
					
					log.debug("upFile = {}", upFile);
					log.debug("upFile.name = {}", upFile.getOriginalFilename());
					log.debug("upFile.size = {}", upFile.getSize());
					
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
					attach.setMemberId("sample");
					int attachNo = groupService.insertAttach(attach);
					log.debug("attachNo = {}", attachNo);
				}
			}
			
			int result = groupService.insertGroup(group);
			String msg = result > 0 ? "그룹 신청 성공!" : "그룹 신청 실패!";
			redirectAttributes.addFlashAttribute("msg", msg);
		} catch (Exception e) {
			log.error("메모등록 오류", e);
			throw e;
		}
		
		return "redirect:/";
	}
	
	
//	@PostMapping("/insertGroup.do")
//	public String bannerEnroll(
//			Group group, 
//			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles, 
//			RedirectAttributes redirectAttr
//		) throws IllegalStateException, IOException {
//		
//		try {
//			// 첨부파일 list생성
//			List<Attachment> attachments = new ArrayList<>();
//			
//			// application객체(ServletContext)
//			String saveDirectory = application.getRealPath("/resources/upFile/group");
//			log.debug("saveDirectory = {}", saveDirectory);
//			
//			for(MultipartFile upFile : upFiles) {
//	
//				if(!upFile.isEmpty() && upFile.getSize() != 0) {
//					
//					log.debug("upFile = {}", upFile);
//					log.debug("upFile.name = {}", upFile.getOriginalFilename());
//					log.debug("upFile.size = {}", upFile.getSize());
//					
//					String originalFilename = upFile.getOriginalFilename();
//					String renamedFilename = HiSpringUtils.getRenamedFilename(originalFilename);
//	
//					// 1.서버컴퓨터에 저장
//					File dest = new File(saveDirectory, renamedFilename);
//					log.debug("dest = {}", dest);
//					upFile.transferTo(dest);
//					
//					// 2.DB에 attachment 레코드 등록
//					Attachment attach = new Attachment();
//					attach.setRenamedFilename(renamedFilename);
//					attach.setOriginalFilename(originalFilename);
//					attachments.add(attach);
//				}
//			}
//			
//			// 업무로직
//			if(!attachments.isEmpty())
//				group.setAttachments(attachments);
//			
//			int result = groupService.insertBoard(group);
//			String msg = result > 0 ? "게시글 등록 성공!" : "게시글 등록 실패!";
//			redirectAttr.addFlashAttribute("msg", msg);
//		} catch (Exception e) {
//			log.error(e.getMessage(), e); // 로깅
//			throw e; // spring container에게 던짐.
//		}
//		return "redirect:/board/boardList.do";
//	}
	
}





