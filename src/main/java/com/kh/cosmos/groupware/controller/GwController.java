package com.kh.cosmos.groupware.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.cosmos.common.CosmosUtils;
import com.kh.cosmos.common.attachment.model.vo.Attachment;
import com.kh.cosmos.group.model.vo.ApplocationGroup;
import com.kh.cosmos.group.model.vo.Group;
import com.kh.cosmos.groupware.board.model.service.BoardService;
import com.kh.cosmos.groupware.board.model.vo.Board;
import com.kh.cosmos.groupware.board.model.vo.Post;
import com.kh.cosmos.groupware.board.model.vo.PostWithBoardName;
import com.kh.cosmos.groupware.calendar.model.vo.Schedule;
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
	@Autowired
	ServletContext application;
	
	@GetMapping("/gw.do")
	public String gw(@RequestParam int groupNo, @RequestParam(required=false) String msg, Model model, Authentication auth) {
		Member loginMember = (Member) auth.getPrincipal();
		Group myGroup = gwService.selectMyGroup(groupNo);
		List<Member> myGroupMemberList = gwService.selectAllGroupMembers(groupNo);
		log.debug("msg = {}", msg);
		
		
		List<Group> myGroupList = gwService.selectAllMyGroup(loginMember.getId());
		List<Attachment> groupBannerAttachList = gwService.selectAllGroupBannerAttach();
		Attachment groupwareMainBanner = gwService.selectGropwareBannerByGroupNo(groupNo);
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
		List<Post> noticePostList = boardService.selectAllPostInBoard(num, 5, 0);
		model.addAttribute("noticePostList",noticePostList);
		
	    Map<String,Object> param = new HashMap<>();
		param.put("memberId", loginMember.getId());
		param.put("groupNo", groupNo);
		
	    
	    
	    List<Schedule> todayScheduleList = gwService.selectTodayScheduleListByGroupNo(groupNo);
	    param.put("groupNo", groupNo);
	    param.put("noticeBoardNo", num);
	    List<PostWithBoardName> newPostsList = gwService.selectNewPostsListByParam(param);
	    String expend = "";
	    try {
	    	expend = gwService.selectMemberExpendCheck(loginMember.getId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			int result = gwService.insertDefaultExpendCheck(loginMember.getId());
			if(result > 0) {
				expend = gwService.selectMemberExpendCheck(loginMember.getId());
			}
		}
	    
	    model.addAttribute("expend", expend);
	    model.addAttribute("groupwareMainBanner",groupwareMainBanner);
	    model.addAttribute("newPostsList",newPostsList);
	    model.addAttribute("todayScheduleList",todayScheduleList);
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
	@ResponseBody
	@PostMapping("/updateGropwareMainBanner.do")
	public int updateGropwareMainBanner(int groupNo,String memberId, @RequestParam(value="ev_display", required=false) MultipartFile upFile) {
		int result = 0;
		try {
			 String saveDirectory = application.getRealPath("/resources/upFile/group");
			 log.debug("saveDirectory = {}", saveDirectory);
		 
			 log.debug("upfile = {}", upFile);
		 
		 if(!upFile.isEmpty() && upFile.getSize() != 0) {
			 log.debug("upFile = {}", upFile);
			 log.debug("upFile.name = {}",upFile.getOriginalFilename());
			 log.debug("upFile.size = {}",upFile.getSize());
		 
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
			 attach.setMemberId(memberId);
			 attach.setGroupNo(groupNo);
			 result = gwService.updateGroupwareMainBanner(attach);
		 }
		 
		 } catch (Exception e){
		 	
		 }
		
		return result;
		}
	
	@ResponseBody
	@GetMapping("/updateExpendCheck.do")
	public void updateExpendCheck(Authentication auth) {
		Member loginMember = (Member) auth.getPrincipal();
		String currExpendCheck = gwService.selectMemberExpendCheck(loginMember.getId());
		if(currExpendCheck.equals("Y")) {
			Map<String, String> param = new HashMap<String, String>();
			param.put("memberId", loginMember.getId());
			param.put("expend", "N");
			int result = gwService.updateMemberExpendCheck(param);
		}else {
			Map<String, String> param = new HashMap<String, String>();
			param.put("memberId", loginMember.getId());
			param.put("expend", "Y");
			int result = gwService.updateMemberExpendCheck(param);
		}
		
	}
}
