package com.kh.cosmos.group.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.common.CosmosUtils;
import com.kh.cosmos.common.attachment.model.service.AttachmentService;
import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.service.GroupService;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.CategoryOne;
import com.kh.cosmos.group.model.vo.CategoryTwo;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.group.model.vo.GroupCategory;
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
	private AttachmentService attachService;
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/groupSearch.do")
	public String groupSearch(@RequestParam(defaultValue = "1") int cPage, @RequestParam(defaultValue = "0") String ca1No, @RequestParam(defaultValue = "0") String ca2No, Model model, HttpServletRequest request) {
		int limit = 9;
		int offset = (cPage - 1) * limit;
		

		
		log.debug(request.getParameter("ca1No"));
		log.debug(request.getParameter("ca2No"));
		List<Group> groupList = new ArrayList<Group>();
		
		if(ca1No.equals("0") && ca2No.equals("0")) {
			log.debug("test");
			groupList = groupService.selectAllGroupList(limit, offset);
		}
		else if(!ca1No.equals("0") && ca2No.equals("0")){
			int ca1NoI = Integer.parseInt(ca1No);
			groupList = groupService.selectAllGroupListByCa1No(ca1NoI, limit, offset);
			List<CategoryTwo> ca2NoList = groupService.groupgroupContTwo(ca1No);
			model.addAttribute("ca2NoList",ca2NoList);
			model.addAttribute("ca1No", ca1No);
		}
		else {
			int ca2NoI = Integer.parseInt(ca2No);
			groupList = groupService.selectAllGroupListByCa2No(ca2NoI, limit, offset);
			List<CategoryTwo> ca2NoList = groupService.groupgroupContTwo(ca1No);
			model.addAttribute("ca2NoList",ca2NoList);
			model.addAttribute("ca1No", ca1No);
		}
		
		
		List<CategoryOne> caOneList = groupService.groupgroupContOne();
		model.addAttribute("caOneList", caOneList);
		
		
		model.addAttribute("groupList", groupList);
		
		List<Attachment> attachList = attachService.selectGroupAttachmentList();
		model.addAttribute("attachList",attachList);
		
		List<GroupInfoConnect> giList = groupService.selectAllGroupInfoList();
		model.addAttribute("giList",giList);
		int totalContent = groupService.selectGroupTotalCount();
		model.addAttribute("totalContent", totalContent);
		
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		log.debug("pagebar = {}", pagebar);
		model.addAttribute("pagebar", pagebar);
		
	
		return "group/groupSearch";
	}
	
	@GetMapping("/groupDetail.do")
	public String groupDetail(@RequestParam String groupNo, Model model, HttpServletRequest request) {
		
		Group group = groupService.selectGroupListByGroupNo(groupNo);
		model.addAttribute("group", group);
		log.debug("group = {}", group);
		
		Attachment attach = attachService.selectGroupAttachmentListByGroupNo(groupNo);
		model.addAttribute("attach",attach);
		log.debug("attach = {}", attach);
		
		GroupInfoConnect giConn = groupService.selectAllGroupInfoByGroupNo(groupNo);
		model.addAttribute("giConn",giConn);
		log.debug("giConn = {}", giConn);
		
		int gsNo = giConn.getSeqNo();
		List<GroupInfo> groupInfoList = groupService.selectGroupInfoListByGsNo(gsNo);
		model.addAttribute("groupInfoList",groupInfoList);
		log.debug("groupInfoList = {}", groupInfoList);
		
		String cateNo = Integer.toString(group.getCategoryNo());
		log.debug("cateNo = {}", cateNo);
		CategoryOne cate = groupService.selectCategoryOneByCateNo(cateNo);
		model.addAttribute("cate",cate);
		log.debug("cate = {}", cate);
		
		List<GroupCategory> gcList = groupService.selectGroupCategoryListByGroupNo(groupNo);
		model.addAttribute("gcList",gcList);
		log.debug("gcList = {}", gcList);
		
		List<CategoryTwo> cateTwoList = new ArrayList<>();
		for(GroupCategory gc : gcList) {
			String num = Integer.toString(gc.getCategory2No());
			CategoryTwo categoryTwo = new CategoryTwo();
			categoryTwo = groupService.selectCategoryTwoListByGroupNo(num);
			cateTwoList.add(categoryTwo);
		}
		model.addAttribute("cateTwoList",cateTwoList);
		log.debug("cateTwoList = {}", cateTwoList);
		
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
		log.debug("groupId={}",groupEnroll.getMemberId());
		
		String[] groupInfoArray = groupInfo.getGiContent().split(",");
		for(String g : groupInfoArray) {
			log.debug("g = {}", g);
		}
		
		char groupPrivate = groupEnroll.getGroupPrivate();
		if(groupPrivate != 'L') {
			groupEnroll.setGroupPrivate('U');
		}
		
		Attachment attach = new Attachment();
		
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
				
				attach.setRenamedFilename(renamedFilename);
				attach.setOriginalFilename(originalFilename);
				attach.setMemberId(groupEnroll.getMemberId());
				attach.setImgFlag("Y");
				
				
			}
			
			
			int result = groupService.insertGroup(groupEnroll);
			
			int attachNo = groupService.insertAttach(attach);
			log.debug("attachNo = {}", attachNo);
			
			result = groupService.insertGroupInfoConnect(groupInfoConnect);
		
			String[] cateNo = groupEnroll.getCateCheckBox();
			
			log.debug("cateNo={}" ,cateNo);
			for(String catetest :cateNo) {
				GroupCategory category = new GroupCategory();				
				category.setCategory2No(Integer.parseInt(catetest));
				result = groupService.insertGroupCategory(category);
			}
			
			
			
			for(int i = 1; i < 5 ; i++) {
				GroupInfo gi = new GroupInfo();
				gi.setGiContent(groupInfoArray[(i-1)]);
				gi.setGiSubTitle(Integer.toString(i));
				result = groupService.insertGroupInfo(gi);
				
			}
			
			
			ApplocationGroup applocationGroup = new ApplocationGroup();
			applocationGroup.setMemberId(groupEnroll.getMemberId());
		
			
			result = groupService.insertAlg(applocationGroup);
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
	@GetMapping("/category2Search")
	@ResponseBody
	public Map<String,String> category2Search(Model model, String ca1No) {
		log.debug(ca1No);
		
		Map<String,String> map = new HashMap<String,String>();
		List<CategoryTwo> categoryTwoList = new ArrayList<>();
		categoryTwoList = groupService.groupgroupContTwo(ca1No);
		
		for(CategoryTwo cate : categoryTwoList) {
			map.put(Integer.toString(cate.getCategory2No()), cate.getCategory2Name());
		}

		return map;
	}
	
}





