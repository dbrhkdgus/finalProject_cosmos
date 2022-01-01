package com.kh.cosmos.groupware.app.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.app.model.service.AppService;
import com.kh.cosmos.groupware.app.model.vo.TDL;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.service.GroupwareService;
import com.kh.cosmos.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/gw/app")
public class AppController {

	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@Autowired
	private GroupwareService gwService;
	
	@Autowired
	private AppService appService;
	
	@GetMapping("/ladder.do")
	public String ladder(int groupNo, Model model, Authentication auth) {
		groupwareHeaderSet(groupNo, model, auth);
		return "gw/app/ladder";
	}
	@GetMapping("/TDL.do")
	public String toDoList(int groupNo, Model model, Authentication auth) {
		groupwareHeaderSet(groupNo, model, auth);
		Map<String, Object> param = new HashMap<String, Object>();
		Member loginMember = (Member) auth.getPrincipal();
		param.put("groupNo", groupNo);
		param.put("id", loginMember.getId());
		List<TDL> tdlList = appService.selectAlltdlListByParam(param);
		model.addAttribute("tdlList",tdlList);
		model.addAttribute("loginMember",loginMember);
		return "gw/app/TDL";
	}
	
	@PostMapping("/insertTDL.do")
	public String insertTDL(TDL tdl, int groupNo, Model model, Authentication auth, RedirectAttributes redirectAttr) {
		groupwareHeaderSet(groupNo, model, auth);
		log.debug("tdl = {}",tdl);
		Member loginMember = (Member) auth.getPrincipal();
		
		int result = appService.insertTdlByGroup(tdl);
		
		redirectAttr.addFlashAttribute("msg", result > 0 ? "등록되었습니다." : "등록실패");
		return "redirect:/gw/app/TDL.do?groupNo="+groupNo;
	}
	
	@ResponseBody
	@GetMapping("/updateTDL.do")
	public void updateTDL(int tdlNo, int groupNo, Model model, String check, Authentication auth, RedirectAttributes redirectAttr) {
		groupwareHeaderSet(groupNo, model, auth);
		Map<String, Object> param = new HashMap<String, Object>();
		log.debug("check = {}",check);
		param.put("check", check);
		log.debug("tdlNo = {}",tdlNo);
		param.put("tdlNo", tdlNo);
		log.debug("groupNo = {}",groupNo);
		Member loginMember = (Member) auth.getPrincipal();
		
		int result = appService.updateTDL(param);
		
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

		List<ChatRoom> chattingChannelList = gwService.selectAllChatRoomByGroupNo(groupNo);
		List<Board> boardList = gwService.selectAllBoardRoomByGroupNo(groupNo);
		model.addAttribute("boardList", boardList);
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
