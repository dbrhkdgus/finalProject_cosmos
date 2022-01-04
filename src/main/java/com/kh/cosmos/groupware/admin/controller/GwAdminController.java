package com.kh.cosmos.groupware.admin.controller;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.service.GroupService;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.admin.model.service.GwAdminService;
import com.kh.cosmos.groupware.admin.model.vo.idList;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.fileBoard.vo.IdNickName;
import com.kh.cosmos.groupware.service.GroupwareService;
import com.kh.cosmos.member.model.service.MemberService;
import com.kh.cosmos.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;
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
		
		log.debug("member.getId() = {}" ,member.getId());
		log.debug("apploginId = {}" ,apploginId);
		log.debug("apploginRole = {}" ,apploginRole);
		
		model.addAttribute("apploginRole",apploginRole);

//		log.debug("authentication.getPrincipal() = {}" ,member.getId());

		return "gw/admin/memberManager";
		
	}
	
	@GetMapping("/groupManager.do")
	public String groupManager(int groupNo,Model model,Authentication authentication) {
		groupwareHeaderSet(groupNo, model, authentication);
		model.addAttribute("groupNo", groupNo);
		
		List<ApplocationGroup> acceptApplocationGroupList = new ArrayList<ApplocationGroup>();
		acceptApplocationGroupList = gwAdminService.selectAllAcceptGroupMemberList(groupNo);
		log.debug("acceptApplocationGroupList = {} ",acceptApplocationGroupList);
		model.addAttribute("acceptApplocationGroupList",acceptApplocationGroupList);
		
		
		List<IdNickName> chartIdNickNameList = new ArrayList<IdNickName>();
		chartIdNickNameList = gwAdminService.selectChartIdNickNameList();
		log.debug("chartIdNickNameList = {}" ,chartIdNickNameList);
		 model.addAttribute("chartIdNickNameList",chartIdNickNameList);
		 
		
		 
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
	
		  //
		if(groupPool - groupCount >= idlist.size()) {
			msg="수정 성공!";
			map.put("msg", msg);
//			log.debug("count = {}" ,groupPool - groupCount <= idlist.size());
			int result = gwAdminService.updategroupAcceptByList(param);
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
		
		try {
			int result = gwAdminService.updateMemberRole(param);
			redirectAttr.addFlashAttribute("msg", "권한을 수정하였습니다!");
		} catch (Exception e) {
			log.error("권한수정 오류!", e);
			redirectAttr.addFlashAttribute("msg", e.getMessage());
			throw e;
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
