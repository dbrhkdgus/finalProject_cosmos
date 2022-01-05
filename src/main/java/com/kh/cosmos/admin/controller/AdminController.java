package com.kh.cosmos.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.group.model.vo.NotApprovedGroup;
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

		// 문의사항 목록 불러오기
		List<Question> questionList = adminService.adminMainQuestionList();
		log.debug("questionList = {}", questionList);
		model.addAttribute("questionList", questionList);

		// 문의사항 목록에 쓸 프로필 사진 리스트
		List<Attachment> profileImgList = adminService.selectProfileImgList();
		log.debug("profileImgList = {}", profileImgList);
		Map<String, String> profileImg = new HashMap<>();
		for (Attachment attachment : profileImgList) {
			System.out.println("여기는 테스트트트트트트트: " + attachment.getRenamedFilename().contains("http://k.kakaocdn.net/"));
			profileImg.put(attachment.getMemberId(), attachment.getRenamedFilename());
		}
		model.addAttribute("profileImg", profileImg);

		// 그룹 리스트 불러오기
		List<Group> groupList = adminService.adminMainGroupList();
		log.debug("groupList = {}", groupList);
		model.addAttribute("groupList", groupList);

		// 카테고리 테이블 불러오기
		List<CategoryOne> categoryOneList = groupService.CategoryOneList();
		log.debug("categoryOneList = {}", categoryOneList);

		// 카테고리 데이터 map에 담기
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
		log.debug("넘겨져온 param = {}", param);

		// 멤버-그룹 연계 테이블에, 한 회원이 여러 그룹에 가입되어 있을 수 있기에 List 받아와야 한다.
		List<MemberWithGroup> memberWithGroup = adminService.selectOneMember(param);
		log.debug("memberWithGroup.size() ={}", memberWithGroup.size());
		String groupName = "";
		int count = 1;

		// 각 행에 담겨있는 참여 모임의 문자열들을 합쳐준다.
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

		// 문의사항 목록에 쓸 프로필 사진 리스트
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
		// 페이징처리
		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = mainService.selectQuestionTotalCount();
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);

		// 업무로직
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

		// 페이징처리
		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = adminService.totalCountOfMembers();
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);

		// 업무로직
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
		// 페이징처리
		int limit = 10;
		int offset = (cPage - 1) * limit;
		int totalContent = mainService.selectQuestionTotalCount();
		String url = request.getRequestURI();
		String pagebar = CosmosUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("totalContent", totalContent);

		// 받아온 값
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		String searchGender = request.getParameter("searchGender");
		String searchRegDateStart = request.getParameter("searchRegDateStart");
		String searchRegDateEnd = request.getParameter("searchRegDateEnd");
		String searchBirthdayStart = request.getParameter("searchBirthdayStart");
		String searchBirthdayEnd = request.getParameter("searchBirthdayEnd");
		String searchJob = request.getParameter("searchJob");
		String searchEnabled = request.getParameter("searchEnabled");

		// 받온 값 Map 에 넣기
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

		// 업무로직
		List<Member> list = adminService.searchMembers(limit, offset, param);
		log.debug("list = {}", list);

		model.addAttribute("list", list);

		// 검색 타입 유지하기 위한 model.
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
		// 페이징처리
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
		log.debug("넘겨져온 param = {}", param);

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

	@GetMapping("/selectKakaoImage.do")
	@ResponseBody
	public Map<String, Object> selectKakaoImage(@RequestParam String id, Model model) {
		log.debug("id = {}", id);

		// 이미지 주소값 담을 변수 선언
		String imgSrc = "";

		// 업무로직
		List<Attachment> list = adminService.selectKakaoImage(id);
		log.debug("list = {}", list);
		for (Attachment attach : list) {
			// http://~로 시작하는 filseName이 있다면 그게 카카오 아이디의 대표 프로필 이미지 주소이다.
			System.out.println("111111111111111111111111");
			System.out.println(attach.getRenamedFilename());
			System.out.println(attach.getOriginalFilename().contains("http://kakaocdn.net/"));
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
	public String StatisticsOfMember() {
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
		// 페이징처리
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
		String searchKeyword = request.getParameter("searchKeyword");
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
}
