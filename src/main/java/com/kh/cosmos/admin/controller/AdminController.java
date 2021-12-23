package com.kh.cosmos.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.cosmos.admin.model.service.AdminService;
import com.kh.cosmos.common.CosmosUtils;
import com.kh.cosmos.common.attachment.model.service.AttachmentService;
import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.service.GroupService;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.CategoryOne;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.group.model.vo.NotApprovedGroup;
import com.kh.cosmos.main.model.service.MainService;
import com.kh.cosmos.main.model.vo.Question;
import com.kh.cosmos.member.model.vo.Member;
import com.kh.cosmos.member.model.vo.MemberWithGroup;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private MainService mainService;
	
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private AttachmentService attachService;

	@GetMapping("/main.do")
	public String main() {
		return "admin/main";
	}
	
	@GetMapping("/QnA.do")
	public String QnA(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
//		페이징처리
		int limit = 10;
		int offset = (cPage -1)*limit;
		int totalContent = mainService.selectQuestionTotalCount();
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);
		
//		업무로직
		List<Question> list = mainService.selectQuestionList(limit, offset);
		model.addAttribute("list", list);
		model.addAttribute("pagebar", pagebar);
		
		return "admin/QnA";
	}
	
	@GetMapping("/board.do")
	public String board() {
		return "admin/board";
	}
	
	@GetMapping("/members.do")
	public String members(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		
//		페이징처리
		int limit = 10;
		int offset = (cPage -1)*limit;
		int totalContent = mainService.selectQuestionTotalCount();
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);
		
//		업무로직
		List<Member> list = adminService.selectAllMembers(limit, offset);
		model.addAttribute("list", list);
		model.addAttribute("pagebar", pagebar);
		
		return "admin/members";
	}
	
	@GetMapping("/selectOneMember.do")
	@ResponseBody
	public Map<String,Object> selectOne(@RequestParam Map<String, Object> param) {
		Map<String, Object> map = new HashMap<>();
		log.debug("넘겨져온 param = {}", param);
		
//		멤버-그룹 연계 테이블에, 한 회원이 여러 그룹에 가입되어 있을 수 있기에 List 받아와야 한다.
		List<MemberWithGroup> memberWithGroup = adminService.selectOneMember(param);
		log.debug("memberWithGroup.size() ={}", memberWithGroup.size());
		String groupName = "";
		int count = 1;
		
//		각 행에 담겨있는 참여 모임의 문자열들을 합쳐준다.
		for(MemberWithGroup mwg : memberWithGroup) {
			groupName += mwg.getGroupName();
			if(count!=memberWithGroup.size()) {
				groupName += ", ";
			}
			count= count+1;
		}
		log.debug("memberWithGroup = {}", memberWithGroup);
		log.debug("groupName = {}", groupName);
		MemberWithGroup mwg = memberWithGroup.get(0);
		log.debug("memberWithGroup.get(1) = {}", mwg);
		mwg.setGroupName(groupName);
		map.put("member", mwg);
		
		return map;
	}
	
	 @GetMapping("/updateBlack")
	 @ResponseBody 
	 public int changeBlack(@RequestParam Map<String, Object> param){ 
		 
		 log.debug("param = {}", param); 
		 
		 int result = adminService.updateBlack(param); 
		 
		 log.debug("result = {}", result);
		 return result;
	}
	 
	@GetMapping("/searchMembers.do")
	public String searchMembers(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		//페이징처리
		int limit = 10;
		int offset = (cPage -1)*limit;
		int totalContent = mainService.selectQuestionTotalCount();
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);
		
		//받아온 값
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		String searchGender = request.getParameter("searchGender");
		String searchRegDateStart = request.getParameter("searchRegDateStart");
		String searchRegDateEnd = request.getParameter("searchRegDateEnd");
		String searchBirthdayStart = request.getParameter("searchBirthdayStart");
		String searchBirthdayEnd = request.getParameter("searchBirthdayEnd");
		String searchJob = request.getParameter("searchJob");
		String searchEnabled = request.getParameter("searchEnabled");
		
		//받온 값 Map 에 넣기
		Map<String, String> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("searchKeyword", searchKeyword);
		param.put("searchGender", searchGender);
		param.put("searchRegDateStart", searchRegDateStart);
		param.put("searchRegDateEnd", searchRegDateEnd);
		param.put("searchBirthdayStart", searchBirthdayStart);
		param.put("searchBirthdayEnd", searchBirthdayEnd);
		param.put("searchJob", searchJob);
		param.put("searchEnabled", searchEnabled);

		log.debug("searchType = {}", searchType);
		log.debug("searchKeyword = {}", searchKeyword);
		log.debug("searchGender = {}", searchGender);
		log.debug("searchRegDateStart = {}", searchRegDateStart);
		log.debug("searchRegDateEnd = {}", searchRegDateEnd);
		log.debug("searchBirthdayStart = {}", searchBirthdayStart);
		log.debug("searchBirthdayEnd = {}", searchBirthdayEnd);
		log.debug("searchJob = {}", searchJob);
		log.debug("searchEnabled = {}", searchEnabled);
		
		//업무로직
		List<Member> list = adminService.searchMembers(limit, offset, param);
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		//검색 타입 유지하기 위한 model.
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("searchGender", searchGender);
		model.addAttribute("searchRegDateStart", searchRegDateStart);
		model.addAttribute("searchRegDateEnd", searchRegDateEnd);
		model.addAttribute("searchBirthdayStart", searchBirthdayStart);
		model.addAttribute("searchBirthdayEnd", searchBirthdayEnd);
		model.addAttribute("searchBirthdayEnd", searchRegDateStart);
		model.addAttribute("searchJob", searchJob);
		model.addAttribute("searchEnabled", searchEnabled);
		
		return "/admin/members";
	}
	
	@GetMapping("/groups.do")
	public String groups() {
		
		return "admin/groups";
	}
	
	@GetMapping("/permitGroups.do")
	public String permitGroups(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		//페이징처리
		int limit = 10;
		int offset = (cPage -1)*limit;
		int totalContent = mainService.selectQuestionTotalCount();
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);
		
		List<ApplocationGroup> notApprovedAG = adminService.selectNotApprovedAGList(limit, offset);
		model.addAttribute("notApprovedAG", notApprovedAG);
		model.addAttribute("pagebar", pagebar);
		
		List<Group> groupList = groupService.selectAllMyGroupList();
		model.addAttribute("groupList", groupList);
		
		List<Attachment> attachList = attachService.selectGroupAttachmentList();
		model.addAttribute("attachList",attachList);
		
		List<CategoryOne> caOneList = groupService.groupgroupContOne();
		model.addAttribute("caOneList", caOneList);
		
		return "admin/permitGroups";
	}
	
	@GetMapping("/selectOneNAG.do")
	@ResponseBody
	public Map<String,Object> selectOneNAG(@RequestParam Map<String, Object> param) {
		Map<String, Object> map = new HashMap<>();
		log.debug("넘겨져온 param = {}", param);
		
		
		List<NotApprovedGroup> notApprovedGroup = adminService.selectOneNotApprovedGroup(param);
		log.debug("notApprovedGroup ={}", notApprovedGroup);
		NotApprovedGroup nag = notApprovedGroup.get(0);
		
//		log.debug("memberWithGroup = {}", memberWithGroup);
//		log.debug("groupName = {}", groupName);
//		MemberWithGroup mwg = memberWithGroup.get(0);
//		log.debug("memberWithGroup.get(1) = {}", mwg);
//		mwg.setGroupName(groupName);
		map.put("nag", nag);
		
		return map;
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
