package com.kh.cosmos.groupware.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.cosmos.common.CosmosUtils;
import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.board.model.service.BoardService;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.board.model.vo.Post;
import com.kh.cosmos.groupware.chat.model.vo.ChatRoom;
import com.kh.cosmos.groupware.service.GroupwareService;
import com.kh.cosmos.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/gw")
public class GwController {
	
	@Autowired
	private GroupwareService gwService;
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/gw.do")
	public String gw(@RequestParam int groupNo, @RequestParam(required=false) String msg, Model model, Authentication auth) {
		Member loginMember = (Member) auth.getPrincipal();
		Group myGroup = gwService.selectMyGroup(groupNo);
		List<Member> myGroupMemberList = gwService.selectAllGroupMembers(groupNo);
		log.debug("msg = {}", msg);
		
		
		List<Group> myGroupList = gwService.selectAllMyGroup(loginMember.getId());
		List<Attachment> groupBannerAttachList = gwService.selectAllGroupBannerAttach();
		List<String> memberProfileRenamedFilenameList = new ArrayList<String>();
		for(Member m : myGroupMemberList) {
			String memberProfileRenamedFilename = gwService.selectMemberProfileRenamedFilename(m.getId());
			memberProfileRenamedFilenameList.add(memberProfileRenamedFilename);
		}

		List<ChatRoom> chattingChannelList = gwService.selectAllChatRoomByGroupNo(groupNo);
		List<Board> boardList = gwService.selectAllBoardRoomByGroupNo(groupNo);
		
		List<Board> groupNoticeBoardList = gwService.selectAllBoardRoomByGroupNotice(groupNo);
		int num = 0;
		for(Board noticeNo : groupNoticeBoardList) {
			num = noticeNo.getBoardNo();
		}
		List<Post> noticePostList = boardService.selectAllPostInNotice(num, 5, 1);
		model.addAttribute("noticePostList",noticePostList);
		
		model.addAttribute("currGroupNo", groupNo);
		model.addAttribute("myGroup", myGroup);
		model.addAttribute("myGroupMemberList", myGroupMemberList);
		model.addAttribute("chattingChannelList", chattingChannelList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("profile", gwService.selectMemberProfileRenamedFilename(loginMember.getId()));
		model.addAttribute("memberProfileRenamedFilenameList", memberProfileRenamedFilenameList);
		model.addAttribute("groupBannerAttachList", groupBannerAttachList);
		model.addAttribute("myGroupList", myGroupList);
		
		model.addAttribute("msg",msg);
		
		model.addAttribute("title", "메인화면");
		return "gw/gw";
	}
}
