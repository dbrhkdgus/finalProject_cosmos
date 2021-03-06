package com.kh.cosmos.admin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.admin.model.service.AdminService;
import com.kh.cosmos.admin.model.vo.BoardData;
import com.kh.cosmos.admin.model.vo.BoardType;
import com.kh.cosmos.admin.model.vo.ColumnAndCount;
import com.kh.cosmos.admin.model.vo.Count;
import com.kh.cosmos.admin.model.vo.EnrollMemberByMonth;
import com.kh.cosmos.admin.model.vo.GenderData;
import com.kh.cosmos.admin.model.vo.SevenDaysData;
import com.kh.cosmos.common.CosmosUtils;
import com.kh.cosmos.common.attachment.model.service.AttachmentService;
import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.service.GroupService;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.CategoryOne;
import com.kh.cosmos.group.model.vo.CategoryTwo;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.group.model.vo.GroupCategory;
import com.kh.cosmos.group.model.vo.MemberOfGroup;
import com.kh.cosmos.group.model.vo.NotApprovedGroup;
import com.kh.cosmos.groupware.admin.model.vo.TdlMonthlyData;
import com.kh.cosmos.main.model.service.MainService;
import com.kh.cosmos.main.model.vo.Question;
import com.kh.cosmos.main.model.vo.QuestionWithMemberNameAndNickName;
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
	public String main(Model model) {

		// ???????????? ?????? ????????????
		List<Question> questionList = adminService.adminMainQuestionList();
		log.debug("questionList = {}", questionList);
		model.addAttribute("questionList", questionList);

		// ???????????? ????????? ??? ????????? ?????? ?????????
		List<Attachment> profileImgList = adminService.selectProfileImgList();
		log.debug("profileImgList = {}", profileImgList);
		Map<String, String> profileImg = new HashMap<>();
		for (Attachment attachment : profileImgList) {
			System.out.println("????????? ???????????????????????????: " + attachment.getRenamedFilename().contains("http://k.kakaocdn.net/"));
			profileImg.put(attachment.getMemberId(), attachment.getRenamedFilename());
		}
		model.addAttribute("profileImg", profileImg);

		// ?????? ????????? ????????????
		List<Group> groupList = adminService.adminMainGroupList();
		log.debug("groupList = {}", groupList);
		model.addAttribute("groupList", groupList);

		// ???????????? ????????? ????????????
		List<CategoryOne> categoryOneList = groupService.CategoryOneList();
		log.debug("categoryOneList = {}", categoryOneList);

		// ???????????? ????????? map??? ??????
		Map<Integer, String> categoryOneMap = new HashMap<>();
		for (CategoryOne categoryOne : categoryOneList) {
			categoryOneMap.put(categoryOne.getCategory1No(), categoryOne.getCategory1Name());
		}
		log.debug("categoryOneMap = {}", categoryOneMap);
		model.addAttribute("categoryOneMap", categoryOneMap);

		Map<String, String> mapmap = new HashMap<>();
		mapmap.put("aaaaa", "AAAAA");
		if (mapmap.containsKey("aaaaa")) {
			System.out.println("dddddddddddddddddddddddddddddddddddddddddd");
		}

		return "admin/main";
	}

	@GetMapping("/selectOneMember.do")
	@ResponseBody
	public Map<String, Object> selectOne(@RequestParam Map<String, Object> param) {
		Map<String, Object> map = new HashMap<>();
		log.debug("???????????? param = {}", param);

		// ??????-?????? ?????? ????????????, ??? ????????? ?????? ????????? ???????????? ?????? ??? ????????? List ???????????? ??????.
		List<MemberWithGroup> memberWithGroup = adminService.selectOneMember(param);
		log.debug("memberWithGroup.size() ={}", memberWithGroup.size());
		String groupName = "";
		int count = 1;

		// ??? ?????? ???????????? ?????? ????????? ??????????????? ????????????.
		for (MemberWithGroup mwg : memberWithGroup) {
			groupName += mwg.getGroupName();
			if (count != memberWithGroup.size()) {
				groupName += ", ";
			}
			count = count + 1;
		}
		log.debug("memberWithGroup = {}", memberWithGroup);
		log.debug("groupName = {}", groupName);
		MemberWithGroup mwg = memberWithGroup.get(0);
		log.debug("memberWithGroup.get(1) = {}", mwg);
		mwg.setGroupName(groupName);
		map.put("member", mwg);

		// ???????????? ????????? ??? ????????? ?????? ?????????
		List<Attachment> profileImgList = adminService.selectProfileImgList();
		log.debug("profileImgList = {}", profileImgList);
		Map<String, String> profileImg = new HashMap<>();
		for (Attachment attachment : profileImgList) {
			profileImg.put(attachment.getMemberId(), attachment.getRenamedFilename());
		}
		map.put("profileImg", profileImg);

		return map;

		


		 
	}

	@GetMapping("/QnA.do")
	public String QnA(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		// ???????????????
		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = mainService.selectQuestionTotalCount();
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);
		model.addAttribute("pagebar", pagebar);
		// ????????????
		List<Question> list = mainService.selectQuestionList(limit, offset);
		model.addAttribute("list", list);
		model.addAttribute("pagebar", pagebar);

		return "admin/QnA";
	}

	@GetMapping("/board.do")
	public String board(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = adminService.selectAllBoardTotalCount();
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("ca1No", 0);
		param.put("ca2No", 0);		
		List<Group> groupList = groupService.selectAllGroupListByParam(param, 1000, 0);
		model.addAttribute("groupList", groupList);
		
		List<BoardType> adminBoardTypeList = adminService.selectAllBoardTypeList();
		model.addAttribute("adminBoardTypeList", adminBoardTypeList);
		
		List<BoardData> adminBoardList = adminService.selectAllBoardList(limit, offset);
		model.addAttribute("adminBoardList", adminBoardList);
		model.addAttribute("pagebar", pagebar);
		
		return "admin/board";
	}

	@GetMapping("/members.do")
	public String members(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {

		// ???????????????
		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = adminService.totalCountOfMembers();
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);

		// ????????????
		List<Member> list = adminService.selectAllMembers(limit, offset);
		model.addAttribute("list", list);
		model.addAttribute("pagebar", pagebar);

		return "admin/members";
	}

	@GetMapping("/updateBlack")
	@ResponseBody
	public int changeBlack(@RequestParam Map<String, Object> param) {

		log.debug("param = {}", param);

		int result = adminService.updateBlack(param);

		log.debug("result = {}", result);
		return result;
	}

	@GetMapping("/searchMembers.do")
	public String searchMembers(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		// ???????????????
		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = mainService.selectQuestionTotalCount();
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);

		// ????????? ???
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		String searchGender = request.getParameter("searchGender");
		String searchRegDateStart = request.getParameter("searchRegDateStart");
		String searchRegDateEnd = request.getParameter("searchRegDateEnd");
		String searchBirthdayStart = request.getParameter("searchBirthdayStart");
		String searchBirthdayEnd = request.getParameter("searchBirthdayEnd");
		String searchJob = request.getParameter("searchJob");
		String searchEnabled = request.getParameter("searchEnabled");

		// ?????? ??? Map ??? ??????
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

		// ????????????
		List<Member> list = adminService.searchMembers(limit, offset, param);
		log.debug("list = {}", list);

		model.addAttribute("list", list);

		// ?????? ?????? ???????????? ?????? model.
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
	public String groups(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		//???????????? ??????,?????? ????????????
		List<CategoryOne> CategoryOneList = groupService.CategoryOneList();
		model.addAttribute("CategoryOneList", CategoryOneList);
		Map<Integer, String> categoryMap = new HashMap<>();
		for(CategoryOne categoryOne: CategoryOneList) {
			categoryMap.put(categoryOne.getCategory1No(), categoryOne.getCategory1Name());
		}
		model.addAttribute("categoryMap", categoryMap);
		
		// ???????????????
		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = adminService.allGroupCount();
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);
		model.addAttribute("pagebar", pagebar);

		
		//?????? ????????? ????????????
		List<Group> allGroupList = adminService.allGroupList(limit, offset);
		model.addAttribute("allGroupList", allGroupList);
		
		return "admin/groups";
	}

	@GetMapping("/permitGroups.do")
	public String permitGroups(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		// ???????????????
		int limit = 10;
		int offset = (cPage - 1) * limit;
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
		model.addAttribute("attachList", attachList);

		List<CategoryOne> caOneList = groupService.groupgroupContOne();
		model.addAttribute("caOneList", caOneList);

		return "admin/permitGroups";
	}

	@GetMapping("/selectOneNAG.do")
	@ResponseBody
	public Map<String, Object> selectOneNAG(@RequestParam Map<String, Object> param) {
		Map<String, Object> map = new HashMap<>();
		log.debug("???????????? param = {}", param);

		List<NotApprovedGroup> notApprovedGroup = adminService.selectOneNotApprovedGroup(param);
		log.debug("notApprovedGroup ={}", notApprovedGroup);
		NotApprovedGroup nag = notApprovedGroup.get(0);

		map.put("nag", nag);

		return map;
	}

	@PostMapping("/approveGroup.do")
	public String approveGroup(@RequestParam("groupNo") int groupNo, @RequestParam("hostId") String memberId, RedirectAttributes redirectAttributes) {
		log.debug("memberId = {}",memberId);
		int result = adminService.updateGroupApprove(groupNo);
		if(result>0) {
			String authority = "ROLE_GW"+groupNo+"MASTER";
			log.debug("authorityBuild = {}",authority);
			Map<String, Object> param = new HashMap<>();
			param.put("memberId", memberId);
			param.put("authority", authority);
			result = adminService.insertAuthoritiesValueForGroupMaster(param);
		}

		return "redirect:/admin/permitGroups.do";
	}
	
	@PostMapping("/disapproveGroup.do")
	public String disapproveGroup(@RequestParam("groupNo") int groupNo, @RequestParam("hostId") String memberId, RedirectAttributes redirectAttributes) {
		log.debug("memberId = {}",memberId);
		int result = adminService.disapproveGroup(groupNo);
		if(result>0) {
			
			result = adminService.sendDisapprveGroupDM(memberId);
		}
		
		return "redirect:/admin/permitGroups.do";
	}

	@GetMapping("/selectKakaoImage.do")
	@ResponseBody
	public Map<String, Object> selectKakaoImage(@RequestParam String id, Model model) {
		log.debug("id = {}", id);

		// ????????? ????????? ?????? ?????? ??????
		String imgSrc = "";

		// ????????????
		List<Attachment> list = adminService.selectKakaoImage(id);
		log.debug("list = {}", list);
		for (Attachment attach : list) {
			// http://~??? ???????????? filseName??? ????????? ?????? ????????? ???????????? ?????? ????????? ????????? ????????????.

			if (attach.getOriginalFilename().contains("http://k.kakaocdn.net/")) {
				imgSrc = attach.getRenamedFilename();
				System.out.println("222222222222222222222222");
				System.out.println("attah = " + attach);
			}
		}

		log.debug("imgSrc = {}", imgSrc);

		Map<String, Object> map = new HashMap<>();
		map.put("imgSrc", imgSrc);

		return map;
	}

	@GetMapping("/StatisticsOfMember.do")
	public String StatisticsOfMember(Model model) {
		int totalCountOfMembers = adminService.totalCountOfMembers();
		int enrollTodayCount = adminService.enrollToayCount();
		log.debug("?????? ????????? ??? enrollTodayCount= {} "+enrollTodayCount);
		int enrollThisMonthCount= adminService.enrollThisMonthCount();
		int enrollLastMonthCount = adminService.enrollLastMonthCount();

		model.addAttribute("totalCountOfMembers",totalCountOfMembers);
		model.addAttribute("enrollTodayCount",enrollTodayCount);
		model.addAttribute("enrollThisMonthCount",enrollThisMonthCount);
		model.addAttribute("enrollLastMonthCount",enrollLastMonthCount);
		
		return "admin/StatisticsOfMember";
	}
	
	@GetMapping("/EnrollMemberByMonth")
	@ResponseBody
	public Map<String,Object> EnrollMemberByMonth(@RequestParam Map<String, Object> param) {
		
		log.debug("EnrollMemberByMonth param = {}", param);
		List<EnrollMemberByMonth> EnrollMemberByDateList = adminService.EnrollMemberByMonth(param);
		log.debug("EnrollMemberByMonthList = {}", EnrollMemberByDateList);
		Map<String, Object> EnrollMemberByMonthMap = new HashMap<String, Object>();
		
		EnrollMemberByMonthMap.put("EnrollMemberByDateList",EnrollMemberByDateList);
		
		return EnrollMemberByMonthMap;
	}

	@GetMapping("/thisWeekEnrollMember")
	@ResponseBody
	public Map<String, Object> thisWeekEnrollMember() {
		Map<String, Object> map = new HashMap<>();

		SevenDaysData sevenDaysData = adminService.thisWeekEnrollMember();
		log.debug("sevenDaysData = {}", sevenDaysData);
		map.put("sevenDaysData", sevenDaysData);
		return map;
	}
	
	@GetMapping("/genderData")
	@ResponseBody
	public Map<String, Object> genderData() {
		GenderData genderData = adminService.genderData(); 
		Map<String, Object> genderMap = new HashMap<>();
		genderMap.put("genderData", genderData);
		return genderMap;
	}

	@GetMapping("/StatisticsOfGroup.do")
	public String StatisticsOfGroup(Model model) {
		
		Count totalCountOfGroup = adminService.totalCountOfGroup();
		log.debug("totalCountOfGroup = {}", totalCountOfGroup);
		
		Count countOfPremiumGroup = adminService.countOfPremiumGroup();
		log.debug("countOfPremiumGroup = {}", countOfPremiumGroup);
		
		Count countOfPost = adminService.countOfPost();
		log.debug("countOfPost = {}", countOfPost);
		
		Count countOfNewGroupInThisMonth = adminService.countOfNewGroupInThisMonth();
		log.debug("countOfNewGroupInThisMonth = {}", countOfNewGroupInThisMonth);
		
		List<ColumnAndCount> countOfnewPostInThisWeekList = adminService.countOfnewPostInThisWeekList();
		log.debug("countOfnewPostInThisWeekList= {}", countOfnewPostInThisWeekList);
		
		List<ColumnAndCount> countOfGroupLikeList = adminService.countOfGroupLikeList();
		log.debug("countOfGroupLikeList = {}", countOfGroupLikeList);
		
		
		model.addAttribute("totalCountOfGroup", totalCountOfGroup);
		model.addAttribute("countOfPremiumGroup",countOfPremiumGroup);
		model.addAttribute("countOfPost",countOfPost);
		model.addAttribute("countOfNewGroupInThisMonth",countOfNewGroupInThisMonth);
		model.addAttribute("countOfnewPostInThisWeekList", countOfnewPostInThisWeekList);
		model.addAttribute("countOfGroupLikeList", countOfGroupLikeList);
		
		return "admin/StatisticsOfGroup";
	}
	
	@GetMapping("/searchQuestion.do")
	public String searchQuestion(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		// ???????????????
		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = mainService.selectQuestionTotalCount();
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);

		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		String searchRegDateStart = request.getParameter("searchRegDateStart");
		String searchRegDateEnd = request.getParameter("searchRegDateEnd");
		String answerComplete = request.getParameter("answerComplete");

		Map<String, Object> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("searchKeyword", searchKeyword);
		param.put("searchRegDateStart", searchRegDateStart);
		param.put("searchRegDateEnd", searchRegDateEnd);
		param.put("answerComplete", answerComplete);

		log.debug("param = {}", param);

		List<QuestionWithMemberNameAndNickName> list = adminService.searchQuestion(limit, offset, param);
		log.debug("questionList = {}", list);

		model.addAttribute("list", list);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("searchRegDateStart", searchRegDateStart);
		model.addAttribute("searchRegDateEnd", searchRegDateEnd);
		model.addAttribute("answerComplete", answerComplete);

		return "admin/QnA";
	}
	
	@GetMapping("/searchBoard.do")
	public String searchBoard(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		String groupNo = request.getParameter("groupNo");
		String boardType = request.getParameter("boardType");
		String searchType = request.getParameter("searchType");
		String searchKeyword = "";
		if(request.getParameter("searchKeyword")!= null) {
			searchKeyword = request.getParameter("searchKeyword");
		}else {
			searchKeyword = "null";
		}
		Map<String, Object> param1 = new HashMap<>();
		param1.put("groupNo", groupNo);
		param1.put("boardType", boardType);
		param1.put("searchType", searchType);
		param1.put("searchKeyword", searchKeyword);
		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = adminService.selectSearchBoardTotalCount(param1);
		log.debug("totalContent = {}",totalContent);
		String url = request.getRequestURI();
		url += "?groupNo=" + groupNo + "&boardType=" + boardType + "&searchType=" + searchType + "&searchKeyword=" + searchKeyword;
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);
		
		log.debug("groupNo = {}",groupNo);
		log.debug("boardType = {}",boardType);
		log.debug("searchType = {}",searchType);
		log.debug("searchKeyword = {}",searchKeyword);
		
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("ca1No", 0);
		param.put("ca2No", 0);
		List<Group> groupList = groupService.selectAllGroupListByParam(param, 1000, 0);
		model.addAttribute("groupList", groupList);
		
		List<BoardType> adminBoardTypeList = adminService.selectAllBoardTypeList();
		model.addAttribute("adminBoardTypeList", adminBoardTypeList);
		
		List<BoardData> adminBoardList = adminService.selectSearchBoardList(param1, limit, offset);
		model.addAttribute("adminBoardList", adminBoardList);
		model.addAttribute("pagebar", pagebar);
		
		
		model.addAttribute("groupNo",groupNo);
		model.addAttribute("boardType",boardType);
		model.addAttribute("searchType",searchType);
		model.addAttribute("searchKeyword",searchKeyword);
		
		return "admin/board";
		
	}
	
	@GetMapping("/totalCountOfPost")
	@ResponseBody
	public List<ColumnAndCount> totalCountOfPost(){
		
		List<ColumnAndCount> totalCountOfPost_list= adminService.totalCountOfPost();
		log.debug("totalCountOfPost", totalCountOfPost_list);
		
		Map<String,Object> map = new HashMap<>();
		map.put("totalCountOfPost", totalCountOfPost_list);
		
		return totalCountOfPost_list;
	}
	
	@GetMapping("/searchGroups")
	public String searchGroups(@RequestParam(defaultValue = "1") int cPage, @RequestParam Map<String, String> param, Model model, HttpServletRequest request) {
		log.debug("param = {}", param);
		
		// ???????????????
		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = adminService.searchGroupListCounts(param);
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);
		model.addAttribute("pagebar", pagebar);
		
		//?????? ????????? ????????????
		List<Group> searchGroupList = adminService.searchGroupList(param,limit, offset);
		model.addAttribute("allGroupList", searchGroupList);
		log.debug("searchGroupList= {}", searchGroupList);
		
		//???????????? ??????,?????? ????????????
		List<CategoryOne> CategoryOneList = groupService.CategoryOneList();
		model.addAttribute("CategoryOneList", CategoryOneList);
		Map<Integer, String> categoryMap = new HashMap<>();
		for(CategoryOne categoryOne: CategoryOneList) {
			categoryMap.put(categoryOne.getCategory1No(), categoryOne.getCategory1Name());
		}
		model.addAttribute("categoryMap", categoryMap);
		
		log.debug("param.get(searchTpe)= {}", param.get("searchType"));
		log.debug("param.get(searchKeyword)= {}", param.get("searchType"));
		log.debug("param.get(searchRegDateStart)= {}", param.get("searchRegDateStart"));
		log.debug("param.get(searchRegDateEnd)= {}", param.get("searchRegDateEnd"));
		log.debug("param.get(categoryNo)= {}", param.get("categoryNo"));
		log.debug("param.get(searchRegDateEnd)= {}", param.get("searchRegDateEnd"));
		log.debug("param.get(groupClose)= {}", param.get("groupClose"));
		
		model.addAttribute("searchType", param.get("searchType"));
		model.addAttribute("searchKeyword", param.get("searchKeyword"));
		model.addAttribute("searchRegDateStart", param.get("searchRegDateStart"));
		model.addAttribute("searchRegDateEnd", param.get("searchRegDateEnd"));
		model.addAttribute("categoryNo", param.get("categoryNo"));
		model.addAttribute("groupClose", param.get("groupClose"));
		
		return "admin/groups";
	}
	@GetMapping("/groups/selectOneGroup")
	@ResponseBody
	public Map<String,Object> selectOneGroup(@RequestParam Map<String, String> param, Model model) {
		String groupNo = param.get("groupNo");

		
		//?????? ?????? ?????? ????????????
		Group group = groupService.selectGroupListByGroupNo(groupNo);
		
		
		//????????????1 ??????,?????? ????????????
		List<CategoryOne> CategoryOneList = groupService.CategoryOneList();
		model.addAttribute("CategoryOneList", CategoryOneList);
		Map<Integer, String> category1Map = new HashMap<>();
		for(CategoryOne categoryOne: CategoryOneList) {
			category1Map.put(categoryOne.getCategory1No(), categoryOne.getCategory1Name());
		}
		
		//????????????2 ?????? ?????? ????????????
		List<CategoryTwo> CategoryTwoList = groupService.selectAllCategoryTwoList();
		Map<Integer, String> category2Map = new HashMap<>();
		for(CategoryTwo categoryTwo: CategoryTwoList) {
			category2Map.put(categoryTwo.getCategory2No(), categoryTwo.getCategory2Name());
		}

		//?????? ??? ????????????2 ????????????
		List<GroupCategory> gcList = groupService.selectGroupCategoryListByGroupNo(groupNo);
		String str_gc2List = ""; 
		for(GroupCategory groupCategory: gcList) {
			log.debug("?????? ?????????1 : "+groupCategory.getCategory2No());
			log.debug("?????? ?????????2 : "+category2Map.get(groupCategory.getCategory2No()));
			str_gc2List += category2Map.get(groupCategory.getCategory2No())+"  ";
		}
		//?????? ????????????
		MemberOfGroup leader = adminService.selectLeader(groupNo); 
		
		//?????? ????????????
		List<MemberOfGroup> memberOfGroupList = adminService.memberOfGroupList(groupNo);
		String str_memberList = "";
		for(MemberOfGroup memberOfGroup : memberOfGroupList) {
			str_memberList += memberOfGroup.getMemberId()+"    ";
		}
		//???????????? ?????? ????????? ??????
		str_memberList = str_memberList.replace(leader.getMemberId(), "");
		
		//?????? ????????????
		Attachment banner = attachService.selectGroupAttachmentListByGroupNo(groupNo);
		
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("group", group);
		result.put("category1Map", category1Map);
		result.put("category2Map", category2Map);
		result.put("str_gc2List", str_gc2List);
		result.put("leader", leader);
		result.put("str_memberList", str_memberList);
		result.put("banner", banner);
		return result;
	}
	
	@GetMapping("/statisticsCategory")
	@ResponseBody
	public Map<String,Object> statisticsCategory(){
		Map<String, Object> map = new HashMap<String, Object>();
		List<ColumnAndCount> list = adminService.statisticsCategory();
		log.debug("list = {}", list);
		map.put("list", list);
		return map;
	}
	
	@GetMapping("/countOfnewPostInThisWeekList")
	@ResponseBody
	public Map<String,Object> countOfnewPostInThisWeekList(){
		Map<String, Object> map = new HashMap<String, Object>();
		List<ColumnAndCount> countOfnewPostInThisWeekList = adminService.countOfnewPostInThisWeekList();
		log.debug("countOfnewPostInThisWeekList= {}", countOfnewPostInThisWeekList);		
		map.put("countOfnewPostInThisWeekList", countOfnewPostInThisWeekList);
		return map;
	}
	
	@GetMapping("/StatisticsOfSales.do")
	public String StatisticsOfSales(@RequestParam(defaultValue = "1") int cPage, HttpServletRequest request, Model model) throws ParseException {
		//??? ??????
		int totalSales = adminService.totalSales();
		//???????????? ?????? ???
		Count countOfPremiumGroup = adminService.countOfPremiumGroup();
		//?????? ??? ??????
		int salesOfThisMonth = adminService.salesOfThisMonth();
		//?????? ??????
		int salesOfLastMonth = adminService.salesOfLastMonth();
		
		//??????
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");

		String _serviceStart = "20211201";
		Date sysdate = new Date();
		Date serviceStart = sf.parse(_serviceStart);
		
			//??? ????????? ????????? ???????????? ??? ??????
			int month1 = sysdate.getYear()*12 + sysdate.getMonth();
			int month2 = serviceStart.getYear()*12 + serviceStart.getMonth();
			int monthDiffrence = month2 - month1 + 2;
			
			log.debug("month1 = {}", month1);
			log.debug("month2 = {}", month2);
			log.debug("monthDiffrence = {}", monthDiffrence);
		Map<String, Object> param = new HashMap<String, Object>();
		Object monthInt = 0;
		
		param.put("monthInt", monthInt);
		param.put("serviceStart", serviceStart);
		param.put("monthInt", monthInt );
		
		//
		Map<String, Integer> monthData = new HashMap<>();
		String str_serviceStart = "2021-12";
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sf2 = new SimpleDateFormat("yyyy-MM");
		Date date = new Date();
		
		Date _startDate = sf2.parse(str_serviceStart);
		cal.setTime(_startDate);
		log.debug("????????? ???????????? ??? cal= {}", cal);
		log.debug("????????? ???????????? ??? _startDate= {}", _startDate);
		log.debug("????????? ???????????? ??? sf2.format(_startDate)= {}", sf2.format(_startDate));
		
		
		List<Map<String,Integer>> monthDataList = new ArrayList<Map<String,Integer>>();
		for(int i = 0; i <= monthDiffrence; i++) {
			//monthData???????????? ?????? map??? ???????????? ?????????.
			monthData = new HashMap<>();
			
			log.debug("???????????????monthDiffrence = {}", monthDiffrence);
			int salesOfMonth = adminService.salesOfMonth(param);
			int _monthInt = (int)monthInt;

			//???????????? list??? ??????
			monthData.put(sf2.format(cal.getTime()), salesOfMonth);
			monthDataList.add(monthData);

			_monthInt++;
			monthInt = (Object)_monthInt;
			param.put("monthInt", monthInt);

			//?????? ??? ?????? ????????? 2022-01, 2022-02... ??????
			cal.add(Calendar.MONTH, 1);
		}
		log.debug("????????? monthDataList ??????! = {}", monthDataList);
		
		
		
		// ???????????????
		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = monthDiffrence;
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);
		model.addAttribute("pagebar", pagebar);
		
		
		model.addAttribute("totalSales",totalSales);
		model.addAttribute("countOfPremiumGroup", countOfPremiumGroup);
		model.addAttribute("salesOfThisMonth",salesOfThisMonth);
		model.addAttribute("salesOfLastMonth", salesOfLastMonth);
		model.addAttribute("monthDataList", monthDataList);
		return "admin/StatisticsOfSales";
	}
}
