package com.kh.cosmos.groupware.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.service.GroupwareService;
import com.kh.cosmos.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
@Controller
@Slf4j
@RequestMapping("/gw/admin")
public class GwAdminController {
	
	@Autowired
	private GroupwareService gwService ;
	
	
	@GetMapping("/memberManager.do")
	public String memberManager(Model model, int groupNo,Authentication authentication) {
		groupwareHeaderSet(groupNo, model, authentication);
		model.addAttribute("groupNo", groupNo);
		return "gw/admin/memberManager";
		
	}
	
	@GetMapping("/groupManager.do")
	public String groupManager(int groupNo,Model model,Authentication authentication) {
		groupwareHeaderSet(groupNo, model, authentication);
		model.addAttribute("groupNo", groupNo);
		return "gw/admin/groupManager";
		
	}

	
	@PostMapping("/groupAccept.do")
	public String groupAccept(@RequestParam int groupNo,HttpServletRequest request, Model model,Authentication authentication) {
		groupwareHeaderSet(groupNo, model, authentication);
		String checkValid = request.getParameter("checkValid");
		String checkYN = request.getParameter("checkYN");
		 
		log.debug("check = {}" , checkValid);
		log.debug("checkYN = {}" , checkYN);
		return "gw/admin/memberManager";
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
