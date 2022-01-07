package com.kh.cosmos.groupware.admin.controller;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.admin.model.service.GwAdminService;
import com.kh.cosmos.groupware.admin.model.vo.Authorities;
import com.kh.cosmos.groupware.admin.model.vo.TdlMemberCount;
import com.kh.cosmos.groupware.admin.model.vo.TdlMonthlyData;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.fileBoard.vo.IdNickName;
import com.kh.cosmos.groupware.service.GroupwareService;
import com.kh.cosmos.member.model.service.MemberService;
import com.kh.cosmos.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
@Controller
@Slf4j
@RequestMapping("/gw/admin")
public class GwAdminController {
	
	@Autowired
	private GroupwareService gwService ;
	
	@Autowired
	private GwAdminService gwAdminService;
	
	@Autowired
	private MemberService memberService;
	

	@GetMapping("/memberManager.do")
	public String memberManager(Model model, int groupNo,Authentication authentication) {
		groupwareHeaderSet(groupNo, model, authentication);
		model.addAttribute("groupNo", groupNo);
		

		List<ApplocationGroup> acceptApplocationGroupList = new ArrayList<ApplocationGroup>();
		acceptApplocationGroupList = gwAdminService.selectAllAcceptGroupMemberList(groupNo);
//		log.debug("applocationGroup = {}" ,acceptApplocationGroupList);
		model.addAttribute("acceptApplocationGroupList",acceptApplocationGroupList);
		
		//그룹장 승인 대기하는 애들
		List<ApplocationGroup> waitingApplocationGroupList = new ArrayList<ApplocationGroup>();
		waitingApplocationGroupList = gwAdminService.selectAllWaitingGroupMemberList(groupNo);
//		log.debug("applocationGroup = {}" ,waitingApplocationGroupList);
		model.addAttribute("waitingApplocationGroupList",waitingApplocationGroupList);
		
		List<Member> memberList = new ArrayList<Member>();
		memberList = memberService.selectAllMemberList();
//		log.debug("memberList = {}" ,memberList);
		model.addAttribute("memberList",memberList);
		
		Member member = (Member)authentication.getPrincipal();
		
		String apploginId ="";
		String apploginRole ="";
		
		for(ApplocationGroup app: acceptApplocationGroupList) {
			
			if(member.getId().equals(app.getMemberId())){
				log.debug("테스트");
				apploginId = app.getMemberId();
				apploginRole = String.valueOf(app.getRole());
				break;
			}
				
		}
		
		List<Map<String,Object>> memberAuthorityInfoList = new ArrayList<Map<String,Object>>();
		
		for(ApplocationGroup a : acceptApplocationGroupList) {
			Map<String, Object> memberAuthorityInfo = new HashMap<String, Object>();
			memberAuthorityInfo.put("memberId", a.getMemberId());
			memberAuthorityInfo.put("joinRegDate", a.getJoinRegDate());
			
			String memberAuthorities = "";
			List<String> memberAuthorityList = gwAdminService.selectMemberAutorities(a.getMemberId());
			for(String auth : memberAuthorityList) {
				memberAuthorities += ", " + auth;
			}
				memberAuthorityInfo.put("authority", memberAuthorities);
				memberAuthorityInfoList.add(memberAuthorityInfo);
			}
		
		log.debug("memberAuthorityInfoList = {}", memberAuthorityInfoList);
		model.addAttribute("memberAuthorityInfoList",memberAuthorityInfoList);
		
		log.debug("member.getId() = {}" ,member.getId());
		log.debug("apploginId = {}" ,apploginId);
		log.debug("apploginRole = {}" ,apploginRole);
		
		model.addAttribute("apploginRole",apploginRole);
		
		
		List<Authorities> authList = gwAdminService.selectAllAuthoritiesList(groupNo);
		log.debug("authList ={}",authList);

		Set<String> set = new HashSet<>();

		for(Authorities aut: authList) {
			set.add(aut.getMemberId());
		}
		
		Stream<String> setS = set.stream(); 
		setS.forEach(out -> log.debug("out +  ={}",out + " ")); 
		//그대로 set 자체로 출력하면 중복이 제거된 데이터만 
		// 출력되는 것을 확인할 수 있다.
		
		String [] newArr = new String [set.size()]; 
		Iterator<String> it = set.iterator();
		for(int i = 0; i < newArr.length; i++ ) { 
			newArr[i] = it.next(); 
			log.debug("newArr[i] ={} ",newArr[i] + " "); 
			} 
		//위 처럼 새로운 배열을 만들어서 다시 set으로 넣어주면 
		// 다시 배열로도 사용할 수 있다


			

//		log.debug("authentication.getPrincipal() = {}" ,member.getId());

		return "gw/admin/memberManager";
		
	}
	
	@GetMapping("/groupManager.do")
	public String groupManager(int groupNo,Model model,Authentication authentication) {
		groupwareHeaderSet(groupNo, model, authentication);
		model.addAttribute("groupNo", groupNo);
		
		List<ApplocationGroup> acceptApplocationGroupList = new ArrayList<ApplocationGroup>();
		acceptApplocationGroupList = gwAdminService.selectAllAcceptGroupMemberList(groupNo);
//		log.debug("acceptApplocationGroupList = {} ",acceptApplocationGroupList);
		model.addAttribute("acceptApplocationGroupList",acceptApplocationGroupList);
		
		
		List<IdNickName> chartIdNickNameList = new ArrayList<IdNickName>();
		chartIdNickNameList = gwAdminService.selectChartIdNickNameList();
//		log.debug("chartIdNickNameList = {}" ,chartIdNickNameList);
		 model.addAttribute("chartIdNickNameList",chartIdNickNameList);

		 
		 List<TdlMemberCount> checkedToDoList = new ArrayList<TdlMemberCount>() ;
		checkedToDoList = gwAdminService.selectcheckedToDoList(groupNo);
//		log.debug("checkedToDoList = {}" ,checkedToDoList);
		model.addAttribute("checkedToDoList",checkedToDoList);

		List<TdlMonthlyData> tdlMonthlyDataList = new ArrayList<TdlMonthlyData>();
		tdlMonthlyDataList = gwAdminService.selectTdlMonthlyDataList(groupNo);
//		log.debug("tdlMonthlyDataList = {}" ,tdlMonthlyDataList);
		model.addAttribute("tdlMonthlyDataList",tdlMonthlyDataList);
		
		List<TdlMonthlyData> tdlMonthlyMemberCountList = new ArrayList<TdlMonthlyData>();
		tdlMonthlyMemberCountList =gwAdminService.selectTdlMonthlyMemberCountList(groupNo);
//		log.debug("tdlMonthlyMemberCountList = {}" ,tdlMonthlyMemberCountList);

		List<Map<String,Object>> totalTdlAvgltList = new ArrayList<>();
			for(TdlMonthlyData tdl : tdlMonthlyMemberCountList ) {
			Map<String,Object> tdlMonthlyMemberCountMap = new HashMap<String, Object>();
			tdlMonthlyMemberCountMap.put("monthlyData",tdl.getMonthlyData());
			tdlMonthlyMemberCountMap.put("avg",(tdl.getCount() / tdl.getMemberCount()));
			totalTdlAvgltList.add(tdlMonthlyMemberCountMap);
			}
			
		//	log.debug("totalTdlAvgltList = {}" ,totalTdlAvgltList);
		
		
			
			model.addAttribute("totalTdlAvgltList",totalTdlAvgltList);
		
		return "gw/admin/groupManager";
		
	}

	
	@ResponseBody
	@GetMapping("/groupAccept.do")
	public ResponseEntity<?> groupAccept(HttpServletRequest request, Model model,Authentication authentication,
			@RequestParam Map<String, String>  idList) {
		//groupwareHeaderSet(groupNo, model, authentication);
		
		
	
		String groupNo = idList.get("groupNo");
		String str = idList.get("idList");
		
	
		int groupPool= gwAdminService.selectGwGroupPool(groupNo);
		

		int groupCount = gwAdminService.selectGwGroupCount(groupNo);

		
		
		List<String> idlist = Arrays.asList(str.split(","));		
		

		Map<String, Object> param = new HashMap<String,Object>();
		param.put("groupNo",idList.get("groupNo"));
		param.put("idList",idlist);
	
		String msg ="";
        Map<String, Object> map = new HashMap<>();
	
		if(groupPool - groupCount >= idlist.size()) {
			try {
				int result = gwAdminService.updategroupAcceptByList(param);
				
				msg="수정 성공!";
				map.put("msg", msg);
				for(String id : idlist) {
					Map<String, Object> param2 = new HashMap<String, Object>();
					param2.put("id", id);
					param2.put("groupNo", groupNo);
					
					result = gwAdminService.insertMemberAuthority(param2);
				}
				
			} catch (Exception e) {
				msg="수정 실패";
				map.put("msg", msg);
			}
			
			
//			log.debug("count = {}" ,groupPool - groupCount <= idlist.size());
//			log.debug("result = {}" , result);
			return ResponseEntity.ok(map);
		}else {
			
			msg="정원" + (groupCount+"/"+groupPool);
			map.put("msg", msg);
			return ResponseEntity.ok(map);
		}
	}
	
	//가입거절
	@ResponseBody
	@GetMapping("/groupRefuse.do")
	public ResponseEntity<?> groupRefuse(HttpServletRequest request, Model model,Authentication authentication,
			@RequestParam Map<String, String>  idList) {
		//groupwareHeaderSet(groupNo, model, authentication);
	
		String groupNo = idList.get("groupNo");
		String str = idList.get("idList");
	
		int groupPool= gwAdminService.selectGwGroupPool(groupNo);
//		log.debug("groupPool ={}" , groupPool);
		

		int groupCount = gwAdminService.selectGwGroupCount(groupNo);
//		log.debug("groupCount ={}" , groupCount);

		List<String> idlist = Arrays.asList(str.split(","));		
		
		Map<String, Object> param = new HashMap<String,Object>();
		param.put("groupNo",idList.get("groupNo"));
		param.put("idList",idlist);
//		log.debug("idListLength = {}",idlist.size());
	
		String msg ="";
        Map<String, Object> map = new HashMap<>();

        int result = gwAdminService.deletegroupRefuseByList(param);
//			log.debug("result = {}" , result);
			msg="가입거절 성공!";
			map.put("msg", msg);
			return ResponseEntity.ok(map);
		}
//		그룹웨어 멤버 추방
			@PostMapping("/memberDelete.do")
		    public String memberDelete(@RequestParam int groupNo, @RequestParam String gwDeleteMember,RedirectAttributes redirectAttr,HttpServletRequest request, Model model,Authentication authentication) {
				
				
				Map<String, Object> param = new HashMap<>();
				param.put("groupNo", groupNo);
				param.put("gwDeleteMember", gwDeleteMember);
				try {
					int result = gwAdminService.deleteGwMember(param);
					int result2 = gwAdminService.deleteGroupAuthorities(param);

					redirectAttr.addFlashAttribute("msg", "멤버를 추방하였습니다!");
					
		    	} catch (InvalidParameterException e) {
		    		log.error(e.getMessage(), e);
		    		redirectAttr.addFlashAttribute("msg", e.getMessage());
		    		
				} catch (Exception e) {
					log.error("멤버삭제 오류!", e);
					throw e;
				}
				return "redirect:/gw/admin/memberManager.do?groupNo="+groupNo;
		    }
		    
	@PostMapping("/memberUpdate.do")
	public String memberUpdate(@RequestParam String memberId,@RequestParam String memberRole,int groupNo,HttpServletRequest request, Model model,Authentication authentication,RedirectAttributes redirectAttr) {
		//String selectRole = request.getParameter("memberRole");
		//String memberId = request.getParameter("memberId");
		
		
		
		log.debug("groupNo ={}" ,groupNo);
		log.debug("memberId ={}" ,memberId);
		
		log.debug("selectRole ={}" ,memberRole);
		
		Map<String,Object> param = new HashMap<>();
		param.put("memberRole", memberRole);
		param.put("memberId", memberId);
		param.put("groupNo", groupNo);
		

		String memberAuthorities = gwAdminService.selectMemberAuthorities(memberId);
		
		
		if(memberRole.equals("MEMBER")) {
			if(memberAuthorities.contains("MANAGER")) {
				param.put("type", "delete");
				param.put("deleteRole", "MANAGER");
				int result = gwAdminService.insertMemberAuthority(param);
				param.put("type", "insert");
				result = gwAdminService.insertMemberAuthority(param);
			}else {
				param.put("type", "insert");
				int result = gwAdminService.insertMemberAuthority(param);
			}
		}else if(memberRole.equals("MANAGER")) {
			if(memberAuthorities.contains("MEMBER")) {
				param.put("type", "delete");
				param.put("deleteRole", "MEMBER");
				int result = gwAdminService.insertMemberAuthority(param);
				param.put("type", "insert");
				result = gwAdminService.insertMemberAuthority(param);
			}else {
				param.put("type", "insert");
				int result = gwAdminService.insertMemberAuthority(param);
			}
		}else {
			
		}
		
		
		return "redirect:/gw/admin/memberManager.do?groupNo=" + groupNo;
	}

	public void groupwareHeaderSet(int groupNo, Model model, Authentication auth) {
    Member loginMember = (Member) auth.getPrincipal();
    Group myGroup = gwService.selectMyGroup(groupNo);
    List<Member> myGroupMemberList = gwService.selectAllGroupMembers(groupNo);

    
    
    
    List<Group> myGroupList = gwService.selectAllMyGroup(loginMember.getId());
    List<Attachment> groupBannerAttachList = gwService.selectAllGroupBannerAttach();
    List<String> memberProfileRenamedFilenameList = new ArrayList<String>();
    for(Member m : myGroupMemberList) {
        String memberProfileRenamedFilename = gwService.selectMemberProfileRenamedFilename(m.getId());
        memberProfileRenamedFilenameList.add(memberProfileRenamedFilename);
    }
    List<Board> boardList = gwService.selectAllBoardRoomByGroupNo(groupNo);
    model.addAttribute("boardList", boardList);
    List<ChatRoom> chattingChannelList = gwService.selectAllChatRoomByGroupNo(groupNo);
    
    Map<String,Object> param = new HashMap<>();
	param.put("memberId", loginMember.getId());
	param.put("groupNo", groupNo);
    
    model.addAttribute("currGroupNo", groupNo);
    model.addAttribute("myGroup", myGroup);
    model.addAttribute("myGroupMemberList", myGroupMemberList);
    model.addAttribute("chattingChannelList", chattingChannelList);
    model.addAttribute("profile", gwService.selectMemberProfileRenamedFilename(loginMember.getId()));
    model.addAttribute("memberProfileRenamedFilenameList", memberProfileRenamedFilenameList);
    model.addAttribute("groupBannerAttachList", groupBannerAttachList);
    model.addAttribute("myGroupList", myGroupList);
	}
}
