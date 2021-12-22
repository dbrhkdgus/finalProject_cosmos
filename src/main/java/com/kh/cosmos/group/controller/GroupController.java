package com.kh.cosmos.group.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.cosmos.common.CosmosUtils;
import com.kh.cosmos.common.vo.Attachment;
import com.kh.cosmos.group.model.service.GroupService;
import com.kh.cosmos.group.model.vo.CategoryOne;
import com.kh.cosmos.group.model.vo.CategoryTwo;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.group.model.vo.GroupEnroll;
import com.kh.cosmos.group.model.vo.GroupInfo;
import com.kh.cosmos.group.model.vo.GroupInfoConnect;

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
			GroupEnroll groupEnroll,GroupInfoConnect groupInfoConnect, GroupInfo groupInfo,
			@RequestParam(value="upFile", required=false) MultipartFile upFile, 
			RedirectAttributes redirectAttributes
			) throws IllegalStateException, IOException {
		log.debug("group = {}", groupEnroll);
		log.debug("CateCheckBox = {}", groupEnroll.getCateCheckBox());
		
		String[] groupInfoArray = groupInfo.getGiContent().split(",");
		for(String g : groupInfoArray) {
			log.debug("g = {}", g);
		}
		
		char groupPrivate = groupEnroll.getGroupPrivate();
		if(groupPrivate != 'L') {
			groupEnroll.setGroupPrivate('U');
		}
		try {
			
			// application객체(ServletContext)
			String saveDirectory = application.getRealPath("/resources/upFile/group");
			log.debug("saveDirectory = {}", saveDirectory);
	
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
				attach.setId("honggd");
				attach.setGroupNo(groupEnroll.getGroupNo());
				attach.setImgFlag("Y");
				int attachNo = groupService.insertAttach(attach);
				log.debug("attachNo = {}", attachNo);
				
			}
			
			
			int result = groupService.insertGroup(groupEnroll);
			result = groupService.insertGroupInfoConnect(groupInfoConnect);
			
			for(int i = 1; i < 4 ; i++) {
				GroupInfo gi = new GroupInfo();
				gi.setGiContent(groupInfoArray[(i-1)]);
				gi.setGiSubTitle(Integer.toString(i));
				result = groupService.insertGroupInfo(gi);
				
			}
			
			String msg = result > 0 ? "그룹 신청 성공!" : "그룹 신청 실패!";
			redirectAttributes.addFlashAttribute("msg", msg);
		} catch (Exception e) {
			log.error("메모등록 오류", e);
			throw e;
		}
		
		return "redirect:/";
	}
	@GetMapping("/groupCategoryOne.do")
	@ResponseBody
	public Map<String,String> groupgroupContOne(Model model) {
		Map<String,String> map = new HashMap<String,String>();
		List<CategoryOne> categoryOneList = new ArrayList<>();
		categoryOneList = groupService.groupgroupContOne();
		
		for(CategoryOne cate : categoryOneList) {
			map.put(Integer.toString(cate.getCategory1No()), cate.getCategory1Name());
		}		
		return map;
	}
	@GetMapping("/groupCategoryTwo.do")
	@ResponseBody
	public Map<String,String> groupgroupContTwo(Model model, String categoryOneNo) {
		log.debug(categoryOneNo);
		Map<String,String> map = new HashMap<String,String>();
		List<CategoryTwo> categoryTwoList = new ArrayList<>();
		categoryTwoList = groupService.groupgroupContTwo(categoryOneNo);
		
		for(CategoryTwo cate : categoryTwoList) {
			map.put(Integer.toString(cate.getCategory2No()), cate.getCategory2Name());
		}	
		return map;
	}
	
}





